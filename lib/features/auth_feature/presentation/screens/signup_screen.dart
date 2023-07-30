import 'package:artman_web/config/conststants/meassurments.dart';
import 'package:artman_web/config/theme/color_pallet.dart';
import 'package:artman_web/features/auth_feature/presentation/screens/login_screen.dart';
import 'package:artman_web/features/auth_feature/data/remote_data/customer_api_provider.dart';
import 'package:artman_web/features/auth_feature/repository/auth_repository.dart';
import 'package:artman_web/features/main_wrapper.dart';
import 'package:artman_web/locator.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../core/models/tag_model.dart';
import '../../data/models/customer_model.dart';

class SignUpScren extends StatefulWidget {
  final List<TagModel>? args;
  const SignUpScren({super.key, this.args});

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
  bool showWaitingIndicator = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.center,
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return MainWrapper();
                    }),
                    ModalRoute.withName('/'),
                  );
                },
                icon: const Icon(
                  Icons.keyboard_arrow_right,
                  size: 26,
                )),
          ),
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
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Text(
              "ایجاد حساب جدید",
              style: TextStyle(
                  fontSize: 24,
                  fontFamily: "sens",
                  fontWeight: FontWeight.w700,
                  color: ColorPallet.hintColor),
            ),
          ),
          //! نام
          Container(
            margin: const EdgeInsets.all(12),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: MediaQuery.of(context).size.width * 0.8,
            height: 45,
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(Meassurments.boxBorderRadius),
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
                      controller: firstNameController,
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
                const Icon(Icons.person),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 170,
                  child: TextFormField(
                      controller: lastNameController,
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
                const Icon(Icons.lock),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 170,
                  child: TextFormField(
                      obscureText: true,
                      controller: passwordController,
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
              onTap: () async {
                //! check if any of fields is empty
                if (firstNameController.text.isEmpty ||
                    lastNameController.text.isEmpty ||
                    emailController.text.isEmpty ||
                    passwordController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: const Text('همه ی فرم هارو پر کن',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: "sens")),
                    backgroundColor: ColorPallet.secondary,
                  ));
                } else {
                  if (emailController.text.isValidEmail()) {
                    setState(() {
                      showWaitingIndicator = true;
                    });
                    bool isRepetitiveEmail = await customerApiProvider
                        .searchForCustomerByEmail(email: emailController.text);
                    if (isRepetitiveEmail) {
                      setState(() {
                        showWaitingIndicator = false;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: const Text('این ایمیل قبلا ثبت نام شده',
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: "sens")),
                        backgroundColor: ColorPallet.secondary,
                      ));
                    } else {
                      customerApiProvider
                          .createCustomer(CustomerModel(
                        firstName: firstNameController.text,
                        lastName: lastNameController.text,
                        email: emailController.text,
                        password: passwordController.text,
                      ))
                          .then((response) {
                        if (response) {
                          //*show snack bar
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('ثبت نام شدی',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "sens")),
                            backgroundColor: Color.fromARGB(255, 54, 163, 57),
                          ));
                          //* navigate to home page
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return LoginScreen(args: widget.args);
                          }));
                          setState(() {
                            showWaitingIndicator = false;
                          });
                        } else {
                          setState(() {
                            showWaitingIndicator = false;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: const Text('مشکلی توی ثبت نام پیش اومده',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "sens")),
                            backgroundColor: ColorPallet.secondary,
                          ));
                        }
                      });
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: const Text('ایمیل معتبر نیست',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: "sens")),
                      backgroundColor: ColorPallet.secondary,
                    ));
                  }
                }
              },
              child: Container(
                margin: const EdgeInsets.only(top: 30, bottom: 12),
                width: 130,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: ColorPallet.secondary),
                child: Center(
                    child: showWaitingIndicator == false
                        ? Text(
                            "ثبت نام",
                            style: TextStyle(
                                fontSize: 24,
                                fontFamily: "sens",
                                fontWeight: FontWeight.w700,
                                color: ColorPallet.background),
                          )
                        : LoadingAnimationWidget.prograssiveDots(
                            size: 40, color: Colors.white)),
              )),

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
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return LoginScreen(args: widget.args);
                    }));
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
    )));
  }
}
