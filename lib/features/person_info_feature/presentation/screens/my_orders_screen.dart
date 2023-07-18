import 'package:artman_web/config/theme/color_pallet.dart';
import 'package:artman_web/features/cart_feature/data/models/order.dart';
import 'package:artman_web/features/person_info_feature/repository/blocs/my_orders_cubit/cubit/myorder_cubit.dart';
import 'package:artman_web/features/person_info_feature/presentation/screens/myorder_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../config/theme/text_styles.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<MyorderCubit>(context).loadOrders();
    return BlocBuilder<MyorderCubit, MyOrderState>(
      builder: (context, state) {
        List<OrderModel> orderList = [];
        if (state is OrderLoading) {
          orderList = state.oldOrder;
          return Scaffold(
            body: Center(
              child: LoadingAnimationWidget.horizontalRotatingDots(
                  color: ColorPallet.secondary, size: 40),
            ),
          );
        } else if (state is OrderLoaded) {
          orderList = state.orders;
        }
        return SafeArea(
          child: Scaffold(
            body: Column(
              children: [
                //! title-----------------------------------
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "سفارش های من",
                        style: TextStyles.titleOfPage,
                      )),
                ),
                //! list ----------------------------------------
                Expanded(
                  child: ListView.builder(
                      itemCount: orderList.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        var data = orderList[index];
                        return SizedBox(
                        height: 160,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.timer,
                                    color: Color.fromARGB(255, 255, 145, 0),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                      data.status == "processing"
                                          ? "در حال پردازش"
                                          : "کامل شده",
                                      style: const TextStyle(
                                          fontSize: 14,
                                          color: Color.fromARGB(255, 50, 50, 50),
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "sens")),
                                ],
                              ),
                            
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return MyorderDetailScreen(orderid: data.orderId!);}
                                  ));
                              },
                              child: Stack(
                                children:[ 
                                  Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 10),
                                  height: 110,
                                  decoration: BoxDecoration(color: ColorPallet.searchBox ,borderRadius: BorderRadius.circular(15)),
                                  child: Column(
                                    children: [
                                      //! id 
                                      Padding(
                                        padding: const EdgeInsets.only(right: 10,top: 10),
                                        child: Row(children: [
                                          const Icon(Icons.info),
                                          const SizedBox(width: 10,),
                                          const Text(
                                            "شناسه ی مرسوله :"
                                            ,
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Color.fromARGB(255, 50, 50, 50),
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "sens")
                                          ),
                                          const SizedBox(width: 10,),
                                          Text(data.orderId.toString()),
                                          
                                        ],),
                                      ),
                                      //! date time 
                                      Padding(
                                        padding: const EdgeInsets.only(right: 10,top: 10),
                                        child: Row(children: [
                                          const Icon(Icons.date_range_rounded),
                                          const SizedBox(width: 10,),
                                          const Text(
                                            "تاریخ ثبت :"
                                            ,
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Color.fromARGB(255, 50, 50, 50),
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "sens")
                                          ),
                                          const SizedBox(width: 10,),
                                          Text( DateFormat('yyyy-MM-dd – kk:mm').format(data.orderDate!)),
                                        ],),
                                      ),
                                    ],
                                  ),
                                ),
                                  const Positioned(left: 30,top: 10 ,bottom: 10,child: Icon(Icons.more_vert) ,)
                                                      ]),
                            )
                          ],
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
