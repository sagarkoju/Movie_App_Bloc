import 'package:flutter/material.dart';
import 'package:movie_app/core/components/custom_icon_icons.dart';

class CustomHeaderTitle extends StatelessWidget {
  const CustomHeaderTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Image.asset(
            'assets/person.png',
            fit: BoxFit.fill,
            height: 60,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: const TextSpan(
                style: TextStyle(color: Colors.black, fontSize: 36),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Hello ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  TextSpan(
                    text: 'Sagar',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 03,
            ),
            const Text(
              'Book your favorite movie',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.white,
                fontStyle: FontStyle.normal,
              ),
            )
          ],
        ),
        const Spacer(),
        const Padding(
          padding: EdgeInsets.only(right: 21.0),
          child: CircleAvatar(
            radius: 25,
            backgroundColor: Color(0xff2a3458),
            child: Icon(
              CustomIcon.notification,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
