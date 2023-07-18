import 'package:artman_web/config/theme/color_pallet.dart';
import 'package:artman_web/features/cart_feature/data/models/order_detail_model.dart';
import 'package:artman_web/features/cart_feature/data/remote_data/order_api_provider.dart';
import 'package:artman_web/locator.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class MyorderDetailScreen extends StatelessWidget {
  MyorderDetailScreen({super.key, required this.orderid});
  final int orderid;
  final OrderAPiProvider orderAPiProvider = locator();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: getOrderDetail(orderid)),
    );
  }
  Widget getOrderDetail(int id) {
    return FutureBuilder(
        future: orderAPiProvider.getOrderDetail(id),
        builder: (context, AsyncSnapshot<OrderDetailModel> model) {
          if (model.hasData) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //! id
                Row(
                  children: [
                    const Text("شناسه: "),
                    Text(model.data!.orderid.toString()),
                  ],
                ),
                //! date
                Row(
                  children: [
                    const Text("تاریخ :"),
                    Text(DateFormat('yyyy-MM-dd – kk:mm')
                        .format(model.data!.orderDate!))
                  ],
                ),
                //! delivered
                const Text("ادرس: "),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(model.data!.shipping!.city!),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(model.data!.shipping!.country!),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(model.data!.shipping!.address2!),
                  ],
                ),
                const Divider(),
                //! status
                const Row(
                  children: [
                    Text("وضعیت مرسوله : "),
                    Text("در حال پردازش"),
                  ],
                ),
                const Divider(),
                //! list
                Expanded(
                  child: ListView.builder(
                    itemCount: model.data!.lineItems!.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(10),
                        color: Colors.amber,
                        width: 100,
                        height: 100,
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            //! شناسه
                            Row(
                              children: [
                                const Text("شناسه محصول  : "),
                                Text(model.data!.lineItems![index].productId.toString()),
                              ],
                            ),
                            //! تعداد
                            Row(
                              children: [
                                const Text("تعداد :  "),
                                Text(model.data!.lineItems![index].qty.toString()),
                              ],
                            ),
                            ],
                          ),
                          Row(children: [
                            const Text("قیمت محصول  :  "),
                            Text(model.data!.lineItems![index].total.toString())
                          ],)
                        ],) ,
                      );
                    },
                  ),
                ),
                //! amount 
                const Divider(),
                Row(children: [
                  const Text("قیمت کل  :  "),
                  Text(model.data!.totalAmount.toString()),
                  const Text("  تومان"),
                ],)
              ],
            );
          } else {
            return Center(
                child: LoadingAnimationWidget.horizontalRotatingDots(
                    color: ColorPallet.secondary, size: 40));
          }
        });
  }
}
