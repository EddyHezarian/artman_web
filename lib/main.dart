import 'package:artman_web/config/bloc/bottomnav_cibit/bottomnav_cubit.dart';
import 'package:artman_web/core/models/attrebutes.dart';
import 'package:artman_web/core/models/image_model.dart';
import 'package:artman_web/features/cart_feature/data/models/cart_product.dart';
import 'package:artman_web/features/intro_feature/presentation/screens/splash_screen.dart';
import 'package:artman_web/features/product_list_feature/data/models/product_model.dart';
import 'package:artman_web/features/wish_list_feature/repository/blocs/cubit/wishlist_cubit.dart';
import 'package:artman_web/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'features/auth_feature/data/models/customer_model.dart';
import 'features/cart_feature/repository/blocs/cubit/cart_product_cubit.dart';
import 'features/category_feature/data/model/category_model.dart';
import 'features/category_feature/repository/blocs/cubit/category_cubit.dart';
import 'features/intro_feature/repository/splash_cubit/cubit/splash_cubit.dart';
import 'features/person_info_feature/repository/blocs/customer_cubit/customer_cubit.dart';
import 'features/person_info_feature/repository/blocs/my_orders_cubit/cubit/myorder_cubit.dart';
import 'features/product_list_feature/repository/blocs/cubit/product_cubit.dart';
const String productDBname = "cartProduct";
Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
  // hive data base initilizing for customer , add to cart product , wishlist products 
    Hive.registerAdapter(CartProductModelAdapter());
    Hive.registerAdapter(CustomerModelAdapter());
    Hive.registerAdapter(ProductModelAdapter());
    Hive.registerAdapter(ImageSrcAdapter());
    Hive.registerAdapter(CategoryModelAdapter());
    Hive.registerAdapter(AttributeAdapter());
    await Hive.initFlutter();
  // for always beeing portrait  
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // init locator --> singletone instances of every repositpry and apiproviders in app
  await initLocator(); 
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => SplashCubit(),
      ),BlocProvider(
        create: (context) => CustomerCubit(),
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
      BlocProvider(
        create: (context) => WishlistCubit(),
      ),
      BlocProvider(
        create: (context) => MyorderCubit(locator()),
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
