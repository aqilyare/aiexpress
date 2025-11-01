import 'package:flutter/material.dart';
import 'login_page.dart';
import 'signup_page.dart';
import 'profile_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => LoginPage(),
      '/signup': (context) => SignupPage(),
      '/profile': (context) => ProfilePage(),
    },
  ));
}
