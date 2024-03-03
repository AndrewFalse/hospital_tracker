import 'package:flutter/material.dart';

class Patient {
  final String firstName;
  final String lastName;
  final int age;
  final String disease;
  final String admissionDate;
  final Image avatar;

  Patient({
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.disease,
    required this.admissionDate,
    required this.avatar,
  });
}