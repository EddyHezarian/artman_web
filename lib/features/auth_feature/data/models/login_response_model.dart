// ignore_for_file: public_member_api_docs, sort_constructors_first
class LoginResponseModel {
  bool? success ;
  int? statusCode;
  String? message;
  String? code;
  Data? data;
  LoginResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.code,
    this.data,
  });

LoginResponseModel.fromJason(Map <String , dynamic>json){
  success = json["success"];
  statusCode = json["statusCode"];
  message = json["message"];
  code = json["code"];
  data = json["data"]  != null ? Data.fromJson(json["data"]) : null ;
}

Map<String , dynamic> toJason(){
  final Map<String,dynamic> data = <String,dynamic>{};
  data["success"]=success;
  data["statusCode"]=statusCode;
  data["message"]=message;
  data["code"]=code;
  data["data"] != null ?  data["data"]= this.data!.toJason() :null;

  return data ;

}

}

class Data{
  String? token ; 
  int? id ; 
  String? nicename ;
  String? email ;
  String? firstname ; 
  String? lastname ; 
  String? displayname ; 
  Data({this.token ,this.id ,this.nicename ,this.firstname ,this.lastname ,this.displayname ,this.email });

Data.fromJson(Map<String ,dynamic> json){
  token = json["token"];
  email = json["email"];
  id = json["id"];
  nicename = json["nicename"];
  firstname = json["firstName"];
  lastname = json["lastName"];
  displayname = json["displayName"];
}

Map<String , dynamic> toJason(){
  final Map<String , dynamic> data = <String , dynamic>{};
  data["token"]=token;
  data["email"]=email;
  data["id"]=id;
  data["nicename"]=nicename;
  data["firstName"]=firstname;
  data["lastName"]=lastname;
  data["displayName"]=displayname;

  return data ;


}


}