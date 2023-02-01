import 'package:flutter/material.dart';
import 'package:movie_app/feature/presentation/all_movies.dart';

class CustomMovieTextTile extends StatefulWidget {
  const CustomMovieTextTile({
    Key? key,
    required this.text,
    required this.text1,
    this.isTap = true,
  }) : super(key: key);
  final String text;
  final String text1;
  final bool isTap;

  @override
  State<CustomMovieTextTile> createState() => _CustomMovieTextTileState();
}

class _CustomMovieTextTileState extends State<CustomMovieTextTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(
              style: const TextStyle(color: Colors.black, fontSize: 36),
              children: <TextSpan>[
                TextSpan(
                  text: widget.text,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xfff5f5f5),
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0.24,
                  ),
                ),
                TextSpan(
                  text: widget.text1,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.white60,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0.24,
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              if (widget.isTap) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AllMoviesScreen(
                        appbarTitle: 'Trending Movies',
                        isTap: true,
                      ),
                    ));
              } else {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AllMoviesScreen(
                        appbarTitle: 'Animation Movies',
                        isTap: false,
                      ),
                    ));
              }
            },
            child: Text(
              'See more',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.white.withOpacity(0.5),
                fontStyle: FontStyle.normal,
                letterSpacing: 0.24,
              ),
            ),
          )
        ],
      ),
    );
  }
}
