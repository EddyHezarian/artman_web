

import 'package:artman_web/core/utiles/prefs_operator.dart';
import 'package:artman_web/features/intro_feature/presentation/screens/intro_screen.dart';
import 'package:artman_web/features/main_wrapper.dart';
import 'package:artman_web/locator.dart';

import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../repository/splash_cubit/cubit/splash_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SplashCubit>(context).checkConnectionEvent();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: 
          DelayedWidget(
            animationDuration: const Duration(seconds: 0),
            animation: DelayedAnimations.SLIDE_FROM_BOTTOM,
            delayDuration: const Duration(seconds: 1),
            child: Image.asset("assets/icons/logo.png"))),
          BlocConsumer<SplashCubit , SplashState>(
            builder: (context , state){
              //! if user is online -------------------------
              if(state.connectionStatus is InitialConnection || state.connectionStatus is SuccessConnection){
                    return Directionality(
                      textDirection: TextDirection.ltr,
                      child: LoadingAnimationWidget.prograssiveDots(
                        color: Colors.red,
                        size: 50,
                      ),
                    );
                  }
                  //! if user is offline-----------------------------
                  if(state.connectionStatus is FailedConnection){
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('به اینترنت متصل نیستید!', style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500, fontFamily: "vazir"),),
                        IconButton(
                            splashColor: Colors.red,
                            onPressed: (){
                              /// check that we are online or not
                              BlocProvider.of<SplashCubit>(context).checkConnectionEvent();
                            },
                            icon: const Icon(Icons.autorenew, color: Colors.red,))
                      ],
                    );
                  }
                  //! default value---------------
                  return Container();
            }, 
            listener: (context , state){
                  if(state.connectionStatus is SuccessConnection){
                    
                    goToHome(context);
                  }
            }),
          const SizedBox(height: 30,) 
        ],
      ),
    );
  }
}

//! navigate page depend on prefsOprator which decleared that user saw onboarding pages befor or not 

Future<void> goToHome(BuildContext context)async{
  
  PrefsOperator prefsOperator = locator<PrefsOperator>();
  bool  shouldShowOnboadings = await prefsOperator.getIntroState();

  if (shouldShowOnboadings){
  Future.delayed(const Duration(seconds: 2)).then((value) => Navigator.pushReplacement( context, MaterialPageRoute(builder: (context) => IntroMainWrapper(),)));
  }
  else 
  {
    Future.delayed(const Duration(seconds: 2)).then((value) =>  Navigator.pushReplacement(context , MaterialPageRoute(builder: (context)=> MainWrapper())) );
  }
  
}