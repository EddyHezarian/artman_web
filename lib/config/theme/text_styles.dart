import 'package:artman_web/config/theme/color_pallet.dart';
import 'package:flutter/material.dart';

class TextStyles {

//  static TextStyle hint = TextStyle(
//     //* hint for search box
//     color: ColorPallet.iconsColor, fontFamily: "sens",
//     fontWeight: FontWeight.w600,
//     fontSize: 15,
//   );







  //! home page
  static TextStyle hint = TextStyle(
    //* hint for search box
    color: ColorPallet.iconsColor, fontFamily: "sens",
    fontWeight: FontWeight.w600,
    fontSize: 15,
  );
  static TextStyle offersTitle = TextStyle(
    //!
    color: ColorPallet.mainTextColor, fontFamily: "sens",
    fontWeight: FontWeight.w500,
    fontSize: 15,
  );
  static TextStyle seeAll = TextStyle(
    fontFamily: "sens",
    color: ColorPallet.secondary,
    fontWeight: FontWeight.w400,
    fontSize: 11,
  );
  static TextStyle categoryLabel = TextStyle(
    fontFamily: "sens",
    color: ColorPallet.mainTextColor,
    fontWeight: FontWeight.w600,
    fontSize: 14,
  );
  //! card
  static TextStyle cardBargen = const TextStyle(
    fontFamily: "sens",
    color: Colors.white,
    fontWeight: FontWeight.w600,
    fontSize: 11,
  );
  static TextStyle oldPriceValue = TextStyle(
    fontFamily: "sens",
    color: ColorPallet.background,
    decoration: TextDecoration.lineThrough,
    fontWeight: FontWeight.w600,
    fontSize: 14,
  );
  //!Person
  static TextStyle personName = TextStyle(
    fontFamily: "sens",
    color: ColorPallet.background,
    fontWeight: FontWeight.w800,
    fontSize: 18,
  );
  //! category
  static TextStyle titleOfPage = TextStyle(
      fontFamily: "sens",
      color: ColorPallet.mainTextColor,
      fontSize: 20,
      fontWeight: FontWeight.bold);
  static TextStyle nameOfCategory = TextStyle(
      fontFamily: "sens",
      color: ColorPallet.mainTextColor,
      fontSize: 20,
      fontWeight: FontWeight.bold);
  static TextStyle countOfCategory = TextStyle(
      fontFamily: "sens",
      color: ColorPallet.hintColor,
      fontSize: 16,
      fontWeight: FontWeight.w400);
  //! favorite
  static TextStyle nameOfPrudoctList = TextStyle(
      fontFamily: "sens",
      color: ColorPallet.mainTextColor,
      fontSize: 16,
      fontWeight: FontWeight.w700);
}
