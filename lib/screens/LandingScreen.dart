import 'package:flutter/material.dart';
import 'package:phoenix/providers/OktaProvider.dart';
import 'package:phoenix/screens/MainScreen.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:rive/rive.dart';
import 'package:phoenix/main.dart';

import 'SplashScreen.dart';

class LandingScreen extends StatelessWidget {
  static const routeName = '/landing';

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("You made it!"),
        centerTitle: true,
        backgroundColor: MyApp.appBarColor,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  height: 300,
                  child: RiveAnimation.asset('assets/dolphin.riv'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.teal,
                    onPrimary: Colors.white,
                    onSurface: Colors.grey,
                  ),
                  onPressed: () async {
                    var isAuthenticated = await AuthProvider.of(context)
                        .authService
                        .isAuthenticated();
                    Alert(
                    context: context,
                    //type: AlertType.info,
                    title: "Authenticated: ${isAuthenticated.toString()}",
                    desc: "You are logged in",
                    buttons: [
                      DialogButton(
                        child: Text(
                        "OK",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () => Navigator.pop(context),
                          width: 120,
                      )
                      ],
                      ).show();
                      },
                  child: Text('Check Auth Status'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.teal,
                    onPrimary: Colors.white,
                    onSurface: Colors.grey,
                  ),
                  onPressed: () async {
                    Navigator.of(context).pushNamed(MainScreen.routeName);
                  },
                  child: Text('Use API methods'),
                ),
                Container(
                  child: SplashScreen(),
                  height: 200,
                ),
            ],
          ),
        ),
      )
    );
  }
}