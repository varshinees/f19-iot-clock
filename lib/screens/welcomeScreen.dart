
import 'package:flutter/material.dart';
import 'package:safe_alarm/screens/contactScreen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final ContactInfo args = ModalRoute.of(context).settings.arguments;


    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          // mainAxisAlignment: MainAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0,60,0,8),
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 8.0,
                        ),
                      ),
                      child: SizedBox(height: 1,width: MediaQuery.of(context).size.width,),
                    )
                  ),
                  Container(
                    width: 200,
                    height: 200,
                    margin: EdgeInsets.only(left: MediaQuery.of(context).size.width/4.0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/logo.png'),
                      ),
                    ),
                  )
                ]
              ),
            ),
            Container(
              margin: EdgeInsets.only(top:10,bottom: 10),
              child: Text(
                'WELCOME',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                )
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(40, 20, 40, 20),
              child: Text(
                'You are now ready to utilize our ALERTS service which allows an emergency contact/emergency services to be notified in the event that you suffer a seizure in your sleep.',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                  color: Color.fromRGBO(66, 69, 148, 0.96)
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.only(top:200),
              child: ButtonTheme(
                minWidth: 300,
                height: 50,
                
                buttonColor: Colors.white,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/sleep',arguments: args);
                  },
                  child: Text(
                    'CONTINUE >',
                    style: TextStyle(
                      color: Color.fromRGBO(66, 69, 148, 0.96),
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    )
                  ),
                )
              ),
            )
          ],
        )
      ),
    );
  }
}