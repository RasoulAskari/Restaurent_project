import 'package:flutter/material.dart';
import './admin_login_screen.dart';
import './user_login_screen.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome to Quick Food"),
      ),
      body: Container(
        color: Colors.blue,
        padding: EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(5)),
              child: RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(AdminLoginScreen.routeName);
                },
                child: Text("Start as Admin"),
              ),
            ),
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(5)),
              child: RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(UserLoginScreen.routeName);
                },
                child: Text("Start as User"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
