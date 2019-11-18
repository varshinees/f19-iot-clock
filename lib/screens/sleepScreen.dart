
import 'package:flutter/material.dart';

class SleepScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sleep Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image(image: AssetImage('assets/logo.png')),
            Text('Ready to Sleep?'),
            RaisedButton(
              onPressed: () {
                Scaffold.of(context).showSnackBar(SnackBar(content: Text('TODO: Connect to server')));
              },
              child: Text(
                'Connect to Server',
              style: TextStyle(fontSize: 24)
              ),
            ),

          ],
        )
      ),
    );
  }
}