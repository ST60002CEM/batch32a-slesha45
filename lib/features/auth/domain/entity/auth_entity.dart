import 'package:equatable/equatable.dart';
import 'package:flutter/src/widgets/editable_text.dart';

class AuthEntity extends Equatable {
  final String? id;
  final String fname;
  final String lname;
  final String? image;
  final String phone;
  final String email;
  final String username;
  final String password;

  const AuthEntity({
    this.id,
    required this.fname,
    required this.lname,
    this.image,
    required this.phone,
    required this.email,
   
    required this.username,
    required this.password,
  });

  @override
  List<Object?> get props =>
      [id, fname, lname,phone, image,email, username, password];
}
