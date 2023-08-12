// import 'dart:async';
// import 'dart:ffi';

import 'package:artman_web/config/conststants/api_const.dart';
import 'package:artman_web/config/theme/color_pallet.dart';
import 'package:artman_web/features/cart_feature/data/models/customer_detail.dart';
import 'package:artman_web/features/cart_feature/data/models/order.dart';
import 'package:artman_web/features/cart_feature/data/remote_data/order_api_provider.dart';
import 'package:artman_web/features/cart_feature/repository/blocs/cubit/cart_product_cubit.dart';
import 'package:artman_web/features/main_wrapper.dart';
import 'package:artman_web/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
// import 'package:uni_links/uni_links.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:zarinpal/zarinpal.dart';

import '../../../../config/conststants/dimens.dart';
import '../../../../core/models/tag_model.dart';

// ignore: must_be_immutable
class ShippingAndPaymentScreen extends StatefulWidget {
  final List<TagModel>? args;
  final String totalprice;
  const ShippingAndPaymentScreen(
      {super.key, required this.totalprice, this.args});

  @override
  State<ShippingAndPaymentScreen> createState() =>
      _ShippingAndPaymentScreenState();
}

class _ShippingAndPaymentScreenState extends State<ShippingAndPaymentScreen> {
  //controllers
  TextEditingController name = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController addrs1 = TextEditingController();
  TextEditingController addrs2 = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController stateConrollere = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController postcode = TextEditingController();
  bool isShowProgressIndicator = false;
  List<LineItemModel> lineitemList = [];
  OrderAPiProvider orderAPiProvider = locator();
  // PaymentRequest paymentRequest = PaymentRequest();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ثبت خرید"),
        backgroundColor: ColorPallet.secondary,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                "برای ادامه مشخصات خود را وارد کنید",
                style: TextStyle(
                    fontSize: 16,
                    color: ColorPallet.mainTextColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: "sens"),
              ),
            ),
            //! name
            Container(
              margin: const EdgeInsets.all(12),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: MediaQuery.of(context).size.width * 0.8,
              height: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimens.boxBorderRadius),
                  color: ColorPallet.background,
                  border: Border.all(width: 2, color: ColorPallet.searchBox)),
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
            //! last name
            Container(
              margin: const EdgeInsets.all(12),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: MediaQuery.of(context).size.width * 0.8,
              height: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimens.boxBorderRadius),
                  color: ColorPallet.background,
                  border: Border.all(width: 2, color: ColorPallet.searchBox)),
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
            //! address
            Container(
              margin: const EdgeInsets.all(12),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: MediaQuery.of(context).size.width * 0.8,
              height: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimens.boxBorderRadius),
                  color: ColorPallet.background,
                  border: Border.all(width: 2, color: ColorPallet.searchBox)),
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
            //! address2
            Container(
              margin: const EdgeInsets.all(12),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: MediaQuery.of(context).size.width * 0.8,
              height: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimens.boxBorderRadius),
                  color: ColorPallet.background,
                  border: Border.all(width: 2, color: ColorPallet.searchBox)),
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
            //! country
            Container(
              margin: const EdgeInsets.all(12),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: MediaQuery.of(context).size.width * 0.8,
              height: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimens.boxBorderRadius),
                  color: ColorPallet.background,
                  border: Border.all(width: 2, color: ColorPallet.searchBox)),
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
            //! State
            Container(
              margin: const EdgeInsets.all(12),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: MediaQuery.of(context).size.width * 0.8,
              height: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimens.boxBorderRadius),
                  color: ColorPallet.background,
                  border: Border.all(width: 2, color: ColorPallet.searchBox)),
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
            //! city
            Container(
              margin: const EdgeInsets.all(12),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: MediaQuery.of(context).size.width * 0.8,
              height: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimens.boxBorderRadius),
                  color: ColorPallet.background,
                  border: Border.all(width: 2, color: ColorPallet.searchBox)),
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
            //! post code
            Container(
              margin: const EdgeInsets.all(12),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: MediaQuery.of(context).size.width * 0.8,
              height: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimens.boxBorderRadius),
                  color: ColorPallet.background,
                  border: Border.all(width: 2, color: ColorPallet.searchBox)),
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

            const Divider(),
            //! paymemt
            BlocBuilder<CartProductCubit, CartProductState>(
              builder: (context, state) {
                return InkWell(
                  onTap: () async {
                    var cubit = CartProductCubit.get(context);
                    for (var item in cubit.cartProductList!) {
                      lineitemList.add(LineItemModel(
                          productId: item.productId,
                          qty: item.qty,
                          total: item.price));
                    }
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
                    var order = OrderModel(
                        customerId: int.parse(ApiConstants.useridTMP),
                        paymentMethod: "paymentMethod",
                        paymentMethodTitle: "zarinpal",
                        setPaid: true,
                        transactionId: "2",
                        lineItems: lineitemList,
                        orderId: 1,
                        orderNumber: "1",
                        status: "completed",
                        orderDate: DateTime.now(),
                        shipping: shiping);
                    setState(() {
                      isShowProgressIndicator = true;
                    });

                    // //! payment
                    // paymentRequest
                    //   ..setIsSandBox(true)
                    //   ..setAmount(double.parse(widget.totalprice))
                    //   ..setMerchantID("")
                    //   ..setCallbackURL("https://eddy.dastyar.site");

                    // ZarinPal().startPayment(paymentRequest,
                    //     (status, paymentGatewayUri) {
                    //   if (status == 100) {
                    //     launchUrl(Uri.parse(paymentGatewayUri!),
                    //         mode: LaunchMode.externalApplication);
                    //   }
                    // });
                    // late StreamSubscription sub;
                    // String recevedLink = '';
                    // sub = linkStream.listen((String? link) {
                    //   recevedLink = link!;
                    //   if (recevedLink.toLowerCase().contains("status")) {
                    //     String status = recevedLink.split("=").last;
                    //     String authority = recevedLink
                    //         .split("?")[1]
                    //         .split("&")[0]
                    //         .split("=")[1];
                    //     ZarinPal().verificationPayment(status, authority, paymentRequest,
                    //     (isPaymentSuccess, refID, paymentRequest){
                    //       if(isPaymentSuccess){
                    //         debugPrint("success");
                    //       }
                    //       else{
                    //         print("not ok");
                    //       }

                    //     });
                    //   }

                    // });

                    //! submit order
                    await orderAPiProvider.creatOrder(order) == true
                        ? ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                            content: Text('سفارش شما با موفقیت ثبت شد'),
                            backgroundColor: Color.fromARGB(255, 108, 255, 115),
                          ))
                        : ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                            content: Text('مشکلی توی ثبت سفارش رخ داده'),
                            backgroundColor: Color.fromARGB(255, 255, 171, 132),
                          ));
                    setState(() {
                      isShowProgressIndicator = false;
                    });
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return MainWrapper(
                        
                      );
                    }));
                  },
                  child: isShowProgressIndicator
                      ? LoadingAnimationWidget.horizontalRotatingDots(
                          size: 40, color: Colors.white)
                      : Container(
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
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.totalprice),
                const Text("تومان"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
