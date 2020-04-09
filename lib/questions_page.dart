import 'package:flutter/material.dart';

class QuestionsPage extends StatefulWidget {
  @override
  _QuestionsPageState createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  Map<int, String> questions = {
    1: "Apakah kamu sering keluar rumah?",
    2: "Apakah kamu sering menggunakan transportasi umum seperti angkot, bus, dll?",
    3: "Apakah kamu tidak memakai masker saat berkumpul dengan orang lain?",
    4: "Apakah kamu tidak mencuci tangan setelah berjabat tangan dengan orang lain?",
    5: "Apakah kamu tidak menggunakan hand sanitizer?",
    6: "Apakah kamu sering menyentuh benda yang disentuh orang lain?",
    7: "Apakah kamu tidak menjaga jarak, setidaknya 1,5 meter saat berkumpul dengan orang lain",
    8: "Apakah kamu sering makan di luar rumah? Seperti restoran, warteg, dll",
    9: "Apakah kamu tidak minum air hangat dan cuci tangan setelah melakukan perjalanan?",
    10: "Apakah ada orang yang tertular di kelurahan yang kamu tinggali?",
    11: "Apakah kamu tidak memasang hand sanitizer di depan pintu masuk, untuk membersihkan tangan sebelum memegang gagang pintu?",
    12: "Apakah kamu tidak mencuci tangan setelah sampai di rumah?",
    13: "Apakah kamu tidak menyediakan sabun cuci tangan/hand sanitizer untu kkeluarga di rumah?",
    14: "Apakah kamu tidak segera meredam baju/celana ke dalam air hangat/air sabun yang bekas dipakai keluar?",
    15: "Apakah kamu tidak segera mandi keramas sesaat tiba sampai di rumah?",
    16: "Apakah kamu tidak mensosialisasikan check list penilaian resiko pribadi ini kepada keluarga di rumah",
    17: "Apakah kamu tidak terkena cahaya matahari (setidaknya 15 menit) dalam sehari?",
    18: "Apakah kamu tidak olahraga minimal 30 menit setiap hari?",
    19: "Apakah kamu jarang mengkonsumsi vitamin C & E dan kekurangan tidur?",
    20: "apakah kamu berusia di atas 60 tahun?",
    21: "Apakah kamu mempunyai riwayat penyakit: Jantung/Diabetes/Gangguan Pernafasan Kronik?",
  };

  Map<int, bool> answers = new Map<int, bool>();

  int nomorSoal = 1;
  int jumlahSoal;

  @override
  Widget build(BuildContext context) {
    jumlahSoal = questions.length;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              nomorSoal.toString() + ". " + questions[nomorSoal],
              style: Theme.of(context).textTheme.title,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 40.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  child: Text(
                    "Ya",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    answers[nomorSoal] = true;
                    nextQuestion(context);
                  },
                ),
                RaisedButton(
                  child: Text(
                    "Tidak",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    answers[nomorSoal] = false;
                    nextQuestion(context);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void nextQuestion(BuildContext localContext) {
    if (nomorSoal < jumlahSoal) {
      setState(() {
        nomorSoal++;
      });
    }
    else {
      Navigator.pushReplacementNamed(localContext, "ResultPage", arguments: answers);
    }
  }
}
