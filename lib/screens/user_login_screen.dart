import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../main.dart';
import './tab_screen.dart';

class UserLoginScreen extends StatelessWidget {
  var _usernameController = new TextEditingController();
  var _passwordController = new TextEditingController();

  static const routeName = '/userLogin';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Login"),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.blue,
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextField(
                      controller: _usernameController,
                      decoration:
                          InputDecoration(labelText: "Enter your Username"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Enter your Password",
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    RaisedButton(
                      onPressed: () {
                        if (_usernameController.text == 'rasoul' &&
                            _passwordController.text == "123") {
                          print(_usernameController.toString() + "doododod");
                          Navigator.of(context).pushNamed(TabScreen.routeName);
                        }
                      },
                      child: Text(
                        "Login",
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
