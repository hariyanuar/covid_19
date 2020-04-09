import 'package:flutter/material.dart';

class QuestionsPage extends StatefulWidget {
  @override
  _QuestionsPageState createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  Map<int, String> questions = {
    1: "Saya pergi keluar rumah.",
    2: "Saya menggunakan transportasi umum: online, angkot, bus, taksi, kereta api.",
    3: "Saya tidak memakai masker pada saat berkumpul dengan orang lain.",
    4: "Saya berjabat tangan dengan orang lain",
    5: "Saya tidak membersihkan tangan dengan hand sanitizer",
    6: "Saya menyentuh benda/uang juga yang disentuh oleh orang lain",
    7: "Saya tidak menjaga jarak 1,5 meter dengan orang lain ketika: belanja, bekerja, belajar, ibadah",
    8: "Saya makan diluar rumah (warung/restaurant)",
    9: "Saya tidak minum & cuci tangan dengan sabun setelah tiba di tujuan",
    10: "Saya berada di wilayah keluharan tempat pasien tertular",
    11: "Saya tidak pasang hand sanitizer di depan pintuk masuk, untuk bersihkan tangan sebelum pegang gagang pintu",
    12: "Saya tidak mencuci tangan dengan sabun setelah tiba di rumah",
    13: "Saya tidak menyediakan tissue basah/antiseptic bagi keluarga di rumah",
    14: "Saya tidak segera merendam baju & celana bekas pakai di luar rumah kedalam air panas /sabun",
    15: "Saya tidak segera mandi keramas setelah saya tiba di rumah",
    16: "Saya tidak mensosialisasikan check list penilaian resiko pribadi ini kepada keluarga di rumah",
    17: "Saya dalam sehari tidak kena cahaya matahari minimal 15 menit",
    18: "Saya tidak jalan kaki / berolahraga minimal 30 menit setiap hari",
    19: "Saya jarang minum Vitamin C & E dan kurang tidur",
    20: "Usia saya diatas 60 Tahun",
    21: "Saya mempunyai penyakit: Jantung/diabetes/gangguan pernafasan kronik",
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
