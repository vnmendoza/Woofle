import 'package:flutter/material.dart';
import 'package:woofle/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginState createState() => LoginState();
}
class LoginState extends State<LoginScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
                children: <Widget>[
                  Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                          "Woofle",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                            fontSize: 50,
                          )
                      )
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'Sign In',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  const TextFieldContainer(
                    child: TextField(decoration: InputDecoration(
                        icon: Icon(Icons.person),

                        hintText: "Username"
                    ),
                      ),
                    ),
                ]
            )
        )
    );
  }
}

class TextFieldContainer extends StatelessWidget{
  final Widget child;
  const TextFieldContainer({
    Key? key,
    required this.child
}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: primaryPastelColor,
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }}
