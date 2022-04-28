import 'package:dashboard/model/covid_continent.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'covid_api.g.dart';

@RestApi(baseUrl: "https://corona.lmao.ninja/v2/")
abstract class CovidApi {
  factory CovidApi(Dio dio, {String baseUrl}) = _CovidApi;

  @GET("/continents")
  Future<List<CovidContinent>> getCovidForAllContinents();
}
