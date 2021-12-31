

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:async/async.dart';

part 'entity.g.dart';

class Entity<T, B> = _EntityBase<T, B> with _$Entity;

abstract class _EntityBase<T, B> with Store {
  Future<T> Function()? _future;

  CancelableOperation<T>? _operation;

  VoidCallback? _pendingCallback;
  VoidCallback? _completedCallback;
  void Function(T data)? _fulfilledCallback;
  void Function(B error)? _rejectedCallback;

  final bool _queue;
  final bool _pressure;

  _EntityBase({
    Future<T> Function()? future,
    bool queue = true,
    bool pressure = false,
  })  : _future = future,
        _queue = queue,
        _pressure = pressure;

  @readonly
  bool _pending = false;

  @readonly
  bool _fulfilled = false;

  @readonly
  bool _rejected = false;

  @readonly
  T? _data;

  @readonly
  B? _error;

  @action
  _fullfill(T value) {
    _pending = false;
    _fulfilled = true;
    _rejected = false;
    _error = null;
    _data = value;
  }

  @action
  _reject(error) {
    _pending = false;
    _fulfilled = false;
    _rejected = true;
    _data = null;
    _error = error;
  }

  @action
  _pend() {
    _pending = true;
    _fulfilled = false;
    _rejected = false;
    _data = null;
    _error = null;
  }

  void put(Future<T> Function() future) {
    _future = future;
  }

  void on({
    VoidCallback? pending,
    void Function(T data)? fulfilled,
    void Function(B error)? rejected,
    VoidCallback? completed,
  }) {
    if (pending != null) {
      _pendingCallback = pending;
    }

    if (fulfilled != null) {
      _fulfilledCallback = fulfilled;
    }

    if (rejected != null) {
      _rejectedCallback = rejected;
    }

    if (completed != null) {
      _completedCallback = completed;
    }
  }

  Future<T>? refresh() {
    return _refresh();
  }

  Future<T>? backgroundRefresh() {
    return _refresh(background: true);
  }

  Future<T>? refreshIfAbsent() {
    return _refresh(ifAbsent: true);
  }

  Future<T>? backgroundRefreshIfAbsent() {
    return _refresh(background: true, ifAbsent: true);
  }

  Future<T>? fire(
    Future<T> Function() future, {
    bool put = true,
  }) {
    return _fire(future, put: put);
  }

  Future<T>? backgroundFire(
    Future<T> Function() future, {
    bool put = true,
  }) {
    return _fire(
      future,
      put: put,
      background: true,
    );
  }

  Future<T>? fireIfAbsent(
    Future<T> Function() future, {
    bool put = true,
  }) {
    return _fire(
      future,
      put: put,
      ifAbsent: true,
    );
  }

  Future<T>? backgroundFireIfAbsent(
    Future<T> Function() future, {
    bool put = true,
  }) {
    return _fire(
      future,
      put: put,
      ifAbsent: true,
      background: true,
    );
  }

  Future<T>? _refresh({
    bool background = false,
    bool ifAbsent = false,
  }) {
    if (ifAbsent && _data != null) return Future.value(_data);

    assert(_future != null);
    return _request(_future!, background: background);
  }

  Future<T>? _fire(
    Future<T> Function() future, {
    bool ifAbsent = false,
    bool put = true,
    bool background = false,
  }) {
    if (ifAbsent && _data != null) Future.value(_data);

    if (put) this.put(future);
    return _request(future, background: background);
  }

  Future<T>? _request(
    Future<T> Function() future, {
    bool background = false,
  }) {
    if (_queue && _pending) return null;

    if (!_pressure && _pending) _operation?.cancel();

    if (!background) {
      _pend();
      _pendingCallback?.call();
    }

    _operation = CancelableOperation.fromFuture(future());

    return _operation!.value
      ..whenComplete(() {
        _completedCallback?.call();
        _operation = null;
      })
      ..then((value) {
        _fullfill(value);
        _fulfilledCallback?.call(value);
      })
      ..catchError((error) {
        _reject(error);
        _rejectedCallback?.call(error);
      });
  }
}
