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
   @HiveField(5)
  int?  id ;
  CustomerModel({this.firstName ,this.lastName ,this.password ,this.email  , this.id}); 
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
        "id":id 
      }
    );
    return map ; 
  }
  //! from Json 
  CustomerModel.fromJason(Map<String , dynamic > json){
    firstName = json["first_name"];
    lastName = json["last_name"];
    email = json["email"];
    id = json["id"];
    username = json["username"]?? 0 ;
  }
}