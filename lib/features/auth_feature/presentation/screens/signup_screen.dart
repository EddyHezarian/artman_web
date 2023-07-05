import 'package:artman_web/config/theme/color_pallet.dart';
import 'package:artman_web/features/auth_feature/presentation/functions/validators.dart';
import 'package:artman_web/features/auth_feature/repository/customer_Api_provider.dart';
import 'package:artman_web/features/auth_feature/repository/models/customer_model.dart';
import 'package:artman_web/locator.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late APIService customerApiProvider;
  late CustomerModel customerModel;
  @override
  void initState() {
    customerApiProvider = APIService();
    customerModel = CustomerModel();

    super.initState();
  }

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //! نام
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: ColorPallet.background,
                border: Border.all(width: 2, color: ColorPallet.secondary)),
            child: TextFormField(
              controller: firstNameController,
              validator: (value) {
                if (value.toString().isEmpty) {
                  return 'this field is required !';
                }
                return null;
              },
              decoration: const InputDecoration.collapsed(hintText: "نام "),
            ),
          ),
          //! نام خانوادگی
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: ColorPallet.background,
                border: Border.all(width: 2, color: ColorPallet.secondary)),
            child: TextFormField(
              controller: lastNameController,
              validator: (value) {
                if (value.toString().isEmpty) {
                  return 'this field is required !';
                }
                return null;
              },
              decoration:
                  const InputDecoration.collapsed(hintText: "نام خانوادگی"),
            ),
          ),
          //! رمز
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: ColorPallet.background,
                border: Border.all(width: 2, color: ColorPallet.secondary)),
            child: TextFormField(
              obscureText: true,
              controller: passwordController,
              validator: (value) {
                if (value.toString().isEmpty) {
                  return 'this field is required !';
                }
                return null;
              },
              decoration: const InputDecoration.collapsed(hintText: "رمز عبور"),
            ),
          ),
          //! ایمیل
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: ColorPallet.background,
                border: Border.all(width: 2, color: ColorPallet.secondary)),
            child: TextFormField(
              controller: emailController,
              validator: (value) {
                if (!value.toString().isValidEmail()) {
                  return 'enter valid email';
                }
                return null;
              },
              decoration: const InputDecoration.collapsed(hintText: "ایمیل"),
            ),
          ),
          //! register button
          GestureDetector(
            onTap: () {

              print(firstNameController.text);
              print(lastNameController.text);
              print(emailController.text);
              print(passwordController.text);
              // todo --> validate date
              customerApiProvider.createCustomer( CustomerModel(
                firstName: firstNameController.text,
                lastName: lastNameController.text,
                email: emailController.text,
                password: passwordController.text,
              )).then((response) { 
              if (response){
                print("passed");
                //Todo navigate to home page and show snack bar
              }
              else{
                print("failed");
              }
              });
              
            },
            child: Container(
              width: 200,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: ColorPallet.secondary),
              child: const Center(child: Text("ثبت نام")),
            ),
          )
        ],
      ),
    );
  }
}




