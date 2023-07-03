import 'package:artman_web/config/conststants/text_consts.dart';
import 'package:artman_web/config/theme/color_pallet.dart';
import 'package:artman_web/config/theme/text_styles.dart';
import 'package:artman_web/config/widgets/search_box.dart';
import 'package:artman_web/features/category_feature/cards/mainCategoryCard.dart';
import 'package:flutter/material.dart';

class CategortyScreen extends StatelessWidget {
  const CategortyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorPallet.background,
        body: Column(children: [
          //! search box ----------------------------------------
          searchBox(context),
          //! title-----------------------------------
          Padding(
            padding: const EdgeInsets.all(10),
            child: Align(alignment: Alignment.centerRight, child: Text(TextConsts.category, style: TextStyles.titleOfPage,)),
          ),
          //! list ----------------------------------------
          Expanded(
            child: ListView.builder(
              itemCount: 13,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context , index){
                //! card 
                return 
                mainCategoryCart(context, index);
              }),
          ) 
        ],),
      ),
    );
  }
}
