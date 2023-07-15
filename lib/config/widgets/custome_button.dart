import 'package:flutter/material.dart';

import '../../features/cart_feature/presentation/screens/Shipping_And_PaymentScreen.dart';
import '../theme/color_pallet.dart';

class CustomeButton extends StatelessWidget {
  const CustomeButton(
      {super.key,
      required this.title,
      required this.totalprice,
      required this.action});

  final String title ; 
  final Function action;
  final String totalprice ; 


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context){return  ShippingAndPaymentScreen(totalprice: totalprice,);}));

      },
      child: Container(
        margin: const EdgeInsets.all(10),
        width: 140,
        height: 50,
        decoration: BoxDecoration(
            color: ColorPallet.secondary,
            borderRadius: BorderRadius.circular(10)),
        child:  Center(
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