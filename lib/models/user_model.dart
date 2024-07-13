import 'package:snap_buy/constants/strings.dart';

class UserModel {
  String email, name;
  List<String> cart, fav;

  UserModel(
    this.name, {
    required this.fav,
    required this.cart,
    required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      json[Strings.nameField],
      email: json[Strings.emailField],
      fav: List<String>.from(json[Strings.favField]),
      cart: List<String>.from(json[Strings.cartField]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      Strings.favField: fav,
      Strings.cartField: cart,
      Strings.nameField: name,
      Strings.emailField: email,
    };
  }
}
