// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'private_apis.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _PrivateApis implements PrivateApis {
  _PrivateApis(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://promoting.joe13th.com:8080/';
  }

  final Dio _dio;

  String? baseUrl;

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
