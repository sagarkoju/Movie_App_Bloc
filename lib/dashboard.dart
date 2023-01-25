import 'package:flutter/material.dart';
import 'package:movie_app/core/components/custom_headertitle.dart';
import 'package:movie_app/core/components/custom_icon_icons.dart';
import 'package:movie_app/core/components/custom_movie_texttile.dart';
import 'package:movie_app/core/components/custom_search_widget.dart';
import 'package:movie_app/core/theme/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(top: 10),
        decoration: const BoxDecoration(
            border: Border(
                top: BorderSide(
          color: Color(0xff2a3458),
          width: 3.0,
        ))),
        child: BottomNavigationBar(
            backgroundColor: AppColors.backgroundColor,
            fixedColor: Colors.white,
            elevation: 0,
            unselectedItemColor: const Color(0xff82879c),
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(CustomIcon.home),
                  label: '',
                  backgroundColor: Colors.red),
              BottomNavigationBarItem(
                  icon: Icon(CustomIcon.ticket),
                  label: '',
                  backgroundColor: Color(0xff82879c)),
              BottomNavigationBarItem(
                  icon: Icon(CustomIcon.wallet),
                  label: '',
                  backgroundColor: Color(0xff82879c)),
              BottomNavigationBarItem(
                  icon: Icon(CustomIcon.profile),
                  label: '',
                  backgroundColor: Color(0xff82879c))
            ]),
      ),
      body: SafeArea(
        child: Column(
          children: const [
            CustomHeaderTitle(),
            CustomSearchBarWidget(),
            CustomMovieTextTile()
          ],
        ),
      ),
    );
  }
}
