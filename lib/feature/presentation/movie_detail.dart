import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/components/circular_button.dart';
import 'package:movie_app/core/components/item_container.dart';
import 'package:movie_app/core/extension/image_extension.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/feature/infrastructure/entities/movies.dart';

class MovieDetailScreen extends StatefulWidget {
  const MovieDetailScreen({
    Key? key,
    required this.movies,
  }) : super(key: key);

  final Movies movies;

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  CachedNetworkImage(
                    fit: BoxFit.fill,
                    width: double.infinity,
                    imageUrl: widget.movies.posterPath.getImageUrl(),
                    errorWidget: (context, _, error) {
                      return const Icon(
                        Icons.error,
                        color: Colors.red,
                        size: 50,
                      );
                    },
                    progressIndicatorBuilder: (BuildContext ctx, String image,
                        DownloadProgress progress) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 2,
                        color: AppColors.secondaryColor.withOpacity(
                          progress.progress ?? 1.0,
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: MediaQuery.of(context).padding.top,
                    ),
                    child: CircularButton(
                      radius: 30,
                      iconData: Icons.chevron_left,
                      iconColor: Colors.white,
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(50)),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          'Play',
                          style: Theme.of(context).textTheme.button?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                  ),
                  const CircularButton(
                    iconData: Icons.file_download_outlined,
                  ),
                  const CircularButton(
                    iconData: Icons.ios_share,
                    iconColor: AppColors.secondaryColor,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ItemContainer(
                        keys: 'Vote Count',
                        value: widget.movies.voteCount.toString(),
                      ),
                      ItemContainer(
                        keys: 'Vote Average',
                        value: widget.movies.voteAverage.toString(),
                      ),
                      ItemContainer(
                        keys: 'Popularity',
                        value: widget.movies.popularity.toString(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    widget.movies.title ?? '',
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.movies.overview ?? '',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.white,
                        ),
                    textAlign: TextAlign.justify,
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
