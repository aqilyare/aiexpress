import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Map<String, dynamic>? profile;

  Future<void> getProfile(String token) async {
    final res = await http.get(
      Uri.parse("https://your-render-backend-url.onrender.com/profile"),
      headers: {"Authorization": "Bearer $token"},
    );

    if (res.statusCode == 200) {
      setState(() {
        profile = jsonDecode(res.body);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final token = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Center(
        child: profile == null
            ? ElevatedButton(
                onPressed: () => getProfile(token),
                child: Text("Load Profile"),
              )
            : Text("Email: ${profile!['email']}"),
      ),
    );
  }
}
