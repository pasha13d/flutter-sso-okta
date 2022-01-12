import 'package:flutter/material.dart';
import 'package:phoenix/providers/OktaProvider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:phoenix/main.dart';

import 'dart:convert';

import 'package:rflutter_alert/rflutter_alert.dart';

class MainScreen extends StatelessWidget {
  static const routeName = '/main';


  parseUser(Map<String, dynamic> json) {
    return json['name'] as String;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Methods"),
        centerTitle: true,
        backgroundColor: MyApp.appBarColor,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ElevatedButton(
                onPressed: () async {
                  var userJson =
                      await AuthProvider.of(context).authService.getUser();
                  print(userJson);
                  Map<String, dynamic> user = jsonDecode(userJson);
                  print(user);
                  Alert(
                    context: context,
                    //type: AlertType.info,
                    title: "Welcome, ${user['firstName']}",
                    desc: "Great to have you here",
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
                  //Fluttertoast.showToast(msg: "user: ${user['name']}");
                },
                child: const Text('getUser', style: TextStyle(fontSize: 20)),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () async {
                  await AuthProvider.of(context).authService.logout();
                  Navigator.of(context).pushReplacementNamed('/login');
                },
                child: const Text('Logout', style: TextStyle(fontSize: 20)),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () async {
                  var isAuthenticated = await AuthProvider.of(context)
                      .authService
                      .isAuthenticated();
                  // Fluttertoast.showToast(
                  //     msg: "isAuthenticated: ${isAuthenticated.toString()}");
                  Alert(
                    context: context,
                    //type: AlertType.info,
                    title: "Authenticated: ${isAuthenticated.toString()}",
                    desc: "Welcome back",
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
                child: const Text('isAuthenticated',
                    style: TextStyle(fontSize: 20)),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () async {
                  var accessToken = await AuthProvider.of(context)
                      .authService
                      .getAccessToken();
                  Alert(
                    context: context,
                    //type: AlertType.info,
                    title: "Access Token",
                    desc: "${accessToken.toString()}",
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
                child: const Text('getAccessToken',
                    style: TextStyle(fontSize: 20)),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () async {
                  var idToken =
                      await AuthProvider.of(context).authService.getIdToken();
                  Alert(
                    context: context,
                    //type: AlertType.info,
                    title: "ID Token",
                    desc: "${idToken.toString()}",
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
                child: const Text('getIdToken', style: TextStyle(fontSize: 20)),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () async {
                  var result = await AuthProvider.of(context)
                      .authService
                      .revokeAccessToken();
                  Alert(
                    context: context,
                    //type: AlertType.info,
                    title: "Revoke Token",
                    desc: "${result.toString()}"
                  ).show();
                  // Fluttertoast.showToast(msg: "result: $result");
                  Navigator.of(context).pushReplacementNamed('/main');
                },
                child: const Text('revokeAccessToken',
                    style: TextStyle(fontSize: 20)),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () async {
                  var result = await AuthProvider.of(context)
                      .authService
                      .revokeIdToken();
                  Fluttertoast.showToast(msg: "result: $result");
                  Navigator.of(context).pushReplacementNamed('/splash');
                },
                child:
                    const Text('revokeIdToken', style: TextStyle(fontSize: 20)),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () async {
                  var result = await AuthProvider.of(context)
                      .authService
                      .revokeRefreshToken();
                  Fluttertoast.showToast(msg: "result: $result");
                  Navigator.of(context).pushReplacementNamed('/splash');
                },
                child: const Text('revokeRefreshToken',
                    style: TextStyle(fontSize: 20)),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () async {
                  var result =
                      await AuthProvider.of(context).authService.clearTokens();
                  Fluttertoast.showToast(msg: "result: $result");
                  Navigator.of(context).pushReplacementNamed('/splash');
                },
                child:
                    const Text('clearTokens', style: TextStyle(fontSize: 20)),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () async {
                  var result = await AuthProvider.of(context)
                      .authService
                      .introspectAccessToken();
                  Fluttertoast.showToast(msg: "introspectAccessToken: $result");
                },
                child: const Text('introspectAccessToken',
                    style: TextStyle(fontSize: 20)),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () async {
                  var result = await AuthProvider.of(context)
                      .authService
                      .introspectIdToken();
                  Fluttertoast.showToast(msg: "introspectIdToken: $result");
                },
                child: const Text('introspectIdToken',
                    style: TextStyle(fontSize: 20)),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () async {
                  var result = await AuthProvider.of(context)
                      .authService
                      .introspectRefreshToken();
                  Fluttertoast.showToast(
                      msg: "introspectRefreshToken: $result");
                },
                child: const Text('introspectRefreshToken',
                    style: TextStyle(fontSize: 20)),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () async {
                  var result = await AuthProvider.of(context)
                      .authService
                      .refreshTokens();
                  Fluttertoast.showToast(msg: "refreshTokens: $result");
                },
                child:
                    const Text('refreshTokens', style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}