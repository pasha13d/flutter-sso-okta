import 'package:flutter/material.dart';
import 'package:phoenix/providers/OktaProvider.dart';
import 'package:phoenix/screens/MainScreen.dart';
import 'package:phoenix/screens/LandingScreen.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login';
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Container(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.teal,
              onPrimary: Colors.white,
              onSurface: Colors.grey,
            ),
            onPressed: () async {
              await AuthProvider.of(context).authService.authorize();
              Navigator.of(context).pushNamed(LandingScreen.routeName);
            },
            child: Text('Log In'),
          ),
        ),
      ),
    );
  }
}