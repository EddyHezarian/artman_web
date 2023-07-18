import 'package:artman_web/config/conststants/meassurments.dart';
import 'package:artman_web/config/theme/color_pallet.dart';
import 'package:artman_web/config/theme/text_styles.dart';
import 'package:flutter/material.dart';
import '../../../../config/functions/calculate_off_percent.dart';
import '../../../product_list_feature/data/models/product_model.dart';
Widget eventCard ( ProductModel model ){
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
                              image: DecorationImage(image: NetworkImage(model.images[0].url!),fit: BoxFit.cover )
                              ),
                          ),
                            //! title
                            Text(model.name! , textAlign: TextAlign.center,maxLines: 1,),
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
                                child: Center(child: Text("${calculatePercentOff(double.parse(model.salePrice!), double.parse(model.regularPrice!)).toInt().toString()}%", style: TextStyles.cardBargen,)),
                              ),
                              //! price value
                              Container(
                                margin: const EdgeInsets.all(10),
                                child: Column(children: [
                                  Text(model.salePrice!),
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