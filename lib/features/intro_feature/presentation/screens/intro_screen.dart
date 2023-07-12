import 'package:artman_web/config/theme/color_pallet.dart';
import 'package:artman_web/core/utiles/prefs_operator.dart';
import 'package:artman_web/features/main_wrapper.dart';
import 'package:artman_web/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';

class IntroMainWrapper extends StatelessWidget {
  static const routeName = "/intro_main_wrapper";
  IntroMainWrapper({Key? key}) : super(key: key);

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    // final args = ModalRoute.of(context)!.settings.arguments as String;
    /// get device size

    return 

    //! register button 
    OnBoardingSlider(
      finishButtonText: 'ثبت نام',
      onFinish: () {
        //! update shared prefs --> user wouldn't see onboarding pages 
        PrefsOperator prefsOperator = locator<PrefsOperator>();
        prefsOperator.changeIntroState();

        //! navigate to home page
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> MainWrapper()
        ), (route) => false);
      },
      finishButtonStyle:  FinishButtonStyle(
        backgroundColor: ColorPallet.secondary,
      ),
      //! skip button 
      skipTextButton:  Text(
        'بعدی',
        style: TextStyle(
          fontSize: 16,
          color:ColorPallet.secondary,
          fontWeight: FontWeight.w600,
        ),
      ),
      //! trailing
      trailing:  Text(
        'ورود',
        style: TextStyle(
          fontSize: 16,
          color: ColorPallet.secondary,
          fontWeight: FontWeight.w600,
        ),
      ),
      trailingFunction: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>  MainWrapper(),
          ),
        );
      },
      
      controllerColor: ColorPallet.secondary,
      totalPage: 3,
      headerBackgroundColor: Colors.white,
      pageBackgroundColor: Colors.white,
      //! back grounds 
      background: [
        Image.asset(
          'assets/icons/signup_svg.png',
          height: 400,
        ),
        Image.asset(
        'assets/icons/login.png',
          height: 400,
        ),
        Image.asset(
          'assets/icons/6538623_prev_ui.png',
          height: 400,
        ),
      ],
      speed: 1.8,
      
      pageBodies: [
        //! page 1 
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 480,
              ),
              Text(
                'همه چی هست',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "sens",
                  color: ColorPallet.mainTextColor,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'اینجا همه چیز برای شما فراهم است از جون مرغ تا شیر آدمیزاد',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "sens",
                  color:ColorPallet.mainTextColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        //! page 2 
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 480,
              ),
              Text(
                'خدمات بینظیر',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "sens",
                  color: ColorPallet.mainTextColor,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'در کمترین زمان ممکن سفارشتو تحویل میگیری . پشتیبانی تا ابد در خدمت توعه ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "sens",
                  color:ColorPallet.mainTextColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        //! page 3 
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 480,
              ),
              Text(
                'همیشه سود میکنی',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "sens",
                  color: ColorPallet.mainTextColor,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'بهترین پیشنهاد ها و جشنواره های تخفیف رو اینجا میتونی تجزبه کنی',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "sens",
                  color:ColorPallet.mainTextColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}