import 'package:artman_web/config/theme/color_pallet.dart';
import 'package:artman_web/config/theme/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PersonScreen extends StatelessWidget {
  const PersonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorPallet.background,
        body: Column(
          children: [
            //! header container 
            Container(
              margin: const EdgeInsets.only(bottom: 30),
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.24,
            decoration: BoxDecoration(
              color: ColorPallet.secondary,
              borderRadius: const BorderRadius.only(bottomRight: Radius.circular(100) , bottomLeft: Radius.circular(100))),
              child: Column(children: [
                const Align(alignment: Alignment.centerLeft, child: Icon(Icons.notifications)), 
                const SizedBox(height: 20,),
                Icon(Icons.person ,size: 60,color: ColorPallet.background,),
                const SizedBox(height: 8,),
                Text("ثریا قاسمی ", style: TextStyles.personName,),
                Text("qasem@gmail.com", style: TextStyles.personName,),
              ],),
            ),   
            //! wallet 
            Container(
              width:MediaQuery.of(context).size.width * 0.75 ,
              height: 80,
              decoration:  BoxDecoration(
                color: const Color.fromARGB(240, 255, 147, 140),
                borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  //! icon 
                  const Icon(Icons.wallet , size: 45,),
                  //! vlue 
                  const Text("590,000",style: TextStyle(fontSize:18, color: Colors.black , fontWeight: FontWeight.bold ,fontFamily: "sens")),
                  //! perfix 
                  const Text("تومان",style: TextStyle(fontSize:14, color: Colors.black , fontWeight: FontWeight.bold ,fontFamily: "sens")),
                  //! manage 
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    width: 90,
                    height: 45,
                    decoration:  BoxDecoration(
                      boxShadow: [BoxShadow(color: ColorPallet.hintColor ,blurRadius: 3, spreadRadius: 0)],
                      color: ColorPallet.background,
                      borderRadius:const BorderRadius.only(topRight: Radius.circular(15) , bottomRight: Radius.circular(15))
                      ),
                    child:  Row(
                      children: [
                    Container(width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: ColorPallet.mainTextColor,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    ),
                    const SizedBox(
                      width: 70,
                      height: 45 ,
                      child: Center(child: Text("مدیریت کیف پول",
                      style: TextStyle(fontSize:14, color: Colors.black , fontWeight: FontWeight.bold ,fontFamily: "sens"),
                      textAlign: TextAlign.center,
                      ))),
                      ],
                    ),
                  )
                ],),
              ),
            //! options 
            //*line
            const Padding(
              padding: EdgeInsets.only(left: 50, right: 50 , top: 40),
              child: Divider(color: Colors.black,height: 1,thickness: 1,),
            ),
            //! سفارش های من 
            SizedBox(height: 10,),
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: ColorPallet.searchBox),
               width:MediaQuery.of(context).size.width * 0.50 ,
              height: 50,
              child: const Row(
                children: [
                SizedBox(width: 10,),
                Icon(Icons.person),
                SizedBox(width: 10,),
                Text("سفارش های من",style: TextStyle(fontSize:17, color: Colors.black , fontWeight: FontWeight.bold ,fontFamily: "sens")),
                ],
              ),
            ),

            //! ادرس های من 
             SizedBox(height: 10,),
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: ColorPallet.searchBox),
               width:MediaQuery.of(context).size.width * 0.50 ,
              height: 50,
              child: const Row(
                children: [
                SizedBox(width: 10,),
                Icon(Icons.map),
                SizedBox(width: 10,),
                Text("آدرس های من",style: TextStyle(fontSize:17, color: Colors.black , fontWeight: FontWeight.bold ,fontFamily: "sens")),
                ],
              ),
            ),
            //!تنظیمات کاربری 
             SizedBox(height: 10,),
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: ColorPallet.searchBox),
               width:MediaQuery.of(context).size.width * 0.50 ,
              height: 50,
              child: const Row(
                children: [
                SizedBox(width: 10,),
                Icon(Icons.edit),
                SizedBox(width: 10,),
                Text("ویرایش حساب",style: TextStyle(fontSize:17, color: Colors.black , fontWeight: FontWeight.bold ,fontFamily: "sens")),
                ],
              ),
            ),
             SizedBox(height: 10,),
            //! پشتیبانی 
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: ColorPallet.searchBox),
               width:MediaQuery.of(context).size.width * 0.50 ,
              height: 50,
              child: const Row(
                children: [
                SizedBox(width: 10,),
                Icon(Icons.support),
                SizedBox(width: 10,),
                Text("پشتیبانی فروش",style: TextStyle(fontSize:17, color: Colors.black , fontWeight: FontWeight.bold ,fontFamily: "sens")),
                ],
              ),
            ),
             SizedBox(height: 10,),
            //! خروج 
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: ColorPallet.secondary),
               width:MediaQuery.of(context).size.width * 0.50 ,
              height: 50,
              child: const Row(
                children: [
                SizedBox(width: 10,),
                Icon(Icons.logout),
                SizedBox(width: 10,),
                Text("خروج",style: TextStyle(fontSize:17, color: Colors.black , fontWeight: FontWeight.bold ,fontFamily: "sens")),
                ],
              ),
            ),
            ]),
                  ));
  }     
}