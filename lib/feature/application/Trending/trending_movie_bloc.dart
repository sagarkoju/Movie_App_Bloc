import 'package:bloc/bloc.dart';
import 'package:movie_app/feature/infrastructure/entities/movies.dart';
import 'package:movie_app/feature/infrastructure/repository/movie_repository.dart';

part 'trending_movie_event.dart';
part 'trending_movie_state.dart';

class TrendingMovieBloc extends Bloc<TrendingEvent, TrendingState> {
  TrendingMovieBloc({required this.iMovieRepository})
      : super(TrendingInitial()) {
    on<GetTrendingMovies>((event, emit) async {
      if (event.page == null) {
        emit(TrendingLoading());
      }

      final response =
          await iMovieRepository.getTrendingMovies(page: event.page);
      response.fold((moviesReponse) {
        final oldData = event.oldMovieResponse?.results ?? [];
        final newMoviesList = moviesReponse.results;
        final newData = oldData + newMoviesList;
        emit(TrendingLoaded(
          movieResponse: event.page == null
              ? moviesReponse
              : event.oldMovieResponse!.copyWith(
                  results: newData,
                  page: moviesReponse.page,
                ),
        ));
      }, (failure) {
        emit(TrendingError(message: failure.reason));
      });
    });
  }
  final IMovieRepository iMovieRepository;
}
