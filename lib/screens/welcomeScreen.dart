
import 'package:flutter/material.dart';
import 'package:safe_alarm/screens/contactScreen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final ContactInfo args = ModalRoute.of(context).settings.arguments;


    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image(image: AssetImage('assets/logo.png')),
            Text('Welcome'),
            Text('You are now ready to utilize our ALERTS service which allows an emergency contact/emergency services to be notified in the event that you suffer a seizure in your sleep.'),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/sleep', arguments: args);
              },
              child: Text(
                'Continue >',
              style: TextStyle(fontSize: 24)
              ),
            ),
          ],
        )
      ),
    );
  }
}