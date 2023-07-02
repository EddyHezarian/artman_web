import 'dart:io';

class SplashRepository{
  //! check if user is connect to internet and also can call API or not 
  //* use for splash cubit and splash screen --> if user offline dont navigate to home page  
  Future<bool> checkConnectivity()async{
    try {
      final result = await InternetAddress.lookup("example.com");
      return  result.isNotEmpty && result[0].rawAddress.isNotEmpty ;
    } on SocketException catch (_) {
      return false ;
    }
  }
}