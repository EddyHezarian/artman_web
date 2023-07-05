class CustomerModel {
  String?  firstName ; 
  String?  lastName ; 
  String?  email ; 
  String?  password ;
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
}