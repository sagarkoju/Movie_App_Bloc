part of 'animation_bloc.dart';

abstract class AnimationState {}

class AnimationInitial extends AnimationState {}

class AnimationLoading extends AnimationState {}

class AnimationLoaded extends AnimationState {
  AnimationLoaded({required this.movieResponse});
  final MovieResponse movieResponse;
}

class AnimationError extends AnimationState {
  AnimationError({required this.message});
  final String message;
}
