import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:phoenix/providers/OktaProvider.dart';
import 'package:phoenix/main.dart';
import 'package:http/http.dart' as http;

import 'SplashScreen.dart';

class ApiScreen extends StatelessWidget {
  static const routeName = '/api';


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
                style: ElevatedButton.styleFrom(
                  primary: Colors.teal,
                  onPrimary: Colors.white,
                  onSurface: Colors.grey,
                ),
                onPressed: () async {
                  var headers = {
                    'Accept': 'application/json',
                    'Content-Type': 'application/json',
                    //'Authorization': 'SSWS 0095Ms3q_rPNaY6I5lv4fA9JgT_XuQN_k7gEzxs89m'
                  };
                  var request = http.Request('GET', Uri.parse('https://coachella.okta.com/api/v1/users?limit=25'));

                  request.headers.addAll(headers);

                  http.StreamedResponse response = await request.send();

                  if (response.statusCode == 200) {
                    Fluttertoast.showToast(msg: "idToken:");
                    print(await response.stream.bytesToString());
                  }
                  else {
                    Fluttertoast.showToast(msg: response.statusCode.toString() + ": " + response.reasonPhrase);
                  }
                },
                child: Text('Hit API w/o token'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.teal,
                  onPrimary: Colors.white,
                  onSurface: Colors.grey,
                ),
                onPressed:
                    () async {
                      var accessToken = await AuthProvider.of(context)
                          .authService
                          .getAccessToken();
                      var headers = {
                        'Accept': 'application/json',
                        'Content-Type': 'application/json',
                        'Authorization': 'Bearer ' + accessToken
                      };
                      var request = http.Request('GET', Uri.parse('https://coachella.okta.com/api/v1/apps/0oawpt6r4I737eAOf5d6/users'));

                      request.headers.addAll(headers);

                      http.StreamedResponse response = await request.send();

                      if (response.statusCode == 200) {
                        Fluttertoast.showToast(msg: "idToken:");
                        print(await response.stream.bytesToString());
                      }
                      else {
                        Fluttertoast.showToast(msg: response.statusCode.toString() + ": " + response.reasonPhrase);
                      }
                },
                child: Text('Hit API w/ token'),
              ),
              Container(
                child: SplashScreen(),
                height: 525,
              ),
            ],
          ),
        ),
      ),
    );
  }
}