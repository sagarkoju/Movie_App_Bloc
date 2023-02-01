import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/app_setup/dependency_injection.dart';
import 'package:movie_app/core/components/custom_shimmer.dart';
import 'package:movie_app/core/extension/image_extension.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/feature/application/Animation/animation_bloc.dart';
import 'package:movie_app/feature/infrastructure/entities/movies.dart';
import 'package:movie_app/feature/presentation/movie_detail.dart';

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({super.key});

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      BlocBuilder<AnimationMovieBloc, AnimationState>(
        bloc: inject<AnimationMovieBloc>(),
        builder: (context, state) {
          final animationMoviesData =
              state is AnimationLoaded ? state.movieResponse : null;
          return Column(
            children: [
              if (state is AnimationLoading)
                SizedBox(
                  height: 200,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: ListView.builder(
                        itemCount: 5,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return CustomShimmer(
                            baseColor: AppColors.transparentColor,
                            highlightColor: Colors.grey.shade100,
                            widget: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              height: 160,
                              width: 180,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
              if (state is AnimationLoaded)
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      final movieData = animationMoviesData?.results[index];

                      return AnimationTile(
                        movies: movieData!,
                      );
                    },
                  ),
                ),
              if (state is AnimationError)
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    state.message,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                        ),
                    textAlign: TextAlign.center,
                  ),
                )
              else
                const SizedBox()
            ],
          );
        },
      )
    ]);
  }
}

class AnimationTile extends StatelessWidget {
  const AnimationTile({
    Key? key,
    required this.movies,
  }) : super(key: key);

  final Movies movies;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieDetailScreen(movies: movies),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.only(left: 20),
        height: 20,
        width: 180,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 160,
              width: 180,
              child: CachedNetworkImage(
                imageUrl: movies.posterPath.getImageUrl(),
                fit: BoxFit.fill,
                progressIndicatorBuilder: (BuildContext ctx, String image,
                    DownloadProgress progress) {
                  return Container(
                    width: 160,
                    height: 180,
                    color: AppColors.secondaryColor.withOpacity(
                      progress.progress ?? 1.0,
                    ),
                  );
                },
              ),
            ),
            Text(
              movies.originalTitle ?? '',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white,
                  ),
              textAlign: TextAlign.start,
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}
