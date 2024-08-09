import 'package:magfi_dev_task/feature/users/model/address.dart';
import 'package:magfi_dev_task/feature/users/model/company.dart';

class User {
  final int id;
  final String name;
  final String email;
  final Address address;
  final Company company;
  final String website;
  User(
      {required this.id,
      required this.name,
      required this.email,
      required this.address,
      required this.company,
      required this.website});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        address: Address.fromJson(json['address']),
        company: Company.fromJson(json['company']),
        website: json['website']);
  }
}
