import 'package:flutter/material.dart';

class CustomMovieTextTile extends StatelessWidget {
  const CustomMovieTextTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 25,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: const TextSpan(
              style: TextStyle(color: Colors.black, fontSize: 36),
              children: <TextSpan>[
                TextSpan(
                  text: 'Now ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xfff5f5f5),
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0.24,
                  ),
                ),
                TextSpan(
                  text: 'Showing',
                  style: TextStyle(
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
          Text(
            'See more',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.white.withOpacity(0.5),
              fontStyle: FontStyle.normal,
              letterSpacing: 0.24,
            ),
          )
        ],
      ),
    );
  }
}
