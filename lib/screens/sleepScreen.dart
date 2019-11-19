
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class SleepScreen extends StatefulWidget {
  @override
  _SleepState createState() => _SleepState();
}

class _SleepState extends State<SleepScreen> {

  bool isPolling = false;
  bool isAlert = false;

  Timer _timer;

  @override
  dispose() {
    _timer?.cancel();
    super.dispose();
  }

  beginPolling() {
    _timer = Timer.periodic(Duration(seconds: 10), (timer) => makeRequest(timer));
  }
  
  makeRequest(timer) async {
    http.Response response = await http.get("http://ancient-bastion-28512.herokuapp.com/");
    print(response.body);
    if (response.body.toString() == 'ALERT!!!!') {
      timer.cancel();
      setState(() {
        isAlert = true;
        isPolling = false;
      });
      Navigator.pushNamed(context, '/alarm');
    }
  } 

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
                onPressed: this.isPolling ? null : 
                () {
                    beginPolling();
                    setState(() {
                      isPolling=true;
                    });
                },
                child: Text(
                  this.isPolling?  'Listening for alert...': 'Connect to Server',
                style: TextStyle(fontSize: 24)
                ),
              ),

            ],
          )
        ),
      );
    }
}