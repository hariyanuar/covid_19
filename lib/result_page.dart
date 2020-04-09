import 'package:covid_19/biodata.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  Map<int, bool> answers;

  @override
  Widget build(BuildContext context) {
    answers = ModalRoute.of(context).settings.arguments as Map<int, bool>;
    int yesAnswer = answers.values.where((bool answer) => answer).length;
    String result;
    String classificationIcon;

    if (yesAnswer <= 7) {
      result = "Rendah";
      classificationIcon = "healthy.png";
    } else if (yesAnswer <= 14) {
      result = "Sedang";
      classificationIcon = "cautious.png";
    } else if (yesAnswer > 14) {
      result = "Tinggi";
      classificationIcon = "risky.png";
    }
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(50.0),
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset("assets/icons/$classificationIcon"),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  Biodata.nama + ',',
                  style: Theme.of(context).textTheme.title.copyWith(fontSize: 48),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 15.0,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "Resiko anda untuk tertular penyakit COVID-19 adalah ",
                    style: Theme.of(context)
                        .textTheme
                        .title
                        .copyWith(fontWeight: FontWeight.normal),
                    children: <TextSpan>[
                      TextSpan(
                          text: result, style: Theme.of(context).textTheme.title),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              child: Text("#DiRumahAja", style: Theme.of(context).textTheme.subhead.copyWith(color: Colors.grey),),
              bottom: 0,
            ),
          ],
        ),
        //child: Text("Resiko anda untuk tertular penyakit COVID-19 adalah ${result}", style: Theme.of(context).textTheme.title, textAlign: TextAlign.center,),
      ),
    );
  }
}
