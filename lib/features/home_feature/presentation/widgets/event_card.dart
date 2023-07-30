import 'package:artman_web/config/conststants/meassurments.dart';
import 'package:artman_web/config/theme/color_pallet.dart';
import 'package:artman_web/config/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import '../../../../config/functions/calculate_off_percent.dart';
import '../../../product_list_feature/data/models/product_model.dart';

Widget eventCard(ProductModel model) {
  return Container(
    padding: const EdgeInsets.only(left: 10, right: 15, top: 3, bottom: 15),
    margin: const EdgeInsets.only(left: 5, top: 20, bottom: 20),
    width: 140,
    decoration: BoxDecoration(
        color: ColorPallet.cards2,
        borderRadius: BorderRadius.circular(Meassurments.boxBorderRadius)),
    child: Column(
      children: [
        //! image
        Container(
          //margin: const EdgeInsets.all(4),
          width: 115,
          height: 130,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: NetworkImage(model.images[0].url!),
                  fit: BoxFit.cover)),
        ),
        //! title
        SizedBox(
          height: 33,
          child: Center(
            child: Text(
              model.name!,
              textScaleFactor: 1,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: "sens",
                  fontSize: 12,
                  color: ColorPallet.mainTextColor),
            ),
          ),
        ),
        const Divider(
          color: Color(0xfffD9D9D9),
        ),
        //! price
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //! bargen banner
              Container(
                //margin: const EdgeInsets.only(right: 0, top: 20),
                width: 31,
                height: 31,
                decoration: BoxDecoration(
                  color: ColorPallet.secondary,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Center(
                    child: Text(
                  "${calculatePercentOff(double.parse(model.salePrice!), double.parse(model.regularPrice!)).toInt().toString()}%"
                      .toPersianDigit(),
                  style: TextStyles.cardBargen,
                  textAlign: TextAlign.center,
                )),
              ),
              //! price value
              Container(
                margin: const EdgeInsets.only(
                  top: 0,
                  left: 8,
                ),
                child: Column(
                  children: [
                    Text(model.salePrice!.toPersianDigit().seRagham(),
                        style: TextStyle(
                            fontFamily: "sens",
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: ColorPallet.mainTextColor)),
                    Text(model.regularPrice!.toPersianDigit().seRagham(),
                        style: const TextStyle(
                            fontFamily: "sens",
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey))
                  ],
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}
