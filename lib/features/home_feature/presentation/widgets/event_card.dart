import 'package:artman_web/config/conststants/meassurments.dart';
import 'package:artman_web/config/theme/color_pallet.dart';
import 'package:artman_web/config/theme/text_styles.dart';
import 'package:flutter/material.dart';

Widget eventCard (  ){
  return Container(
                        margin: const EdgeInsets.only(left: 8 ,)  ,
                    width: 160,
                    decoration: BoxDecoration(
                      color: ColorPallet.cards2, 
                      borderRadius: BorderRadius.circular(Meassurments.boxBorderRadius)),
                      child: Column(
                        children: [
                           //! image 
                            Container(
                            margin: const EdgeInsets.all(8),
                            width:130,
                            height: 130,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15), 
                              image:const DecorationImage(image: AssetImage("assets/icons/mob.png"),fit: BoxFit.cover )
                              ),
                          ),
                            //! title
                            const Text("ipone SE 2020"),
                            //! price
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                              //! bargen banner 
                              Container(
                                margin: const EdgeInsets.only(right: 10 , top: 10),
                                width: 50,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: ColorPallet.secondary, 
                                  borderRadius: BorderRadius.circular(8),
                                  ),
                                child: Center(child: Text("24%", style: TextStyles.cardBargen,)),
                              ),
                              //! price value
                              Container(
                                margin: const EdgeInsets.all(10),
                                child: const Column(children: [
                                  Text("19000"),
                                  Text(
                                    "222",style: TextStyle(
                                      fontSize: 14,
                                      decoration: TextDecoration.lineThrough,
                                      color: Colors.grey))
                                ],),
                              )
                              ],
                            )
                        ],
                      ),
                  );
}