//Todo validation of each controller must be implement !!!!

import 'package:artman_web/config/conststants/meassurments.dart';
import 'package:artman_web/config/theme/color_pallet.dart';
import 'package:artman_web/features/auth_feature/presentation/screens/login_screen.dart';
import 'package:artman_web/features/auth_feature/repository/customer_Api_provider.dart';
import 'package:artman_web/features/auth_feature/repository/models/customer_model.dart';
import 'package:artman_web/locator.dart';
import 'package:flutter/material.dart';

class SignUpScren extends StatefulWidget {
  const SignUpScren({super.key});

  @override
  State<SignUpScren> createState() => _SignUpScrenState();
}

class _SignUpScrenState extends State<SignUpScren> {
  late CustomerApiProvider customerApiProvider;
  late CustomerModel customerModel;
  @override
  void initState() {
    customerApiProvider = locator<CustomerApiProvider>();
    customerModel = CustomerModel();
    super.initState();
  }

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //! logo
            Container(
              margin: const EdgeInsets.only(top: 50),
              width: MediaQuery.of(context).size.width,
              height: 150,
              child: Image.asset(
                "assets/icons/signup_svg.png",
                fit: BoxFit.fitHeight,
              ),
            ),
            //! welcoming text
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "به تمدونی خوش اومدی !",
                style: TextStyle(
                    fontSize: 24,
                    fontFamily: "sens",
                    fontWeight: FontWeight.w700,
                    color: ColorPallet.mainTextColor),
              ),
            ),
            //! sub text
            Padding(
              padding: const EdgeInsets.only(top: 20 , bottom: 20),
              child: Text(
                "ایجاد حساب جدید",
                style: TextStyle(
                    fontSize: 24,
                    fontFamily: "sens",
                    fontWeight: FontWeight.w700,
                    color: ColorPallet.searchBox),
              ),
            ),
            //! نام
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
                        controller: firstNameController,
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return 'this field is required !';
                          }
                          return null;
                        },
                        decoration: InputDecoration.collapsed(
                            hintText: "نام",
                            hintStyle: TextStyle(
                                fontSize: 15,
                                fontFamily: "sens",
                                fontWeight: FontWeight.w500,
                                color: ColorPallet.hintColor))),
                  ),
                ],
              ),
            ),
            //! نام خانوادگی
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
                  const Icon(Icons.person),const SizedBox(width: 10,),
                  SizedBox(
                    width: 170,
                    child: TextFormField(
                        controller: lastNameController,
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return 'this field is required !';
                          }
                          return null;
                        },
                        decoration: InputDecoration.collapsed(
                            hintText: "نام خانوادگی",
                            hintStyle: TextStyle(
                                fontSize: 15,
                                fontFamily: "sens",
                                fontWeight: FontWeight.w500,
                                color: ColorPallet.hintColor))),
                  ),
                ],
              ),
            ),
            //! رمز
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
            //! ایمیل
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
                  const Icon(Icons.email),
                  SizedBox(
                    width: 170,
                    child: TextFormField(
                        controller: emailController,
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return 'this field is required !';
                          }
                          return null;
                        },
                        decoration: InputDecoration.collapsed(
                            hintText: "ایمیل",
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
                // todo --> validate date
                customerApiProvider
                    .createCustomer(CustomerModel(
                  firstName: firstNameController.text,
                  lastName: lastNameController.text,
                  email: emailController.text,
                  password: passwordController.text,
                ))
                    .then((response) {
                  if (response) {
                    print("passed");
                    //Todo navigate to home page and show snack bar
                  } else {
                    // todo show failed snack bar
                    print("failed");
                  }
                });
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
                  "ثبت نام",
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
                  "قبلا ثبت نام کردی ؟",
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: "sens",
                      fontWeight: FontWeight.w700,
                      color: ColorPallet.mainTextColor),
                ),
                TextButton(
                    onPressed: () {
                      //todo navigate to login page
                      Navigator.push(context, MaterialPageRoute(
                        builder:(context){
                          return const LoginScreen();
                        } 
                        ));
                    },
                    child: const Text(
                      "وارد شوید",
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
