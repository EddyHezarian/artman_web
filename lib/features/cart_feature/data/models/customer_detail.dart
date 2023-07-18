class CustomerDetailModel {
  int? id;
  String? firstname;
  String? lastname;
  Billing? billing;
  Shipping? shipping;

  CustomerDetailModel({
    this.id,
    this.firstname,
    this.billing,
    this.shipping,
  });

  CustomerDetailModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    firstname = json["first_name"];
    lastname = json["last_name"];
    billing =
        json["billing"] != null ? Billing.fromJson(json["billing"]) : null;
    shipping =
        json["shipping"] != null ? Shipping.fromJson(json["shipping"]) : null;
  }
}

class Billing {
  String? firstname;
  String? lastname;
  String? company;
  String? address1;
  String? address2;
  String? city;
  String? postCode;
  String? country;
  String? state;
  String? email;
  String? phone;
  Billing({
    this.address1,
    this.address2,
    this.lastname,
    this.firstname,
    this.company,
    this.city,
    this.postCode,
    this.country,
    this.state,
    this.email,
    this.phone,
  });
  Billing.fromJson(Map<String, dynamic> json) {
    firstname = json["first_name"];
    lastname = json["last_name"];
    company = json["company"];
    address1 = json["address_1"];
    address2 = json["address_2"];
    city = json["city"];
    postCode = json["postcode"];
    country = json["country"];
    state = json["state"];
    email = json["email"];
    phone = json["phone"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["last_name"] = firstname;
    data["company"] = lastname;
    data["first_name"] = company;
    data["address_1"] = address1;
    data["address_2"] = address2;
    data["city"] = city;
    data["postcode"] = postCode;
    data["country"] = country;
    data["state"] = state;
    data["email"] = email;
    data["phone"] = phone;
    return data;
  }

}



class Shipping{
  String? firstname;
  String? lastname;
  String? company;
  String? address1;
  String? address2;
  String? city;
  String? postCode;
  String? country;
  String? state;

  Shipping({
    this.address1,
    this.address2,
    this.lastname,
    this.firstname,
    this.company,
    this.city,
    this.postCode,
    this.country,
    this.state,
  });

  Shipping.fromJson(Map<String, dynamic> json) {
    firstname = json["first_name"];
    lastname = json["last_name"];
    company = json["company"];
    address1 = json["address_1"];
    address2 = json["address_2"];
    city = json["city"];
    postCode = json["postcode"];
    country = json["country"];
    state = json["state"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["last_name"] = firstname;
    data["company"] = lastname;
    data["first_name"] = company;
    data["address_1"] = address1;
    data["address_2"] = address2;
    data["city"] = city;
    data["postcode"] = postCode;
    data["country"] = country;
    data["state"] = state;
    return data ;
  }
}