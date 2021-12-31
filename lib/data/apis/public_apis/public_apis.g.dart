// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'public_apis.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _PublicApis implements PublicApis {
  _PublicApis(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://mocki.io/v1/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<UsersResponseModel> getUsers() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UsersResponseModel>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'beaa1746-b297-4522-80aa-595a13a9f0cf',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UsersResponseModel.fromJson(_result.data!);
    return value;
  }

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
