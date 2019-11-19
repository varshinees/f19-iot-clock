
import 'package:flutter/material.dart';
import 'package:safe_alarm/screens/contactScreen.dart';

class AlarmScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final ContactInfo args = ModalRoute.of(context).settings.arguments;


    return Scaffold(
      appBar: AppBar(
        title: Text("Alarm Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image(image: AssetImage('assets/logo.png')),
            Text('Welcome'),
            Text('This is the alarm screen.'),
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