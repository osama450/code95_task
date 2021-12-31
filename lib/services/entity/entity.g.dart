// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Entity<T, B> on _EntityBase<T, B>, Store {
  final _$_pendingAtom = Atom(name: '_EntityBase._pending');

  bool get pending {
    _$_pendingAtom.reportRead();
    return super._pending;
  }

  @override
  bool get _pending => pending;

  @override
  set _pending(bool value) {
    _$_pendingAtom.reportWrite(value, super._pending, () {
      super._pending = value;
    });
  }

  final _$_fulfilledAtom = Atom(name: '_EntityBase._fulfilled');

  bool get fulfilled {
    _$_fulfilledAtom.reportRead();
    return super._fulfilled;
  }

  @override
  bool get _fulfilled => fulfilled;

  @override
  set _fulfilled(bool value) {
    _$_fulfilledAtom.reportWrite(value, super._fulfilled, () {
      super._fulfilled = value;
    });
  }

  final _$_rejectedAtom = Atom(name: '_EntityBase._rejected');

  bool get rejected {
    _$_rejectedAtom.reportRead();
    return super._rejected;
  }

  @override
  bool get _rejected => rejected;

  @override
  set _rejected(bool value) {
    _$_rejectedAtom.reportWrite(value, super._rejected, () {
      super._rejected = value;
    });
  }

  final _$_dataAtom = Atom(name: '_EntityBase._data');

  T? get data {
    _$_dataAtom.reportRead();
    return super._data;
  }

  @override
  T? get _data => data;

  @override
  set _data(T? value) {
    _$_dataAtom.reportWrite(value, super._data, () {
      super._data = value;
    });
  }

  final _$_errorAtom = Atom(name: '_EntityBase._error');

  B? get error {
    _$_errorAtom.reportRead();
    return super._error;
  }

  @override
  B? get _error => error;

  @override
  set _error(B? value) {
    _$_errorAtom.reportWrite(value, super._error, () {
      super._error = value;
    });
  }

  final _$_EntityBaseActionController = ActionController(name: '_EntityBase');

  @override
  dynamic _fullfill(T value) {
    final _$actionInfo = _$_EntityBaseActionController.startAction(
        name: '_EntityBase._fullfill');
    try {
      return super._fullfill(value);
    } finally {
      _$_EntityBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _reject(dynamic error) {
    final _$actionInfo =
        _$_EntityBaseActionController.startAction(name: '_EntityBase._reject');
    try {
      return super._reject(error);
    } finally {
      _$_EntityBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _pend() {
    final _$actionInfo =
        _$_EntityBaseActionController.startAction(name: '_EntityBase._pend');
    try {
      return super._pend();
    } finally {
      _$_EntityBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
