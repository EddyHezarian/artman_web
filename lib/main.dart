import 'package:artman_web/config/bloc/bottomnav_cibit/bottomnav_cubit.dart';
import 'package:artman_web/features/cart_feature/data/models/cart_product.dart';

import 'package:artman_web/features/category_feature/presentation/blocs/cubit/category_cubit.dart';
import 'package:artman_web/features/intro_feature/presentation/screens/splash_screen.dart';

import 'package:artman_web/features/product_list_feature/blocs/cubit/product_cubit.dart';
import 'package:artman_web/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'features/cart_feature/repository/blocs/cubit/cart_product_cubit.dart';
import 'features/intro_feature/repository/splash_cubit/cubit/splash_cubit.dart';
const String productDBname = "cartProduct";
const String wishlistbox = "wishlist";
Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
  // hive data base initilizing for add a product to cart 
    Hive.registerAdapter(CartProductModelAdapter());
    await Hive.initFlutter();
    await Hive.openBox<CartProductModel>(productDBname);
    await Hive.openBox<CartProductModel>(wishlistbox);
  // for always beeing portrait  
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]); 
  // init locator --> singletone instances of every repositpry and apiproviders in app
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
      BlocProvider(
        create: (context) => CartProductCubit(),
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
        Locale('fa'), // farsi
      ],
      initialRoute: '/',
      routes: const {
        //Todo compelet routes
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
