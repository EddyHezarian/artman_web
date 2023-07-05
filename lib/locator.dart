
import 'package:artman_web/core/utiles/prefs_operator.dart';
import 'package:artman_web/features/auth_feature/repository/customer_Api_provider.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt locator = GetIt.instance ;

Future<void> initLocator() async{

  //! instance of DIO 
  locator.registerSingleton<Dio>(Dio());
  //! instance of sharedPrefrences 
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  locator.registerSingleton<SharedPreferences>(sharedPreferences);
  locator.registerSingleton<PrefsOperator>(PrefsOperator());
  //! customer Api provider
//locator.registerSingleton<CustomerApiProvider>(CustomerApiProvider());

}