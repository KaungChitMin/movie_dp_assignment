import 'package:flutter/material.dart';
import '../constant/api_constant.dart';
import '../constant/color.dart';
import '../constant/dimens.dart';
import '../data/vos/movie_vo/movie_vo.dart';
import '../widgets/cached_network_image_widget.dart';
import '../widgets/easy_text_widget.dart';

class BannerMovieView extends StatelessWidget {
  const BannerMovieView({
    Key? key,
    required this.movieVo,
    required this.movieTitle,
  }) : super(key: key);
  final String movieTitle;
  final MovieVO? movieVo;

  @override
  Widget build(BuildContext context) {
    var image = movieVo?.backdropPath ?? '';

    return Stack(
        alignment: Alignment.center,
        children: [

          /// This is Movie Image
          CachedNetworkImageWidget(
        imageUrl: ('$kPrefixImageLink$image'),
      ),

          /// Gradient Color
          Container(
            width: double.infinity,
            foregroundDecoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      kTransparentColor,
                      kTransparentColor,
                      kTransparentColor,
                      kPrimaryColor,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0, 0, 0.4, 1])),
          ),

          /// This is Movie Name
          Positioned(
            left: kLeftSP15x,
            bottom: kSP50x,
            child: EasyTextWidget(
              text: movieTitle,
              fontWeight: kBannerMovieFontWeight,
              fontSize: kBannerMovieFontSize,
            ),
          ),

          /// This is Movie Icon
          const Icon(
        kPlayCircleIcon,
        color: kPlayButtonColor,
        size: kPlayCircleIconSize,
      ),

    ]);
  }
}
