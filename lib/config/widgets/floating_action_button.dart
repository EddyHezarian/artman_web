import 'package:artman_web/config/conststants/icon_urls.dart';
import 'package:artman_web/config/theme/color_pallet.dart';
import 'package:flutter/material.dart';

FloatingActionButton floatingActionButton (){
  return FloatingActionButton(
          onPressed: (){
            //* go to bucket list
          }, 
          backgroundColor: ColorPallet.secondary,
          child: Image.asset(IconsUrl.shopping,
          color: ColorPallet.background , 
          width: 30 , 
          ),);
}