import 'package:flutter/material.dart';
import 'package:phoenix/main.dart';
import 'package:phoenix/providers/OktaProvider.dart';
import 'package:phoenix/screens/LandingScreen.dart';
import 'package:phoenix/screens/SplashScreen.dart';
import 'package:rive/rive.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login';

  onBottom(Widget child) => Positioned.fill(
    child: Align(
      alignment: Alignment.bottomCenter,
      child: child,
    ),
  );

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
        centerTitle: true,
        backgroundColor: MyApp.appBarColor,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                height: 300,
                child: RiveAnimation.asset('assets/dory.riv'),
              ),
              ElevatedButton(
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
              Container(
                child: SplashScreen(),
                height: 400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}