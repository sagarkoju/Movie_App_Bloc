import 'package:flutter/material.dart';
import 'package:movie_app/core/components/custom_icon_icons.dart';

class CustomSearchBarWidget extends StatelessWidget {
  const CustomSearchBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
      child: TextFormField(
        onChanged: (value) {},
        decoration: InputDecoration(
          // contentPadding: const EdgeInsets.only(left: 10),
          enabledBorder: OutlineInputBorder(
              gapPadding: 0,
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(color: Color(0xff2a3458))),
          fillColor: const Color(0xff2a3458),
          filled: true,
          errorBorder: OutlineInputBorder(
            gapPadding: 0,
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(color: Color(0xff2a3458)),
          ),
          focusedBorder: OutlineInputBorder(
            gapPadding: 0,
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(color: Color(0xff2a3458)),
          ),
          focusColor: Colors.green,
          labelText: "Search movie ..",
          labelStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.white,
              fontStyle: FontStyle.normal,
              letterSpacing: 0.24),
          prefixIcon: const Padding(
            padding: EdgeInsets.only(left: 20.0, right: 10),
            child: Icon(
              CustomIcon.search,
              size: 25,
              color: Colors.white,
            ),
          ),
          suffixIcon: const Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(
              CustomIcon.menu,
              size: 25,
              color: Colors.white,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(color: Color(0xff2a3458)),
          ),
        ),
      ),
    );
  }
}
