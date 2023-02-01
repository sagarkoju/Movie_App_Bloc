part of 'animation_bloc.dart';

abstract class AnimationEvent {
  const AnimationEvent();
}

class GetAnimationMovies extends AnimationEvent {
  const GetAnimationMovies({
    required this.animationId,
  });
  final int animationId;
}
