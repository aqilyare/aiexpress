import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignupPage extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> signup(BuildContext context) async {
    final res = await http.post(
      Uri.parse("https://your-render-backend-url.onrender.com/signup"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "email": emailController.text,
        "password": passwordController.text,
      }),
    );

    final data = jsonDecode(res.body);
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(data['message'] ?? "Signup failed")));

    if (res.statusCode == 200) {
      Navigator.pushNamed(context, '/');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Signup")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () => signup(context),
              child: Text("Signup"),
            ),
          ],
        ),
      ),
    );
  }
}