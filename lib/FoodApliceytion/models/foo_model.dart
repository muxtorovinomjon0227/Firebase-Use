class FoodModel {
  int? id;
  String? name;
  String? restaurant;
  String? web;
  String? description;
  List<String>? ingredients;
  List<Addresses>? addresses;

  FoodModel(
      {this.id,
        this.name,
        this.restaurant,
        this.web,
        this.description,
        this.ingredients,
        this.addresses});

  FoodModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    restaurant = json['restaurant'];
    web = json['web'];
    description = json['description'];
    ingredients = json['ingredients'].cast<String>();
    if (json['addresses'] != null) {
      addresses = <Addresses>[];
      json['addresses'].forEach((v) {
        addresses!.add(new Addresses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['restaurant'] = this.restaurant;
    data['web'] = this.web;
    data['description'] = this.description;
    data['ingredients'] = this.ingredients;
    if (this.addresses != null) {
      data['addresses'] = this.addresses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Addresses {
  int? addressId;
  String? number;
  String? line1;
  String? line2;
  String? postcode;
  String? country;

  Addresses(
      {this.addressId,
        this.number,
        this.line1,
        this.line2,
        this.postcode,
        this.country});

  Addresses.fromJson(Map<String, dynamic> json) {
    addressId = json['addressId'];
    number = json['number'];
    line1 = json['line1'];
    line2 = json['line2'];
    postcode = json['postcode'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['addressId'] = this.addressId;
    data['number'] = this.number;
    data['line1'] = this.line1;
    data['line2'] = this.line2;
    data['postcode'] = this.postcode;
    data['country'] = this.country;
    return data;
  }
}
