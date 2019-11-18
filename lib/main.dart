import 'package:flutter/material.dart';
import 'package:safe_alarm/screens/signupScreen.dart';
import 'package:safe_alarm/screens/contactScreen.dart';
import 'package:safe_alarm/screens/welcomeScreen.dart';
import 'package:safe_alarm/screens/sleepScreen.dart';

void main() => runApp(MyApp());

const MaterialColor primaryColor = const MaterialColor(
  0xFFB89CE4,
  const <int,Color> {
50:Color.fromRGBO(136,14,79, .1),
100:Color.fromRGBO(136,14,79, .2),
200:Color.fromRGBO(136,14,79, .3),
300:Color.fromRGBO(136,14,79, .4),
400:Color.fromRGBO(136,14,79, .5),
500:Color.fromRGBO(136,14,79, .6),
600:Color.fromRGBO(136,14,79, .7),
700:Color.fromRGBO(136,14,79, .8),
800:Color.fromRGBO(136,14,79, .9),
900:Color.fromRGBO(136,14,79, 1),
}
);


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SafeAlarm',
      theme: ThemeData(
        primarySwatch: primaryColor,
        accentColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: Color.fromRGBO(66, 69, 148, 0.96)
        )
      ),
      initialRoute: "/",
      routes: <String,WidgetBuilder> {
        "/": (BuildContext context) => SignupScreen(),
        "/contact": (BuildContext context) => ContactScreen(),
        "/welcome": (BuildContext context) => WelcomeScreen(),
        "/sleep": (BuildContext context) => SleepScreen()
      }
    );
  }
}