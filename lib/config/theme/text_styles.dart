import 'package:artman_web/config/theme/color_pallet.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  //! home page 
  static TextStyle hint = GoogleFonts.inter(//* hint for search box
    color: ColorPallet.iconsColor,
    fontWeight: FontWeight.w600,
    fontSize: 15,
  );
  static TextStyle offersTitle= GoogleFonts.inter( //!
    color: ColorPallet.mainTextColor,
    fontWeight: FontWeight.w900,
    fontSize: 18,
  );  
  static TextStyle seeAll= GoogleFonts.inter(
    color: ColorPallet.background,
    fontWeight: FontWeight.w600,
    fontSize: 14,
  );   
  static TextStyle categoryLabel= GoogleFonts.inter(
    color: ColorPallet.mainTextColor,
    fontWeight: FontWeight.w600,
    fontSize: 14,
  ); 



   //! card
   static TextStyle cardBargen= GoogleFonts.inter(
    color: ColorPallet.background,
    fontWeight: FontWeight.w600,
    fontSize: 14,
  );   
  static TextStyle oldPriceValue= GoogleFonts.inter(
    color: ColorPallet.background,
    decoration: TextDecoration.lineThrough,
    fontWeight: FontWeight.w600,
    fontSize: 14,
  );
}