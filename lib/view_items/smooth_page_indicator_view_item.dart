import 'package:flutter/cupertino.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../constant/color.dart';

class SmoothPageIndicatorItemView extends StatelessWidget {
  const SmoothPageIndicatorItemView({
    Key? key,
    required this.controller,
    required this.itemCount,
  }) : super(key: key);

  final PageController controller;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: itemCount,
      axisDirection: Axis.horizontal,
      effect: const ScrollingDotsEffect(
          spacing: 10.0,
          dotWidth: 8.0,
          dotHeight: 8.0,
          paintStyle: PaintingStyle.stroke,
          strokeWidth: 1.5,
          dotColor: kWhiteColor,
          activeDotColor: kPlayButtonColor),
    );
  }
}
