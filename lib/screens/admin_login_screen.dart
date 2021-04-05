import 'package:doctor_yab/screens/ordersScreen.dart';
import 'package:flutter/material.dart';

class AdminLoginScreen extends StatelessWidget {
  var _usernameController = new TextEditingController();
  var _passwordController = new TextEditingController();

  static const routeName = '/AdminLogin';
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
                      decoration:
                          InputDecoration(labelText: "Enter your Password"),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    RaisedButton(
                      onPressed: () {
                        if (_usernameController.text == 'rasoul' &&
                            _passwordController.text == "123") {
                          print(_usernameController.text + "doododod");
                          Navigator.of(context)
                              .pushNamed(OrdersScreen.routeName);
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
