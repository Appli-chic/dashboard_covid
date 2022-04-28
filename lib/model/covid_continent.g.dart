// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'covid_continent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CovidContinent _$CovidContinentFromJson(Map<String, dynamic> json) =>
    CovidContinent(
      continent: json['continent'] as String?,
      cases: json['cases'] as int?,
      deaths: json['deaths'] as int?,
      active: json['active'] as int?,
      recovered: json['recovered'] as int?,
    );

Map<String, dynamic> _$CovidContinentToJson(CovidContinent instance) =>
    <String, dynamic>{
      'continent': instance.continent,
      'cases': instance.cases,
      'deaths': instance.deaths,
      'active': instance.active,
      'recovered': instance.recovered,
    };
