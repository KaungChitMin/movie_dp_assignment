import 'package:flutter/material.dart';
import '../constant/string.dart';
import '../data/vos/movie_vo/movie_vo.dart';
import '../pages/home_page.dart';
import 'banner_movie_view.dart';

class BannerMovieItemView extends StatelessWidget {
  const BannerMovieItemView({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MovieVO>?>(
      future: movieDBApplyImpl.getNowPlayingMovies(1),
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text(kErrorText));
        }

        final listOfBannerMovie = snapshot.data?.take(5).toList();

        return PageView.builder(
            controller: controller,
            itemCount: listOfBannerMovie?.length,
            itemBuilder: (context, index) {
              return BannerMovieView(
                movieTitle: listOfBannerMovie?[index].title ?? '',
                movieVo: listOfBannerMovie?[index],
              );
            });
      },
    );
  }
}
