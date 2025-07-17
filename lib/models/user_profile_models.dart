import 'dart:io';
import 'package:flutter/material.dart';

class UserProfile {
  String name;
  int age;
  File? profileImage;
  String? fontFamily;
  Color backgroundColor;

  UserProfile({
    required this.name,
    required this.age,
    this.profileImage,
    this.fontFamily,
    this.backgroundColor = Colors.white,
  });
}

