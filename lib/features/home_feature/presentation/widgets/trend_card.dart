import 'package:artman_web/config/conststants/meassurments.dart';
import 'package:artman_web/config/functions/calculate_off_percent.dart';
import 'package:artman_web/config/theme/color_pallet.dart';
import 'package:artman_web/config/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

import '../../../product_list_feature/data/models/product_model.dart';

Widget trendCard({ProductModel? model}) {
  //! card for Trend products in home page .
  return Container(
    padding: const EdgeInsets.only(left: 10, top: 3, right: 13),
    margin: const EdgeInsets.only(left: 8),
    width: 160,
    decoration: BoxDecoration(
        color: ColorPallet.cards,
        borderRadius: BorderRadius.circular(Meassurments.boxBorderRadius)),
    child: Column(
      children: [
        //! image
        Container(
          margin: const EdgeInsets.only(bottom: 3),
          width: 137,
          height: 130,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                  image: NetworkImage(model!.images[0].url!),
                  fit: BoxFit.cover)),
        ),
        //! title
        SizedBox(
          width: 137,
          height: 20,
          child: Text(
            model.name!,
            maxLines: 1,
            style: const TextStyle(
                fontFamily: "Sens", fontSize: 12, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
        ),
        //
        Divider(
          color: Colors.grey,
        ),
        //! price
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //! bargen banner
            Container(
              margin: const EdgeInsets.only(right: 10, top: 10),
              width: 31,
              height: 31,
              decoration: BoxDecoration(
                color: ColorPallet.secondary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                  child: Text(
                "${calculatePercentOff(double.parse(model.salePrice!), double.parse(model.regularPrice!)).toInt().toString()}%",
                style: TextStyles.cardBargen,
              )),
            ),
            //! price value
            Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                children: [
                  //! sale price
                  Text(
                    model.price.toString().toPersianDigit().seRagham(),
                    style: const TextStyle(
                        fontFamily: "Sens",
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                  //! regular
                  Text(model.regularPrice!.toPersianDigit().seRagham(),
                      style: const TextStyle(
                          fontFamily: "Sens",
                          fontSize: 12,
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
