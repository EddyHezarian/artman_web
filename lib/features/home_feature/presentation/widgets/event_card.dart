import 'package:artman_web/config/conststants/meassurments.dart';
import 'package:artman_web/config/theme/color_pallet.dart';
import 'package:artman_web/config/theme/text_styles.dart';
import 'package:flutter/material.dart';
import '../../../../config/functions/calculate_off_percent.dart';
import '../../../product_list_feature/data/models/product_model.dart';

Widget eventCard(ProductModel model) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 5),
    margin: const EdgeInsets.only(
      left: 8,
    ),
    width: 140,
    decoration: BoxDecoration(
        color: ColorPallet.cards2,
        borderRadius: BorderRadius.circular(Meassurments.boxBorderRadius)),
    child: Column(
      children: [
        //! image
        Container(
          margin: const EdgeInsets.all(8),
          width: 130,
          height: 135,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                  image: NetworkImage(model.images[0].url!),
                  fit: BoxFit.cover)),
        ),
        //! title
        Text(
          model.name!,
          textScaleFactor: 1,
          textAlign: TextAlign.right,
          maxLines: 2,
          style: TextStyle(
              fontFamily: "sens",
              fontSize: 14,
              color: ColorPallet.mainTextColor),
        ),
        //! price
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //! bargen banner
            Container(
              margin: const EdgeInsets.only(right: 0, top: 20),
              width: 38,
              height:20,
              decoration: BoxDecoration(
                color: ColorPallet.secondary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                  child: Text(
                "${calculatePercentOff(double.parse(model.salePrice!), double.parse(model.regularPrice!)).toInt().toString()}%",
                style: TextStyles.cardBargen,
                textAlign: TextAlign.center,
              )),
            ),
            //! price value
            Container(
              margin: const EdgeInsets.only(top: 20,left: 0,),
              child: Column(
                children: [
                  Text(model.salePrice!,style:  TextStyle(
                          fontFamily: "sens",
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          
                          color:ColorPallet.mainTextColor)),
                  Text(model.regularPrice!,
                      style: const TextStyle(
                          fontFamily: "sens",
                          fontSize: 14,
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey))
                ],
              ),
            )
          ],
        )
      ],
    ),
  );
}
