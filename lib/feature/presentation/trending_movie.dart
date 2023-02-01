import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/app_setup/dependency_injection.dart';
import 'package:movie_app/core/components/custom_shimmer.dart';
import 'package:movie_app/core/extension/image_extension.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/feature/application/Trending/trending_movie_bloc.dart';

import 'package:movie_app/feature/presentation/movie_detail.dart';

class TrendingMoviesList extends StatefulWidget {
  const TrendingMoviesList({Key? key}) : super(key: key);

  @override
  State<TrendingMoviesList> createState() => _TrendingMoviesListState();
}

class _TrendingMoviesListState extends State<TrendingMoviesList> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrendingMovieBloc, TrendingState>(
      bloc: inject<TrendingMovieBloc>(),
      builder: (context, state) {
        final trendingMoviesData =
            state is TrendingLoaded ? state.movieResponse : null;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (state is TrendingLoading)
              CustomShimmer(
                baseColor: AppColors.transparentColor,
                highlightColor: Colors.grey.shade100,
                widget: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            if (state is TrendingLoaded)
              SizedBox(
                height: 250,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CarouselSlider(
                      items: trendingMoviesData!.results
                          .map((item) => InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            MovieDetailScreen(movies: item),
                                      ));
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                      color: AppColors.transparentColor),
                                  margin: const EdgeInsets.all(5),
                                  child: ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5)),
                                      child: Stack(
                                        children: <Widget>[
                                          CachedNetworkImage(
                                            imageUrl:
                                                item.posterPath.getImageUrl(),
                                            fit: BoxFit.cover,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            errorWidget: (context, _, error) {
                                              return const Icon(
                                                Icons.error,
                                                color: Colors.red,
                                              );
                                            },
                                            progressIndicatorBuilder:
                                                (BuildContext ctx, String image,
                                                    DownloadProgress progress) {
                                              return Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: 250,
                                                color: AppColors.backgroundColor
                                                    .withOpacity(
                                                  progress.progress ?? 1.0,
                                                ),
                                              );
                                            },
                                          ),
                                          Positioned(
                                            bottom: 0,
                                            left: 0,
                                            right: 0,
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                gradient: LinearGradient(
                                                  colors: [
                                                    Color.fromARGB(
                                                        200, 0, 0, 0),
                                                    Color.fromARGB(0, 0, 0, 0)
                                                  ],
                                                  begin: Alignment.bottomCenter,
                                                  end: Alignment.topCenter,
                                                ),
                                              ),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10,
                                                      horizontal: 20),
                                              child: Text(
                                                item.originalTitle ?? '',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline6
                                                    ?.copyWith(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )),
                                ),
                              ))
                          .take(10)
                          .toList(),
                      carouselController: _controller,
                      options: CarouselOptions(
                          autoPlay: true,
                          enlargeCenterPage: true,
                          aspectRatio: 2,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _current = index;
                            });
                          }),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: trendingMoviesData.results
                          .asMap()
                          .entries
                          .map((entry) {
                            return GestureDetector(
                              onTap: () => _controller.animateToPage(entry.key),
                              child: Container(
                                width: 15,
                                height: 15,
                                margin: const EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 4,
                                ),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white.withOpacity(
                                      _current == entry.key ? 0.9 : 0.4),
                                ),
                              ),
                            );
                          })
                          .take(10)
                          .toList(),
                    ),
                  ],
                ),
              ),
            if (state is TrendingError)
              Padding(
                padding: const EdgeInsets.all(8),
                child: Center(
                  child: Text(
                    state.message,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            const SizedBox(),
          ],
        );
      },
    );
  }
}
