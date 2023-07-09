import 'dart:async';

import 'package:artman_web/config/theme/color_pallet.dart';
import 'package:artman_web/config/theme/text_styles.dart';
import 'package:artman_web/config/widgets/search_box.dart';
import 'package:artman_web/features/product_list_feature/blocs/cubit/product_cubit.dart';
import 'package:artman_web/features/product_list_feature/data/models/product_model.dart';

import 'package:artman_web/features/product_list_feature/screens/single_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsList extends StatelessWidget {
  ProductsList({super.key});
  final scrollController = ScrollController();

  void setupScrollController(context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          print("object");
          BlocProvider.of<ProductCubit>(context).loadProducts();
        }
      }
    });
  }
  @override
  Widget build(BuildContext context) {
setupScrollController(context);
        BlocProvider.of<ProductCubit>(context).loadProducts();
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        
        //! if its loading for first time
        if (state is ProductLoading && state.isFirstFetch) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(color: ColorPallet.secondary),
            ),
          );
        }

        List<ProductModel> products = [];
        bool isLoading = false;
        //! if its loading
        if (state is ProductLoading) {
          products = state.oldProduct;
          isLoading = true;
        } else if (state is ProductLoaded) {
          products = state.Product;
        }

        return SafeArea(
          child: Scaffold(
            body: Column(
              children: [
                //! search box ----------------------------------------
                SearchBox(),
                //! title-----------------------------------
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "جست و جو در دسته ی موبایل",
                        style: TextStyles.titleOfPage,
                      )),
                ),
                //! list ----------------------------------------
                Expanded(
                  child: ListView.builder(
                    controller: scrollController,
                      itemCount: products.length + (isLoading ? 1 :0),
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        if (index < products.length) {
                          var data = products[index];
                          return cartForProductList(context, data);
                        } else {
                          Timer(const Duration(milliseconds: 30), () {
                            setupScrollController(context);
                            scrollController.jumpTo(
                                scrollController.position.maxScrollExtent);
                          });
                          
                        }
                        return CircularProgressIndicator(
                          color: ColorPallet.secondary,
                        );
                      }),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget cartForProductList(BuildContext context, ProductModel model) {
  return InkWell(
    onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: ((context) => SingleProductScreen(
                  model: model,
                )))),
    child: Column(
      children: [
        Row(
          children: [
            //! image
            Container(
                width: MediaQuery.of(context).size.width * 0.26,
                height: MediaQuery.of(context).size.width * 0.39,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        //Todo make dynamic
                        image: NetworkImage(model.images[0].url!),
                        fit: BoxFit.cover))),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //! title
                Padding(
                  padding: const EdgeInsets.only(right: 10, bottom: 10),
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Text(
                        model.name!,
                        style: TextStyles.nameOfPrudoctList,
                      )),
                ),
                //! rate
                const Padding(
                  padding: EdgeInsets.only(right: 10, bottom: 10),
                  child: Row(
                    children: [
                      //!
                      Icon(
                        Icons.star,
                        size: 20,
                        color: Colors.amber,
                      ),
                      Text("4.1"),
                    ],
                  ),
                ),
                //!price
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Row(
                    children: [
                      Text(
                        model.price!,
                        style: TextStyles.nameOfPrudoctList,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Text("تومان"),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 19),
          child: Divider(
            thickness: 2,
            color: ColorPallet.searchBox,
            height: 1,
          ),
        )
      ],
    ),
  );
}
