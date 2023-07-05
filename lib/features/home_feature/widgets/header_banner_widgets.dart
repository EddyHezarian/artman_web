import 'package:artman_web/config/theme/color_pallet.dart';
import 'package:artman_web/features/home_feature/screen/home_screen.dart';
import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/material.dart';

Widget headerBanner(BuildContext context ){
  return 
  BannerCarousel(
                  //Todo ---> convert to custome banner maker with clipRRect
              //Todo---> convert to widget file into home_ feature dierctory !!!

              //! banner item is hard code ___ no dynamic API yet ! 
              //todo  convert to dynamic 
              banners: BannerImages.listBanners,
              customizedIndicators: const IndicatorModel.animation(
                  width: 20, 
                  height: 5, 
                  spaceBetween: 2, 
                  widthAnimation: 50),
              height: 170,
              activeColor: ColorPallet.secondary,
              disableColor: ColorPallet.background,
              animation: true,  
              borderRadius: 20,
              onTap: (id) => print(id), // todo impelmet action to navigate to Ad.
              width: MediaQuery.of(context).size.width * 0.98,
              indicatorBottom: false,
            );

}