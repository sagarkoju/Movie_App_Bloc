// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:hive/hive.dart';
import 'package:movie_app/app_setup/hive/hive_box.dart';

part 'movies.g.dart';
part 'movies.freezed.dart';

@freezed
@HiveType(typeId: HiveBox.movieResponseBoxId)
class MovieResponse with _$MovieResponse {
  const factory MovieResponse({
    @HiveField(0) @Default(0) int page,
    @HiveField(1) @Default(<Movies>[]) List<Movies> results,
    @HiveField(2) @JsonKey(name: 'total_pages') @Default(0) int totalPages,
    @HiveField(3) @JsonKey(name: 'total_results') @Default(0) int totalResults,
    @HiveField(4)
    @JsonKey(name: 'production_companies')
    @Default(<ProductionCompanyResponse>[])
        List<ProductionCompanyResponse>? productioncompanies,
  }) = _MovieResponse;

  factory MovieResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseFromJson(json);
}

@freezed
@HiveType(typeId: HiveBox.movieBoxId)
class Movies with _$Movies {
  const factory Movies({
    @HiveField(0) bool? adult,
    @HiveField(1) @JsonKey(name: 'backdrop_path') String? backdropPath,
    @HiveField(2) @Default(0) int id,
    @HiveField(3) @JsonKey(name: 'original_language') String? originalLanguage,
    @HiveField(4) @JsonKey(name: 'original_title') String? originalTitle,
    @HiveField(5) String? overview,
    @HiveField(6) double? popularity,
    @HiveField(7) @JsonKey(name: 'poster_path') @Default('') String posterPath,
    @HiveField(8) @JsonKey(name: 'release_date') String? releaseDate,
    @HiveField(9) String? title,
    @HiveField(10) @JsonKey(name: 'vote_average') double? voteAverage,
    @HiveField(11) @JsonKey(name: 'vote_count') int? voteCount,
    @HiveField(12) String? status,
    @HiveField(13) String? tagline,
  }) = _Movies;

  factory Movies.fromJson(Map<String, dynamic> json) => _$MoviesFromJson(json);
}

@freezed
@HiveType(typeId: HiveBox.genreResponseBoxId)
class ProductionCompanyResponse with _$ProductionCompanyResponse {
  const factory ProductionCompanyResponse({
    @HiveField(0) @Default(0) int id,
    @HiveField(1) @JsonKey(name: 'logo_path') @Default('') String logopath,
    @HiveField(2) @Default('') String name,
    @HiveField(3)
    @JsonKey(name: 'origin_country')
    @Default('')
        String origincountry,
  }) = _ProductionCompanyResponse;

  factory ProductionCompanyResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompanyResponseFromJson(json);
}
