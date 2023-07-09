import 'package:artman_web/config/bloc/bottomnav_cibit/bottomnav_cubit.dart';
import 'package:artman_web/features/category_feature/presentation/blocs/cubit/category_cubit.dart';
import 'package:artman_web/features/intro_feature/screens/splash_screen.dart';
import 'package:artman_web/features/intro_feature/splash_cubit/cubit/splash_cubit.dart';
import 'package:artman_web/features/product_list_feature/blocs/cubit/product_cubit.dart';
import 'package:artman_web/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await initLocator();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => SplashCubit(),
      ),
      BlocProvider(
        create: (context) => BottomNavCubit(),
      ),
      BlocProvider(
        create: (context) => ProductCubit(locator()),
      ),
      BlocProvider(
        create: (context) => CategoryCubit(locator()),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fa'), // English
      ],
      initialRoute: '/',
      routes: const {
        
      },
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: const SplashScreen(),
    );
  }
}
