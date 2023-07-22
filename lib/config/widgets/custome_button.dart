import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../features/auth_feature/data/models/customer_model.dart';
import '../../features/cart_feature/presentation/screens/shipping_and_payment_screen.dart';
import '../theme/color_pallet.dart';

class CustomeButton extends StatelessWidget {
  const CustomeButton(
      {super.key,
      required this.title,
      required this.totalprice,
      required this.action});

  final String title;
  final Function action;
  final String totalprice;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        List<CustomerModel>? customerBox = [];
        var box = await Hive.openBox<CustomerModel>("customers");
        List<int> keys = [];
        keys = box.keys.cast<int>().toList();
        customerBox = [];
        for (var key in keys) {
          customerBox.add(box.get(key)!);
        }
        box.close();

        customerBox.isNotEmpty ? Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ShippingAndPaymentScreen(
            totalprice: totalprice,
          );
        })):  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: const Text("اول باید ثبت نام کنی",
                            style: TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.bold,
                                fontFamily: "sens")),
                        backgroundColor: ColorPallet.secondary,
                      ));

        
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        width: 140,
        height: 50,
        decoration: BoxDecoration(
            color: ColorPallet.secondary,
            borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: Text(title,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontFamily: "sens",
                    fontWeight: FontWeight.bold))),
      ),
    );
  }
}
