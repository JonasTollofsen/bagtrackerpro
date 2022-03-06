import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, '/start');
            },
            child: Text("Login"),
          ),
        ],
      ),
    );
  }
}
