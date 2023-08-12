
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../config/theme/color_pallet.dart';
import '../screen/home_screen.dart';

class HomePageBanner extends StatelessWidget {
  const HomePageBanner({
    super.key,
    required this.pageViewController,
  });

  final PageController pageViewController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 155,
      child: PageView.builder(
        onPageChanged: (value) {},
        allowImplicitScrolling: true,
        controller: pageViewController,
        physics: const BouncingScrollPhysics(),
        itemCount: bannerList.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(right: 40, left: 32),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CachedNetworkImage(
                repeat: ImageRepeat.noRepeat,
                errorWidget: (context, url, error) => Shimmer.fromColors(
                    baseColor: const Color.fromARGB(255, 223, 223, 223),
                    highlightColor: const Color.fromARGB(255, 200, 199, 199),
                    child: Container(
                      height: 250,
                      width: 350,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    )),
                imageUrl: bannerList[index],
                useOldImageOnUrlChange: true,
                placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: const Color.fromARGB(255, 223, 223, 223),
                    highlightColor: const Color.fromARGB(255, 200, 199, 199),
                    child: Container(
                      height: 250,
                      width: 350,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    )),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}



class BannerIndicator extends StatelessWidget {
  const BannerIndicator({
    super.key,
    required this.pageViewController,
  });

  final PageController pageViewController;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
        effect: ExpandingDotsEffect(
            paintStyle: PaintingStyle.fill,
            dotWidth: 9,
            dotHeight: 3.4,
            dotColor: const Color(0xffd9d9d9),
            activeDotColor: ColorPallet.primary),
        controller: pageViewController,
        count: bannerList.length);
  }
}
