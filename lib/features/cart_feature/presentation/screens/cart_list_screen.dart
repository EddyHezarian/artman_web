import 'package:artman_web/config/theme/color_pallet.dart';
import 'package:artman_web/config/widgets/custome_button.dart';
import 'package:artman_web/features/cart_feature/data/models/cart_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../product_list_feature/presentation/screens/product_list_screen.dart';
import '../../repository/blocs/cubit/cart_product_cubit.dart';


// ignore: must_be_immutable
class CartListScreen extends StatelessWidget {
  CartListScreen({super.key});
  
  int isAllowToCallGetProducts = 0 ; 

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartProductCubit, CartProductState>(
      builder: (context, state) {
        int totalprice = 0;
        var cubit = CartProductCubit.get(context);
        if(isAllowToCallGetProducts==0 ){isAllowToCallGetProducts =1; }
        if(isAllowToCallGetProducts==1){isAllowToCallGetProducts =2;cubit.getBox(); }
        List<CartProductModel> productList = [];
        for (var item in cubit.cartProductList!) {
          totalprice += int.parse(item.price) * item.qty;
          productList.add(item);
        }

        return Scaffold(
            //! appbar
            appBar: AppBar(
              title: const Text(
                "سبد خرید",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontFamily: "sens",
                    fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
              backgroundColor: ColorPallet.secondary,
            ),
            //! list
            body: productList.length == 0
                ? Center(
                      child: Column(
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
                          GestureDetector(
                              onTap: () async {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (contex) {
                                  return ProductsListScreen(title: "محصولات تمدونی");
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
                    )
                : ListView.separated(
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: productList.length,
                    itemBuilder: (context, index) {
                      var data = productList[index];
                      return Container(
                        padding: const EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.2,
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: Row(
                          children: [
                            //img
                            Container(
                              width: 130,
                              height: MediaQuery.of(context).size.height * 0.18,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      image: NetworkImage(data.img))),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(data.name),
                                  Row(
                                    children: [
                                      Text(data.price),
                                      const Text("تومان"),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                //! delete
                                Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          var model = CartProductModel(
                                              name: data.name,
                                              productId: data.productId,
                                              qty: data.qty,
                                              img: data.img,
                                              price: data.price);
                                          cubit.deleteProduct(model);
                                        },
                                        icon: const Icon(Icons.delete)),
                                    const Text("حذف"),
                                  ],
                                ),
                                //! qty
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        var model = CartProductModel(
                                            name: data.name,
                                            productId: data.productId,
                                            qty: data.qty + 1,
                                            img: data.img,
                                            price: data.price);
                                        cubit.updateQTY(model);
                                      },
                                      child: Container(
                                        width: 25,
                                        height: 25,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: const Color.fromARGB(
                                                255, 255, 188, 188)),
                                        child: const Center(child: Text("+")),
                                      ),
                                    ),
                                    Container(
                                      width: 30,
                                      height: 25,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.white),
                                      child: Center(
                                          child: Text(data.qty.toString())),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        if (data.qty == 1) {
                                          var model = CartProductModel(
                                              name: data.name,
                                              productId: data.productId,
                                              qty: data.qty,
                                              img: data.img,
                                              price: data.price);
                                          cubit.deleteProduct(model);
                                        } else {
                                          var model = CartProductModel(
                                              name: data.name,
                                              productId: data.productId,
                                              qty: data.qty - 1,
                                              img: data.img,
                                              price: data.price);
                                          cubit.updateQTY(model);
                                        }
                                      },
                                      child: Container(
                                        width: 25,
                                        height: 25,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: const Color.fromARGB(
                                                255, 255, 188, 188)),
                                        child: const Center(child: Text("-")),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    }),
            
            //! bottom
            bottomNavigationBar: SizedBox(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //! button
                  CustomeButton(title: "ثبت", totalprice:  totalprice.toString() ,action: () {
                  }),
                  Column(
                    children: [
                      const Text("مبلغ نهایی"),
                      Text(totalprice.toString()),
                    ],
                  )
                ],
              ),
            ));
      },
    );
  }
}
