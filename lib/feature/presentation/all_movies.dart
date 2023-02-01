import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/app_setup/dependency_injection.dart';
import 'package:movie_app/core/components/movie_list_tile.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/feature/application/Animation/animation_bloc.dart';
import 'package:movie_app/feature/application/Trending/trending_movie_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class AllMoviesScreen extends StatefulWidget {
  const AllMoviesScreen({
    Key? key,
    required this.appbarTitle,
    this.isTap = true,
  }) : super(key: key);
  final String appbarTitle;
  final bool isTap;

  @override
  State<AllMoviesScreen> createState() => _AllMoviesScreenState();
}

class _AllMoviesScreenState extends State<AllMoviesScreen> {
  final _refreshController = RefreshController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.backgroundColor,
        title: Text(
          widget.appbarTitle,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: widget.isTap
          ? BlocBuilder<TrendingMovieBloc, TrendingState>(
              bloc: inject<TrendingMovieBloc>(),
              builder: (context, state) {
                final data =
                    state is TrendingLoaded ? state.movieResponse : null;
                return Column(
                  children: [
                    if (state is TrendingLoading)
                      const CircularProgressIndicator(),
                    if (state is TrendingLoaded)
                      Expanded(
                        child: SmartRefresher(
                          enablePullUp: true,
                          controller: _refreshController,
                          // ignore: prefer_const_constructors
                          footer: ClassicFooter(
                            loadingIcon: const CupertinoActivityIndicator(),
                            loadingText: 'Loading',
                            idleText: 'Loading',
                            idleIcon: const CupertinoActivityIndicator(),
                          ),
                          onLoading: () {
                            inject<TrendingMovieBloc>().add(
                              GetTrendingMovies(
                                page: state.movieResponse.page + 1,
                                oldMovieResponse: state.movieResponse,
                              ),
                            );

                            Future.delayed(const Duration(seconds: 2),
                                _refreshController.loadComplete);
                          },
                          onRefresh: () {
                            inject<TrendingMovieBloc>().add(
                              const GetTrendingMovies(
                                page: 1,
                              ),
                            );
                            Future.delayed(const Duration(seconds: 2),
                                _refreshController.refreshCompleted);
                          },
                          child: ListView.builder(
                            controller: ScrollController(),
                            physics: const AlwaysScrollableScrollPhysics(),
                            itemCount: data?.results.length,
                            itemBuilder: (context, index) {
                              final movieData = data!.results[index];
                              return MovieListTile(movieData: movieData);
                            },
                          ),
                        ),
                      ),
                    if (state is TrendingError)
                      Center(
                        child: Text(
                          state.message,
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                      )
                    else
                      const SizedBox()
                  ],
                );
              },
            )
          : BlocBuilder<AnimationMovieBloc, AnimationState>(
              bloc: inject<AnimationMovieBloc>(),
              builder: (context, state) {
                final data =
                    state is AnimationLoaded ? state.movieResponse : null;
                return Column(
                  children: [
                    if (state is AnimationLoading)
                      const CircularProgressIndicator(),
                    if (state is AnimationLoaded)
                      Expanded(
                        child: SmartRefresher(
                          enablePullUp: true,
                          controller: _refreshController,
                          // ignore: prefer_const_constructors
                          footer: ClassicFooter(
                            loadingIcon: const CupertinoActivityIndicator(),
                            loadingText: 'Loading',
                            idleText: 'Loading',
                            idleIcon: const CupertinoActivityIndicator(),
                          ),
                          onLoading: () {
                            inject<AnimationMovieBloc>().add(
                              GetAnimationMovies(
                                animationId: state.movieResponse.page + 1,
                              ),
                            );
                            Future.delayed(const Duration(seconds: 2),
                                _refreshController.loadComplete);
                          },
                          onRefresh: () {
                            inject<AnimationMovieBloc>().add(
                              const GetAnimationMovies(
                                animationId: 16,
                              ),
                            );
                            Future.delayed(const Duration(seconds: 2),
                                _refreshController.refreshCompleted);
                          },
                          child: ListView.builder(
                            controller: ScrollController(),
                            physics: const AlwaysScrollableScrollPhysics(),
                            itemCount: data?.results.length,
                            itemBuilder: (context, index) {
                              final movieData = data!.results[index];
                              return MovieListTile(movieData: movieData);
                            },
                          ),
                        ),
                      ),
                    if (state is AnimationError)
                      Center(
                        child: Text(
                          state.message,
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                      )
                    else
                      const SizedBox()
                  ],
                );
              },
            ),
    );
  }
}
