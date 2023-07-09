import 'package:artman_web/config/conststants/meassurments.dart';
import 'package:artman_web/config/theme/color_pallet.dart';
import 'package:artman_web/config/theme/text_styles.dart';
import 'package:flutter/material.dart';

import '../../../product_list_feature/data/models/product_model.dart';

Widget trendCard({required int index  , ProductModel? model}  ){
  //! card for Trend products in home page .
return Container(
                        margin: index >0 ? const EdgeInsets.only(left: 8 ,) :const EdgeInsets.only(left: 8) ,
                    width: 160,
                    decoration: BoxDecoration(
                      color: ColorPallet.cards,
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
                              image:DecorationImage(image:NetworkImage(model!.images[0].url!),fit: BoxFit.cover )
                              ),
                          ),
                            //! title
                            Text(model!.name!),
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
                                child:  Column(children: [
                                  Text(model!.price.toString()),
                                  Text(
                                    model.regularPrice!,style: const TextStyle(
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