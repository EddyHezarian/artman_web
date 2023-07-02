import 'package:artman_web/config/conststants/icon_urls.dart';
import 'package:artman_web/config/conststants/meassurments.dart';
import 'package:artman_web/config/conststants/text_consts.dart';
import 'package:artman_web/config/theme/color_pallet.dart';
import 'package:artman_web/config/theme/text_styles.dart';
import 'package:flutter/material.dart';

Widget searchBox(BuildContext context){
return 
Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              margin: const EdgeInsets.only(right: 40 , top:  20 , left: 40 ,),
              width: MediaQuery.of(context).size.width * 0.8,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: ColorPallet.searchBox
                ),
                child: Row(
                  children: [
                    Image.asset(IconsUrl.search,height: 30,width: 30,),
                    const SizedBox(width: Meassurments.crossSpaceinBox,),
                      Expanded(
                      child: TextField(
                        decoration: InputDecoration.collapsed(
                          hintText: TextConsts.searchBox,
                          hintStyle: TextStyles.hint ),
                      ),
                    )
                  ],
                ),   
            );
}

