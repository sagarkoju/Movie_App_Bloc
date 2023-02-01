import 'package:get_it/get_it.dart';
import 'package:movie_app/app_setup/dio/dio_client.dart';
import 'package:movie_app/feature/application/Animation/animation_bloc.dart';
import 'package:movie_app/feature/application/Trending/trending_movie_bloc.dart';

import 'package:movie_app/feature/infrastructure/repository/movie_repository.dart';

GetIt inject = GetIt.instance;

void initDependencyInjection() {
  registerClient();

  registerRepository();

  registerBloc();
}

//register the network client
void registerClient() {
  inject.registerSingleton(dioClient());
}

//register all the repository
void registerRepository() {
  inject.registerLazySingleton<IMovieRepository>(
    () => MovieRepository(
      dio: inject(),
    ),
  );
}

//register all the blocs
void registerBloc() {
  inject
    ..registerLazySingleton(
      () => TrendingMovieBloc(iMovieRepository: inject()),
    )
    ..registerLazySingleton(
        () => AnimationMovieBloc(iMovieRepository: inject()));
}
