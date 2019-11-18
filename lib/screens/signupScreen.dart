
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image(image: AssetImage('assets/heart_rate_graphic.png')),
            Image(image: AssetImage('assets/logo.png')),
            Text(
                'Seizure Detection',
                style: TextStyle(
                  fontSize: 45, 
                  fontWeight: FontWeight.w600
                ),
            ),
            
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/contact');
              },
              child: Text(
                'Sign Up',
              style: TextStyle(fontSize: 24)
              ),
            ),
          ],
        ),
      ),
    );
  }
}