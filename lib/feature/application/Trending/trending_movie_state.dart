part of 'trending_movie_bloc.dart';

abstract class TrendingState {}

class TrendingInitial extends TrendingState {}

class TrendingLoading extends TrendingState {}

class TrendingLoaded extends TrendingState {
  TrendingLoaded({required this.movieResponse});
  final MovieResponse movieResponse;
}

class TrendingError extends TrendingState {
  TrendingError({required this.message});
  final String message;
}
