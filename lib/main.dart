import 'package:covid_19/registration_page.dart';
import 'package:flutter/material.dart';

import 'result_page.dart';
import 'questions_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "COVID",
      theme: ThemeData(
        primaryColor: Color(0xFFbe2edd),
        accentColor: Color(0xFFe056fd),
      ),
      initialRoute: "/",
      routes: {
        "/": (ctx) => Home(),
        "RegistrationPage": (ctx) => RegistrationPage(),
        "QuestionsPage": (ctx) => QuestionsPage(),
        "ResultPage": (ctx) => ResultPage(),
      },
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "assets/icons/coronavirus.png",
                  scale: 2,
                ),
                SizedBox(
                  height: 25.0,
                ),
                Text(
                  "Ayo cari tahu apakah kehidupanmu bisa membuat kamu tertular virus Corona!",
                  style: Theme.of(context).textTheme.title,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 25.0,
                ),
                RaisedButton(
                  child: Text(
                    "MULAI",
                    style: TextStyle(color: Colors.white, fontSize: 32),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 12.0),
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    Navigator.pushNamed(context, "RegistrationPage");
                  },
                ),
              ],
            ),
            Positioned(
              child: Text("Hari Yanuar\nGEN-16 RPL\nSMK Wikrama\n2020", style: Theme.of(context).textTheme.subhead.copyWith(color: Colors.grey), textAlign: TextAlign.center,),
              bottom: 0,
            )
          ],
        ),
      ),
    );
  }
}
