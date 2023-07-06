//Todo validation of each controller must be implement !!!!

import 'package:artman_web/config/conststants/meassurments.dart';
import 'package:artman_web/config/theme/color_pallet.dart';
import 'package:artman_web/features/auth_feature/presentation/screens/signup_screen.dart';
import 'package:artman_web/features/auth_feature/repository/customer_Api_provider.dart';
import 'package:artman_web/features/auth_feature/repository/models/customer_model.dart';
import 'package:artman_web/locator.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late CustomerApiProvider customerApiProvider;
  late CustomerModel customerModel;
  @override
  void initState() {
    customerApiProvider = locator<CustomerApiProvider>();
    customerModel = CustomerModel();
    super.initState();
  }

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController= TextEditingController();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            //! logo
            Container(
              margin: const EdgeInsets.only(top: 50),
              width: MediaQuery.of(context).size.width,
              height: 150,
              child: Image.asset(
                "assets/icons/login.png",
                fit: BoxFit.fitHeight,
              ),
            ),
            //! welcoming text
            Padding(
              padding: const EdgeInsets.only(bottom: 50 , top:16 ),
              child: Text(
                "ورود به حساب کاربری",
                style: TextStyle(
                    fontSize: 24,
                    fontFamily: "sens",
                    fontWeight: FontWeight.w700,
                    color: ColorPallet.mainTextColor),
              ),
            ),
            //! username
            Container(
              margin: const EdgeInsets.all(12),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: MediaQuery.of(context).size.width * 0.8,
              height: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Meassurments.boxBorderRadius),
                  color: ColorPallet.background,
                  border: Border.all(width: 2, color: ColorPallet.searchBox)),
              child: Row(
                children: [
                  //! icon
                  const Icon(Icons.person),
                  const SizedBox(width: 10,),
                  SizedBox(
                    width: 170,
                    child: TextFormField(
                        controller: usernameController,
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return 'this field is required !';
                          }
                          return null;
                        },
                        decoration: InputDecoration.collapsed(
                            hintText: "نام کاربری",
                            hintStyle: TextStyle(
                                fontSize: 15,
                                fontFamily: "sens",
                                fontWeight: FontWeight.w500,
                                color: ColorPallet.hintColor))),
                  ),
                ],
              ),
            ),
            //! password 
            Container(
              margin: const EdgeInsets.all(12),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: MediaQuery.of(context).size.width * 0.8,
              height: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: ColorPallet.background,
                  border: Border.all(width: 2, color: ColorPallet.searchBox)),
              child: Row(
                children: [
                  //! icon
                  const Icon(Icons.lock),const SizedBox(width: 10,),
                  SizedBox(
                    width: 170,
                    child: TextFormField(
                        controller: passwordController,
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return 'this field is required !';
                          }
                          return null;
                        },
                        decoration: InputDecoration.collapsed(
                            hintText: "رمز عبور",
                            hintStyle: TextStyle(
                                fontSize: 15,
                                fontFamily: "sens",
                                fontWeight: FontWeight.w500,
                                color: ColorPallet.hintColor))),
                  ),
                ],
              ),
            ),
            //! register button
            GestureDetector(
              onTap: () {
                // todo --> validate data
                customerApiProvider.loginCustomer(usernameController.text, passwordController.text);
              },
              child: Container(
                margin: const EdgeInsets.only(top: 30, bottom: 12),
                width: 130,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: ColorPallet.secondary),
                child: Center(
                    child: Text(
                  "ورود",
                  style: TextStyle(
                      fontSize: 24,
                      fontFamily: "sens",
                      fontWeight: FontWeight.w700,
                      color: ColorPallet.background),
                )),
              ),
            ),
            //! signin option text
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "ثبت نام نکردی ؟  ",
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: "sens",
                      fontWeight: FontWeight.w700,
                      color: ColorPallet.mainTextColor),
                ),
                TextButton(
                    onPressed: () {
                      //todo navigate to login page
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return const SignUpScren();
                      })) ; 
                    },
                    child: const Text(
                      "ثبت نام",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: "sens",
                          fontWeight: FontWeight.w700,
                          color: Colors.blue),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// Padding(
//               padding: const EdgeInsets.only(top: 20 , bottom: 20),
//               child: Text(
//                 "ایجاد حساب جدید",
//                 style: TextStyle(
//                     fontSize: 24,
//                     fontFamily: "sens",
//                     fontWeight: FontWeight.w700,
//                     color: ColorPallet.searchBox),
//               ),
//             ),