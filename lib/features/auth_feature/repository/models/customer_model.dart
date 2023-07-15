import 'package:hive/hive.dart';
part 'customer_model.g.dart';

@HiveType(typeId: 6)
class CustomerModel {
  @HiveField(0)
  String?  firstName ; 
    @HiveField(1)
  String?  lastName ; 
    @HiveField(2)
  String?  email ;
    @HiveField(3)
  String?  password ;
    @HiveField(4)
  String?  username ;
  CustomerModel({this.firstName ,this.lastName ,this.password ,this.email }); 
  //! to jason 
  Map<String  , dynamic> toJson(){
    Map<String , dynamic>map  = {};
    map.addAll(
      {
        "first_name": firstName , 
        "last_name": lastName , 
        "email": email ,
        "password": password , 
        "username": email , 
      }
    );
    return map ; 
  }

  //! from Json 
  CustomerModel.fromJason(Map<String , dynamic > json){
    firstName = json["first_name"];
    lastName = json["last_name"];
    email = json["email"];
    username = json["username"]?? 0 ;
  }

}