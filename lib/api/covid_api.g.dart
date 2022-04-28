// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'covid_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _CovidApi implements CovidApi {
  _CovidApi(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://corona.lmao.ninja/v2/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<CovidContinent>> getCovidForAllContinents() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<CovidContinent>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/continents',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => CovidContinent.fromJson(i as Map<String, dynamic>))
        .toList();
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
