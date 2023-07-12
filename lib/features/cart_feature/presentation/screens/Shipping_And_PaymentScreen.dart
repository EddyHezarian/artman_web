import 'package:artman_web/config/conststants/api_const.dart';
import 'package:artman_web/config/theme/color_pallet.dart';
import 'package:artman_web/features/cart_feature/data/models/customer_detail.dart';
import 'package:artman_web/features/cart_feature/data/models/order.dart';
import 'package:artman_web/features/cart_feature/data/remote_data/order_api_provider.dart';
import 'package:artman_web/features/cart_feature/repository/blocs/cubit/cart_product_cubit.dart';
import 'package:artman_web/locator.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/conststants/meassurments.dart';

// ignore: must_be_immutable
class ShippingAndPaymentScreen extends StatelessWidget {
  //controllers
  TextEditingController name = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController addrs1 = TextEditingController();
  TextEditingController addrs2 = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController stateConrollere = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController postcode = TextEditingController();
  //
  List<LineItemModel> lineitemList = [];
  OrderAPiProvider orderAPiProvider =locator();

  ShippingAndPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartProductCubit, CartProductState>(
      builder: (context, state) {
        var cubit = CartProductCubit.get(context);
        for (var item in cubit.cartProductList!) {
          lineitemList
              .add(LineItemModel(productId: item.productId, qty: item.qty));
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text("ثبت خرید"),
            backgroundColor: ColorPallet.secondary,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text("برای ادامه مشخصات خود را وارد کنید"),
                ),

                //! infos
                Container(
                  margin: const EdgeInsets.all(12),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(Meassurments.boxBorderRadius),
                      color: ColorPallet.background,
                      border:
                          Border.all(width: 2, color: ColorPallet.searchBox)),
                  child: Row(
                    children: [
                      //! icon
                      const Icon(Icons.person),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: 170,
                        child: TextFormField(
                            controller: name,
                            validator: (value) {
                              if (value.toString().isEmpty) {
                                return 'this field is required !';
                              }
                              return null;
                            },
                            decoration: InputDecoration.collapsed(
                                hintText: "نام ",
                                hintStyle: TextStyle(
                                    fontSize: 15,
                                    fontFamily: "sens",
                                    fontWeight: FontWeight.w500,
                                    color: ColorPallet.hintColor))),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(12),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(Meassurments.boxBorderRadius),
                      color: ColorPallet.background,
                      border:
                          Border.all(width: 2, color: ColorPallet.searchBox)),
                  child: Row(
                    children: [
                      //! icon
                      const Icon(Icons.person),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: 170,
                        child: TextFormField(
                            controller: lastname,
                            validator: (value) {
                              if (value.toString().isEmpty) {
                                return 'this field is required !';
                              }
                              return null;
                            },
                            decoration: InputDecoration.collapsed(
                                hintText: "نام خانوادگی ",
                                hintStyle: TextStyle(
                                    fontSize: 15,
                                    fontFamily: "sens",
                                    fontWeight: FontWeight.w500,
                                    color: ColorPallet.hintColor))),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(12),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(Meassurments.boxBorderRadius),
                      color: ColorPallet.background,
                      border:
                          Border.all(width: 2, color: ColorPallet.searchBox)),
                  child: Row(
                    children: [
                      //! icon
                      const Icon(Icons.maps_home_work),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: 170,
                        child: TextFormField(
                            controller: addrs1,
                            validator: (value) {
                              if (value.toString().isEmpty) {
                                return 'this field is required !';
                              }
                              return null;
                            },
                            decoration: InputDecoration.collapsed(
                                hintText: "آدرس",
                                hintStyle: TextStyle(
                                    fontSize: 15,
                                    fontFamily: "sens",
                                    fontWeight: FontWeight.w500,
                                    color: ColorPallet.hintColor))),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(12),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(Meassurments.boxBorderRadius),
                      color: ColorPallet.background,
                      border:
                          Border.all(width: 2, color: ColorPallet.searchBox)),
                  child: Row(
                    children: [
                      //! icon
                      const Icon(Icons.apartment),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: 170,
                        child: TextFormField(
                            controller: addrs2,
                            validator: (value) {
                              if (value.toString().isEmpty) {
                                return 'this field is required !';
                              }
                              return null;
                            },
                            decoration: InputDecoration.collapsed(
                                hintText: "جزییات(پلاک ، واحد و ...)",
                                hintStyle: TextStyle(
                                    fontSize: 15,
                                    fontFamily: "sens",
                                    fontWeight: FontWeight.w500,
                                    color: ColorPallet.hintColor))),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(12),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(Meassurments.boxBorderRadius),
                      color: ColorPallet.background,
                      border:
                          Border.all(width: 2, color: ColorPallet.searchBox)),
                  child: Row(
                    children: [
                      //! icon
                      const Icon(Icons.flag),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: 170,
                        child: TextFormField(
                            controller: country,
                            validator: (value) {
                              if (value.toString().isEmpty) {
                                return 'this field is required !';
                              }
                              return null;
                            },
                            decoration: InputDecoration.collapsed(
                                hintText: "کشور",
                                hintStyle: TextStyle(
                                    fontSize: 15,
                                    fontFamily: "sens",
                                    fontWeight: FontWeight.w500,
                                    color: ColorPallet.hintColor))),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(12),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(Meassurments.boxBorderRadius),
                      color: ColorPallet.background,
                      border:
                          Border.all(width: 2, color: ColorPallet.searchBox)),
                  child: Row(
                    children: [
                      //! icon
                      const Icon(Icons.location_city),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: 170,
                        child: TextFormField(
                            controller: stateConrollere,
                            validator: (value) {
                              if (value.toString().isEmpty) {
                                return 'this field is required !';
                              }
                              return null;
                            },
                            decoration: InputDecoration.collapsed(
                                hintText: "استان",
                                hintStyle: TextStyle(
                                    fontSize: 15,
                                    fontFamily: "sens",
                                    fontWeight: FontWeight.w500,
                                    color: ColorPallet.hintColor))),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(12),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(Meassurments.boxBorderRadius),
                      color: ColorPallet.background,
                      border:
                          Border.all(width: 2, color: ColorPallet.searchBox)),
                  child: Row(
                    children: [
                      //! icon
                      const Icon(Icons.location_on),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: 170,
                        child: TextFormField(
                            controller: city,
                            validator: (value) {
                              if (value.toString().isEmpty) {
                                return 'this field is required !';
                              }
                              return null;
                            },
                            decoration: InputDecoration.collapsed(
                                hintText: "شهر",
                                hintStyle: TextStyle(
                                    fontSize: 15,
                                    fontFamily: "sens",
                                    fontWeight: FontWeight.w500,
                                    color: ColorPallet.hintColor))),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(12),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(Meassurments.boxBorderRadius),
                      color: ColorPallet.background,
                      border:
                          Border.all(width: 2, color: ColorPallet.searchBox)),
                  child: Row(
                    children: [
                      //! icon
                      const Icon(Icons.local_post_office_outlined),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: 170,
                        child: TextFormField(
                            controller: postcode,
                            validator: (value) {
                              if (value.toString().isEmpty) {
                                return 'this field is required !';
                              }
                              return null;
                            },
                            decoration: InputDecoration.collapsed(
                                hintText: "کد پستی",
                                hintStyle: TextStyle(
                                    fontSize: 15,
                                    fontFamily: "sens",
                                    fontWeight: FontWeight.w500,
                                    color: ColorPallet.hintColor))),
                      ),
                    ],
                  ),
                ),
                //
                const Divider(),
                //! paymemt
                InkWell(
                  onTap: () {
                    var shiping = Shipping(
                      address1: addrs1.text,
                      address2: addrs2.text,
                      lastname: lastname.text,
                      firstname: name.text,
                      city: city.text,
                      postCode: postcode.text,
                      company: "nothing",
                      state: stateConrollere.text,
                      country: country.text,
                    );
                    // var biling = Billing(
                    //   phone: "09391556862",
                    //   email: "eddyhzn@gmail.com",
                    //   address1: addrs1.text,
                    //   address2: addrs2.text,
                    //   lastname: lastname.text,
                    //   firstname: name.text,
                    //   city: city.text,
                    //   postCode: postcode.text,
                    //   company: "nothing",
                    //   state: stateConrollere.text,
                    //   country: country.text,
                    // );
                    var order = OrderModel(
                        customerId: int.parse(ApiConstants.useridTMP),
                        paymentMethod: "paymentMethod",
                        paymentMethodTitle: "paymentMethodTitle",
                        setPaid: true,
                        transactionId: "2",
                        lineItems: lineitemList,
                        orderId: 1,
                        orderNumber: "1",
                        status: "completed",
                        orderDate: DateTime.now(),
                        shipping: shiping);
                    
                    orderAPiProvider.creatOrder(order) == true ? 
                    ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('order failed'),
                            backgroundColor: Color.fromARGB(255, 255, 171, 132),
                          ))
                    :ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('order succsussfull'),
                            backgroundColor: Color.fromARGB(255, 108, 255, 115),
                          ))
                      ;
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    width: 140,
                    height: 50,
                    decoration: BoxDecoration(
                        color: ColorPallet.secondary,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                        child: Text("پرداخت",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontFamily: "sens",
                                fontWeight: FontWeight.bold))),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("399000"),
                    const Text("تومان"),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
