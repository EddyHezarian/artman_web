import 'dart:async';
import 'package:artman_web/config/theme/color_pallet.dart';
import 'package:artman_web/config/theme/text_styles.dart';
import 'package:artman_web/config/widgets/search_box.dart';
import 'package:artman_web/core/models/tag_model.dart';
import 'package:artman_web/features/product_list_feature/data/models/product_model.dart';
import 'package:artman_web/features/product_list_feature/presentation/screens/single_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../repository/blocs/cubit/product_cubit.dart';

class ProductsListScreen extends StatelessWidget {
  ProductsListScreen(
      {super.key,
      this.search,
      this.category,
      this.tag,
      required this.title,
      this.args});
  final List<TagModel>? args;
  final String? search;
  final String? tag;
  final String? category;
  final String title;
  final scrollController = ScrollController();
  void setupScrollController(context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          if (tag != null) {
            BlocProvider.of<ProductCubit>(context)
                .loadProducts(tag: tag, isfirstCall: false);
          }
          if (search != null) {
            BlocProvider.of<ProductCubit>(context)
                .loadProducts(search: search, isfirstCall: false);
          }
          if (category != null) {
            BlocProvider.of<ProductCubit>(context)
                .loadProducts(category: category, isfirstCall: false);
          }
          if (category == null && tag == null && search == null) {
            BlocProvider.of<ProductCubit>(context)
                .loadProducts(isfirstCall: false);
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    setupScrollController(context);
    if (tag != null) {
      BlocProvider.of<ProductCubit>(context)
          .loadProducts(tag: tag, isfirstCall: true);
    }
    if (search != null) {
      BlocProvider.of<ProductCubit>(context)
          .loadProducts(search: search, isfirstCall: true);
    }
    if (category != null) {
      BlocProvider.of<ProductCubit>(context)
          .loadProducts(category: category, isfirstCall: true);
    }
    if (category == null && tag == null && search == null) {
      BlocProvider.of<ProductCubit>(context).loadProducts(isfirstCall: true);
    }

    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        //! if its loading for first time
        if (state is ProductLoading && state.isFirstFetch) {
          return Scaffold(
            body: Center(
              child: LoadingAnimationWidget.horizontalRotatingDots(
                  size: 40, color: ColorPallet.secondary),
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
          products = state.product;
        }

        return SafeArea(
          child: Scaffold(
            body: Column(
              children: [
                //! search box ----------------------------------------
                searchBox(context, args),
                //! title-----------------------------------
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "جست و جو در دسته ی $title",
                        style: TextStyles.titleOfPage,
                      )),
                ),
                //! list ----------------------------------------
                Expanded(
                  child: ListView.builder(
                      controller: scrollController,
                      itemCount: products.length + (isLoading ? 1 : 0),
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        if (index < products.length) {
                          var data = products[index];
                          return cartForProductList(context, data, args!);
                        } else {
                          Timer(const Duration(milliseconds: 30), () {
                            setupScrollController(context);
                            scrollController.jumpTo(
                                scrollController.position.maxScrollExtent);
                          });
                        }
                        return Center(
                          child: LoadingAnimationWidget.horizontalRotatingDots(
                            size: 40,
                            color: ColorPallet.secondary,
                          ),
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

Widget cartForProductList(
    BuildContext context, ProductModel model, List<TagModel> args) {
  return InkWell(
    onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: ((context) => SingleProductScreen(
                  args: args,
                  model: model,
                )))),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          Row(
            children: [
              //! image
              Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.height * 0.17,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          //Todo make dynamic
                          image: NetworkImage(model.images[0].url!),
                          fit: BoxFit.fill))),
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
    ),
  );
}
