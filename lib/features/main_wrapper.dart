import 'package:artman_web/config/widgets/bottom_nav.dart';
import 'package:artman_web/config/widgets/floating_action_button.dart';
import 'package:artman_web/core/models/tag_model.dart';
import 'package:artman_web/features/category_feature/presentation/screen/category_screen.dart';
import 'package:artman_web/features/wish_list_feature/presentation/screen/favorite_screen.dart';
import 'package:artman_web/features/home_feature/presentation/screen/home_screen.dart';
import 'package:artman_web/features/person_info_feature/presentation/screens/person_screen.dart';
import 'package:flutter/material.dart';

class MainWrapper extends StatelessWidget {
  final List<TagModel>? tags;

  MainWrapper({super.key, this.tags});
  final PageController _pageController = PageController(initialPage: 0);
  static const String routName = "mainWrapper";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //?backgroundColor: ColorPallet.background,
        //!actions--> floating ation button for creat order and bottom nav for routing the page
        floatingActionButton: floatingActionButton(context, tags),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: CustomeBottomNav(
          controller: _pageController,
        ),
        body: PageView(
          physics:
              const NeverScrollableScrollPhysics(), //! for prevent conflict in scrolling
          allowImplicitScrolling: true,
          controller: _pageController,
          children: [
            HomeScreen(
              tags: tags,
            ),
            CategortyScreen(
              tags: tags,
            ),
            const FavoriteScreen(),
            const PersonScreen()
          ],
        ),
      ),
    );
  }
}
