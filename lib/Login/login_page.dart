import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:woofle/Login/sign_up.dart';
import 'package:woofle/constants.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';

import 'package:woofle/root/root_app.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future login(BuildContext context) async {
    var url = Uri.parse("http://10.0.2.2/woofle/login.php");
    var response = await http.post(url, body: {
      "username": username.text,
      "password": password.text,
    });

    var data = jsonDecode(response.body);
    if (data == "success") {
      Fluttertoast.showToast(
        msg: "Logged In",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        fontSize: 16,
      );

      Navigator.push(context, MaterialPageRoute(builder: (context) => const RootPage()));
    } else {
      Fluttertoast.showToast(
        msg: data,
        //msg: "Incorrect Username/Password",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        fontSize: 16,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text("Woofle",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                        fontSize: 50,
                      ))),
              //Sign In Container
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Sign In',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Center(
                child: Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: formKey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextFormField(
                            controller: username,
                            validator: MultiValidator([
                              RequiredValidator(errorText: "Required"),
                              MinLengthValidator(6,
                                  errorText: "Username must be 6 characters")
                            ]),
                            cursorColor: primaryColor,
                            decoration: InputDecoration(
                              icon: const Icon(
                                Icons.person,
                                color: primaryColor,
                              ),
                              filled: true,
                              fillColor: primaryPastelColor,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(29)),
                              hintText: "Username",
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 20,
                            ),
                            child: TextFormField(
                              controller: password,
                              obscureText: true,
                              validator: MultiValidator([
                                RequiredValidator(errorText: "Required"),
                                MinLengthValidator(10,
                                    errorText: "Password must be 10 characters")
                              ]),
                              cursorColor: primaryColor,
                              decoration: InputDecoration(
                                icon: const Icon(
                                  Icons.lock,
                                  color: primaryColor,
                                ),
                                filled: true,
                                fillColor: primaryPastelColor,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(29)),
                                hintText: "Password",
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 20,
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                login(context);
                              },
                              child: const Text("Login"),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 20,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Don't have an account?",
                                  style: TextStyle(color: primaryColor),
                                ),
                                GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                                    return SignUpScreen();
                                  }));
                                },
                                child: const Text(
                                  " Sign Up",
                                  style: TextStyle(
                                    color: primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                ),

                              ],
                            ),
                          )
                        ])),
              )
            ])));
  }
}
