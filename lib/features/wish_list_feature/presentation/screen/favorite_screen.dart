import 'package:artman_web/config/conststants/text_consts.dart';
import 'package:artman_web/config/theme/color_pallet.dart';
import 'package:artman_web/config/theme/text_styles.dart';
import 'package:artman_web/config/widgets/search_box.dart';
import 'package:artman_web/features/product_list_feature/data/models/product_model.dart';
import 'package:artman_web/features/product_list_feature/presentation/screens/product_list_screen.dart';
import 'package:artman_web/features/product_list_feature/presentation/screens/single_product_screen.dart';
import 'package:artman_web/features/wish_list_feature/repository/blocs/cubit/wishlist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteScreen extends StatelessWidget {
  static const String routName = "wish";
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishlistCubit, WishlistState>(
      builder: (context, state) {
        var cubit = WishlistCubit.get(context);
        //! refresh box
        List<ProductModel> wishList = [];
        for (var item in cubit.wishList!) {
          wishList.add(item);
        }
        return Scaffold(
          backgroundColor: ColorPallet.background,
          body: Column(
            children: [
              //! search box ----------------------------------------
              searchBox(context,),
              //! title-----------------------------------
              Padding(
                padding: const EdgeInsets.all(10),
                child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      TextConsts.favorites,
                      style: TextStyles.titleOfPage,
                    )),
              ),
              //! list ----------------------------------------
              wishList.length > 0
                  ? Expanded(
                      child: ListView.builder(
                          itemCount: wishList.length,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            var data = wishList[index];
                            //! card
                            return InkWell(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SingleProductScreen(
                                          model: data,))),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        //! image
                                        Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.3,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.17,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    //Todo make dynamic
                                                    image: NetworkImage(
                                                        data.images[0].url!),
                                                    fit: BoxFit.fill))),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            //! title
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10, bottom: 10),
                                              child: SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.6,
                                                  child: Text(
                                                    data.name!,
                                                    style: TextStyles
                                                        .nameOfPrudoctList,
                                                  )),
                                            ),
                                            //! rate
                                            const Padding(
                                              padding: EdgeInsets.only(
                                                  right: 10, bottom: 10),
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
                                              padding: const EdgeInsets.only(
                                                  right: 10),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    data.price!,
                                                    style: TextStyles
                                                        .nameOfPrudoctList,
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
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 19),
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
                          }),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(top: 200),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "هیچ محصولی رو اضافه نکردی هنوز ",
                            style: TextStyle(
                                fontSize: 17,
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.bold,
                                fontFamily: "sens"),
                            textAlign: TextAlign.center,
                          ),
                          //! see all products button
                          GestureDetector(
                              onTap: () async {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (contex) {
                                  return ProductsListScreen(
                                       title: "محصولات تمدونی");
                                }));
                              },
                              child: Container(
                                margin:
                                    const EdgeInsets.only(top: 30, bottom: 12),
                                width: 130,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: ColorPallet.secondary),
                                child: Center(
                                    child: Text(
                                  "دیدن محصولات",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: "sens",
                                      fontWeight: FontWeight.w700,
                                      color: ColorPallet.background),
                                )),
                              )),
                        ],
                      ),
                    ),
            ],
          ),
        );
      },
    );
  }
}
