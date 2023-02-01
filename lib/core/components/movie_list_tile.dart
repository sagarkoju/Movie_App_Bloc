import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/extension/image_extension.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/feature/infrastructure/entities/movies.dart';
import 'package:movie_app/feature/presentation/movie_detail.dart';

class MovieListTile extends StatelessWidget {
  const MovieListTile({
    Key? key,
    required this.movieData,
  }) : super(key: key);

  final Movies movieData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieDetailScreen(
              movies: movieData,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        decoration: BoxDecoration(
            color: AppColors.transparentColor,
            borderRadius: BorderRadius.circular(4)),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: AppColors.transparentColor,
              radius: 40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  height: 80,
                  width: double.infinity,
                  imageUrl: movieData.posterPath.getImageUrl(),
                  progressIndicatorBuilder: (BuildContext ctx, String image,
                      DownloadProgress progress) {
                    return Container(
                      color: AppColors.secondaryColor
                          .withOpacity(progress.progress ?? 1.0),
                    );
                  },
                  errorWidget: (context, _, error) {
                    return const Icon(Icons.error);
                  },
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movieData.originalTitle ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Colors.white),
                    maxLines: 2,
                  ),
                  Text(
                    'Released on : ${movieData.releaseDate}',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.white),
                    maxLines: 1,
                  ),
                  Text(
                    movieData.overview ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: Colors.white),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
