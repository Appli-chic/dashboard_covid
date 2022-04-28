import 'package:json_annotation/json_annotation.dart';

part 'covid_continent.g.dart';

@JsonSerializable()
class CovidContinent {
  String? continent;
  int? cases;
  int? deaths;
  int? active;
  int? recovered;

  CovidContinent({
    this.continent,
    this.cases,
    this.deaths,
    this.active,
    this.recovered,
  });

  factory CovidContinent.fromJson(Map<String, dynamic> json) =>
      _$CovidContinentFromJson(json);

  Map<String, dynamic> toJson() => _$CovidContinentToJson(this);
}
