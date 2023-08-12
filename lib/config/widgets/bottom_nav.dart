import 'package:artman_web/config/bloc/bottomnav_cibit/bottomnav_cubit.dart';
import 'package:artman_web/config/conststants/icon_urls.dart';
import 'package:artman_web/config/theme/color_pallet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomeBottomNav extends StatefulWidget {
  final PageController controller;
  const CustomeBottomNav({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<CustomeBottomNav> createState() => _CustomeBottomNavState();
}

class _CustomeBottomNavState extends State<CustomeBottomNav> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        //! apparance
        elevation: 4,
        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
        color: ColorPallet.background,
        //! content
        child: BlocBuilder<BottomNavCubit, int>(builder: (context, int state) {
          return SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //! left side
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2 - 20,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //* Home page
                      IconButton(
                          onPressed: () {
                            BlocProvider.of<BottomNavCubit>(context)
                                .changeState(0);
                            widget.controller.animateToPage(0,
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeInOut);
                          },
                          icon: ImageIcon(
                            AssetImage(state == 0
                                ? IconsUrl.homeSelected
                                : IconsUrl.home),
                            size: 40,
                            color: ColorPallet.mainTextColor,
                          )),
                      //* complet
                      IconButton(
                          onPressed: () {
                            BlocProvider.of<BottomNavCubit>(context)
                                .changeState(1);
                            widget.controller.animateToPage(1,
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeInOut);
                          },
                          icon: ImageIcon(
                              AssetImage(state == 1
                                  ? IconsUrl.categorySelected
                                  : IconsUrl.category),
                              size: 40,
                              color: ColorPallet.mainTextColor)),
                    ],
                  ),
                ),
                //! right side
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2 - 20,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //* favorite
                      IconButton(
                          onPressed: () {
                            BlocProvider.of<BottomNavCubit>(context)
                                .changeState(2);
                            widget.controller.animateToPage(2,
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeInOut);
                          },
                          icon: ImageIcon(
                              AssetImage(state == 2
                                  ? IconsUrl.wishIconSelected
                                  : IconsUrl.wishIcon),
                              size: 40,
                              color: ColorPallet.mainTextColor)),
                      //* person
                      IconButton(
                          onPressed: () {
                            BlocProvider.of<BottomNavCubit>(context)
                                .changeState(3);
                            widget.controller.animateToPage(3,
                                duration: const Duration(milliseconds: 100),
                                curve: Curves.easeInOut);
                          },
                          icon: ImageIcon(
                              AssetImage(state == 3
                                  ? IconsUrl.profileSelected
                                  : IconsUrl.profile),
                              size: 40,
                              color: ColorPallet.mainTextColor)),
                    ],
                  ),
                ),
              ],
            ),
          );
        }));
  }
}
