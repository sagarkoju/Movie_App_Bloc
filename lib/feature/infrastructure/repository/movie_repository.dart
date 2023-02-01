import 'package:dio/dio.dart';
import 'package:movie_app/app_setup/app_endpoints/app_endpoint.dart';
import 'package:movie_app/core/failure.dart';
import 'package:movie_app/feature/infrastructure/entities/movies.dart';
import 'package:dartz/dartz.dart';

abstract class IMovieRepository {
  /// get trending movies of the day
  Future<Either<MovieResponse, Failure>> getTrendingMovies({
    int? page,
  });
  Future<Either<MovieResponse, Failure>> getAnimationMovies({
    int? page,
    required int animationId,
  });
}

class MovieRepository implements IMovieRepository {
  final Dio dio;

  MovieRepository({required this.dio});
  @override
  Future<Either<MovieResponse, Failure>> getTrendingMovies({
    int? page,
  }) async {
    try {
      final query = {
        'page': page ?? 1,
      };
      final response = await dio.get<Map<String, dynamic>>(
        MoviesEp.trendingMovies,
        queryParameters: query,
      );
      final json = Map<String, dynamic>.from(response.data!);
      final result = MovieResponse.fromJson(json);
      return Left(result);
    } on DioError catch (e) {
      return Right(e.toFailure);
    } catch (e) {
      return Right(Failure.fromException());
    }
  }

  @override
  Future<Either<MovieResponse, Failure>> getAnimationMovies(
      {int? page, required int animationId}) async {
    try {
      final query = {
        'page': page ?? 1,
        'with_genres': animationId,
      };
      final response = await dio.get<Map<String, dynamic>>(
        MoviesEp.animationMovies,
        queryParameters: query,
      );
      final json = Map<String, dynamic>.from(response.data!);
      final result = MovieResponse.fromJson(json);
      return Left(result);
    } on DioError catch (e) {
      return Right(e.toFailure);
    } catch (e) {
      return Right(Failure.fromException());
    }
  }
}
