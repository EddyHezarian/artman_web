import 'package:artman_web/config/conststants/icon_urls.dart';
import 'package:artman_web/config/conststants/text_consts.dart';
import 'package:artman_web/config/theme/color_pallet.dart';
import 'package:artman_web/features/auth_feature/presentation/screens/signup_screen.dart';
import 'package:artman_web/features/person_info_feature/repository/blocs/customer_cubit/customer_cubit.dart';
import 'package:artman_web/features/person_info_feature/presentation/screens/my_orders_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class PersonScreen extends StatelessWidget {
  const PersonScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    int allowToCallgetCustomer = 0 ;//! for memory managment we want to call cubit.getCustomer only once and if value of this variable is 1 that means getCustomer will called
    return BlocBuilder<CustomerCubit, CustomerState>(
      builder: (context, state) {

        var cubit = CustomerCubit.get(context);
        if(allowToCallgetCustomer==0){allowToCallgetCustomer=1;}
        if(allowToCallgetCustomer == 1){cubit.getCustomer();allowToCallgetCustomer=2;}

        return SafeArea(
            child: Scaffold(
                body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              //! infos
              cubit.customerBox!.isEmpty
                  ? SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 50),
                              width: MediaQuery.of(context).size.width,
                              height: 100,
                              child: Image.asset(
                                "assets/icons/signup_svg.png",
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                            const Text(TextConsts.enterTOyourAccount,
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "sens")),
                            const SizedBox(
                              height: 15,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context){return const SignUpScren();}));
                              },
                              child: Container(
                                width: 100,
                                height: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: ColorPallet.secondary),
                                child: const Center(
                                  child: Text(
                                    style: TextStyle(
                                        fontSize: 17,
                                        color: Color.fromARGB(255, 255, 255, 255),
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "sens"),
                                    TextConsts.signup,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            )
                          ]),
                    )
                  : SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(cubit.customerBox![0].firstName!,
                                style: const TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "sens")),
                            const SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 40),
                              child: Text(
                                style: TextStyle(
                                    fontSize: 17,
                                    color: ColorPallet.hintColor,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "sens"),
                                cubit.customerBox![0].email!,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ImageIcon(
                                  const AssetImage(IconsUrl.wallet),
                                  color: ColorPallet.secondary,
                                  size: 35,
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                const Text("590000",
                                    style: TextStyle(
                                        fontSize: 17,
                                        color:
                                            Color.fromARGB(255, 107, 107, 107),
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "sens")),
                                const SizedBox(
                                  width: 8,
                                ),
                                const Text("تومان",
                                    style: TextStyle(
                                        fontSize: 13,
                                        color:
                                            Color.fromARGB(255, 116, 116, 116),
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "sens")),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 30),
                              child: Text("مدیریت کیف پول ",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey[400],
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "sens")),
                            )
                          ]),
                    ),

              //! divider
              const Divider(),
              //! support
              const Padding(
                padding: EdgeInsets.only(right: 20),
                child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(TextConsts.supportshopper,
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: "sens"))),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    right: 20, left: 20, top: 10, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //! whatsapp
                    IconButton(
                        iconSize: 50,
                        onPressed: () async{
                        Uri phoneno = Uri.parse('tel:+989391556862');
                          if (await launchUrl(phoneno)) {
                            //dialer opened
                          } else {
                            //dailer is not opened
                          }
                        },

                        icon: Image.asset(IconsUrl.whatsappIcon)),
                    //! web
                    IconButton(
                        iconSize: 50,
                        onPressed: () async{
                            Uri url = Uri.parse('https://eddy.dastyar.site');
                          if (await launchUrl(url)) {
                            //dialer opened
                          } else {
                            //dailer is not opened
                          }

                        },
                        icon: Image.asset(IconsUrl.websiteIcon)),
                    //! call
                    IconButton(
                        iconSize: 50,
                        onPressed: () async {
                          Uri phoneno = Uri.parse('tel:+989391556862');
                          if (await launchUrl(phoneno)) {
                            //dialer opened
                          } else {
                            //dailer is not opened
                          }
                        },
                        icon: Image.asset(IconsUrl.callIcon)),
                  ],
                ),
              ),
              const Divider(),
              //! options
              InkWell(
                  onTap: () {
                    if (cubit.customerBox!.isNotEmpty) {
                    Navigator.push(context, MaterialPageRoute(builder: (context){return const MyOrdersScreen() ; } ));
                  }
                  else{
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: const Text("اول باید ثبت نام کنی",
                            style: TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.bold,
                                fontFamily: "sens")),
                        backgroundColor: ColorPallet.secondary,
                      ));
                  }
                  },
                  child: userOptionContainer(context, ColorPallet.searchBox,
                      "سفارش های من", Icons.cloud)
              ),

              InkWell(
                onTap: () {
                  if (cubit.customerBox!.isNotEmpty) {
                    cubit.deleteCustomer(cubit.customerBox![0]);
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: const Text("اول باید ثبت نام کنی",
                            style: TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.bold,
                                fontFamily: "sens")),
                        backgroundColor: ColorPallet.secondary,
                      ));
                  }
                },
                child: userOptionContainer(context, ColorPallet.secondary,
                    "خروج از حساب کاربری", Icons.person),
              ),

              //! ads banner
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.all(5),
                width: 320,
                height: 130,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage(
                          "assets/icons/digi_banner.webp",
                        ),
                        fit: BoxFit.contain),
                    borderRadius: BorderRadius.circular(15)),
              ),
            ],
          ),
        )));
      },
    );
  }
}

Widget userOptionContainer(
    BuildContext context, Color color, String title, IconData icon) {
  return Container(
    margin: const EdgeInsets.all(7),
    decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(15), color: color),
    width: MediaQuery.of(context).size.width * 0.50,
    height: 50,
    child: Row(
      children: [
        const SizedBox(
          width: 10,
        ),
        Icon(icon),
        const SizedBox(
          width: 10,
        ),
        Text(title,
            style: const TextStyle(
                fontSize: 17,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: "sens")),
      ],
    ),
  );
}
