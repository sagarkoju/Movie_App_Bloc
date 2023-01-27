// import 'package:hive/hive.dart';

import 'package:hive/hive.dart';
import 'package:movie_app/feature/infrastructure/entities/movies.dart';

class HiveAdapter {
  /// Register all hive adapters inside this init function
  ///
  static void init() {
    Hive
      ..registerAdapter(MovieResponseAdapter())
      ..registerAdapter(MoviesAdapter());
  }
}
