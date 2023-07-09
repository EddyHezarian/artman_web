import 'package:artman_web/config/theme/text_styles.dart';
import 'package:flutter/material.dart';

Widget categoryShortcutCard (Color color , String title , Icon icon  ){
  return  Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 6),
                    width: 60 ,
                    height: 60 ,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),color: color,
                    ),
                  child:  Center(child: icon
                  ),
                  ),
                  
                  Text( title , style: TextStyles.categoryLabel)//Todo test 
                ],
              );
}