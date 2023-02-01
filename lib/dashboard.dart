import 'package:flutter/material.dart';
import 'package:movie_app/core/components/custom_headertitle.dart';
import 'package:movie_app/core/components/custom_icon_icons.dart';
import 'package:movie_app/core/components/custom_movie_texttile.dart';
import 'package:movie_app/core/components/custom_search_widget.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/feature/application/Animation/animation_bloc.dart';
import 'package:movie_app/feature/application/Trending/trending_movie_bloc.dart';
import 'package:movie_app/feature/presentation/animation_movie.dart';
import 'package:movie_app/feature/presentation/trending_movie.dart';

import 'app_setup/dependency_injection.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    ///fetch trending movies
    inject<TrendingMovieBloc>().add(const GetTrendingMovies());
    inject<AnimationMovieBloc>().add(const GetAnimationMovies(
      animationId: 16,
    ));
    super.initState();
  }

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
        child: SingleChildScrollView(
          child: Column(
            children: const [
              CustomHeaderTitle(),
              CustomSearchBarWidget(),
              CustomMovieTextTile(
                text: 'Now ',
                text1: 'Showing',
              ),
              TrendingMoviesList(),
              CustomMovieTextTile(
                text: 'Animation ',
                text1: 'Showing',
              ),
              AnimationScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
