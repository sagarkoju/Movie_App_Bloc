part of 'trending_movie_bloc.dart';

abstract class TrendingEvent {
  const TrendingEvent();
}

class GetTrendingMovies extends TrendingEvent {
  const GetTrendingMovies({this.page, this.oldMovieResponse});
  final int? page;
  final MovieResponse? oldMovieResponse;
}
