import 'package:artman_web/features/home_feature/presentation/widgets/trend_card.dart';
import 'package:artman_web/features/product_list_feature/data/remote_data/product_api_provider.dart';
import 'package:artman_web/locator.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../config/conststants/text_consts.dart';
import '../../../../config/theme/color_pallet.dart';
import '../../../../config/theme/text_styles.dart';
import '../../../product_list_feature/data/models/product_model.dart';
import '../../../product_list_feature/presentation/screens/product_list_screen.dart';
import '../../../product_list_feature/presentation/screens/single_product_screen.dart';

Widget homeProductList(String tag) {
  ProductApiProvider productApiProvider = locator();
  return FutureBuilder(
    future: productApiProvider.getProducts(tagid: tag),
    builder: (context, AsyncSnapshot<List<ProductModel>> model) {
      if (model.hasData) {
        return buildHomeCartList(model.data!); //widget
      } else {
        return Center(
          //shimer
          child: LoadingAnimationWidget.horizontalRotatingDots(
            size: 40,
            color: ColorPallet.secondary,
          ),
        );
      }
    },
  );
}



 Widget buildHomeCartList(List<ProductModel> data) {
    return SizedBox(
      height: 220,
      child: ListView.builder(
          itemCount: data.length,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            var inc = data[index];
            return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SingleProductScreen(
                      model: inc,
                    );
                  }));
                },
                child: trendCard(model: inc));
          }),
    );
  }

class HomePageListTItleRow extends StatelessWidget {
  const HomePageListTItleRow({
    required this.title,
    required this.tag,
    super.key,
  });
  final String title;
  final String tag;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //! title
        Text(
          title,
          style: TextStyles.offersTitle,
        ),
        //! see more button 
        InkWell(
          onTap: () =>
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ProductsListScreen(
              title: title,
              tag: tag,
            );
          })),
          child: Container(
            margin: const EdgeInsets.all(7),
            width: 90,
            height: 30,
            child: Row(
              children: [
                Text(
                  TextConsts.seeAll,
                  style: TextStyles.seeAll,
                ),
                Icon(
                  Icons.keyboard_arrow_left,
                  size: 10,
                  color: ColorPallet.primary,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
