import 'package:artman_web/config/conststants/icon_urls.dart';
import 'package:artman_web/config/theme/color_pallet.dart';
import 'package:artman_web/features/cart_feature/presentation/screens/cart_list_screen.dart';
import 'package:flutter/material.dart';

FloatingActionButton floatingActionButton(
    BuildContext context) {
  return FloatingActionButton(
    onPressed: () {
      //* go to bucket list
      Navigator.push(context, MaterialPageRoute(builder: (ocntext) {
        return CartListScreen(
          
        );
      }));
    },
    backgroundColor: ColorPallet.secondary,
    child: Image.asset(
      IconsUrl.shopping,
      color: ColorPallet.background,
      width: 30,
    ),
  );
}
