import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/feature/infrastructure/entities/movies.dart';
import 'package:movie_app/feature/infrastructure/repository/movie_repository.dart';

part 'animation_event.dart';
part 'animation_state.dart';

class AnimationMovieBloc extends Bloc<AnimationEvent, AnimationState> {
  AnimationMovieBloc({required this.iMovieRepository})
      : super(AnimationInitial()) {
    on<GetAnimationMovies>((event, emit) async {
      emit(AnimationLoading());

      final response = await iMovieRepository.getAnimationMovies(
          animationId: event.animationId);
      response.fold((moviesReponse) {
        emit(AnimationLoaded(movieResponse: moviesReponse));
      }, (failure) {
        emit(AnimationError(message: failure.reason));
      });
    });
  }
  final IMovieRepository iMovieRepository;
}
