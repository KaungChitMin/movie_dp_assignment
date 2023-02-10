import 'package:flutter/material.dart';
import '../constant/color.dart';
import '../constant/dimens.dart';
import '../constant/string.dart';
import '../data/apply/movie_db_apply_impl.dart';
import '../view_items/banner_movie_view_item.dart';
import '../view_items/smooth_page_indicator_view_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

final MovieDBApplyImpl movieDBApplyImpl = MovieDBApplyImpl();

class _HomePageState extends State<HomePage> {
  final controller = PageController(keepPage: true,);
  final  int itemCount = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,

      /// App Bar
      appBar: AppBar(
        title: const Text(kAppBarText),
        leading: kMenuIcon,
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        actions: const [kSearchIcon],
      ),

      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// Banner Movie
            SizedBox(
              height: kBannerImageHeight,
              width: kInfinityHeight,
              child: BannerMovieItemView(controller: controller),
            ),

             const SizedBox(
              height: kSP20x,
            ),

            /// Smooth Page Indicator
            Center(
              child: SmoothPageIndicatorItemView
                (controller: controller,
                  itemCount: itemCount),
            )

          ],
        ),
      ),
    );
  }
}
