
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(66, 69, 148, 0.96),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0,0,0,8),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/heart_rate_graphic.png')
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0,8,0,8),
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/logo.png'),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                'Sleep Safe',
                style: TextStyle(
                  fontSize: 45, 
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              )
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: ButtonTheme(
                minWidth: 300,
                height: 50,
                
                buttonColor: Colors.white,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/contact');
                  },
                  child: Text(
                    'SIGN UP',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    )
                  ),
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}