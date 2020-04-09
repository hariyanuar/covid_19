import 'package:covid_19/biodata.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  Map<int, bool> answers;

  @override
  Widget build(BuildContext context) {
    answers = ModalRoute.of(context).settings.arguments as Map<int, bool>;
    int yesAnswer = answers.values.where((bool answer) => answer).length;
    String result;

    if (yesAnswer <= 7)
      result = "Rendah";
    else if (yesAnswer <= 14)
      result = "Sedang";
    else if (yesAnswer > 14) result = "Tinggi";

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(50.0),
        alignment: Alignment.center,
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: Biodata.nama + ',\n\n',
            style: Theme.of(context).textTheme.title.copyWith(fontSize: 48),
            children: [
              TextSpan(
                  text: "Resiko anda untuk tertular penyakit COVID-19 adalah ",
                  style: Theme.of(context)
                      .textTheme
                      .title
                      .copyWith(fontWeight: FontWeight.normal),
                  children: <TextSpan>[
                    TextSpan(
                        text: result, style: Theme.of(context).textTheme.title),
                  ])
            ]
          ),
        ),
        //child: Text("Resiko anda untuk tertular penyakit COVID-19 adalah ${result}", style: Theme.of(context).textTheme.title, textAlign: TextAlign.center,),
      ),
    );
  }
}
