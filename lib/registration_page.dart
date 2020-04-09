import 'package:covid_19/biodata.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final FocusNode umurFocusNode = FocusNode();

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          height: 690,
          alignment: Alignment.center,
          padding: EdgeInsets.all(50.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Isi biodata dulu ya!",
                  style: Theme.of(context).textTheme.title.copyWith(fontSize: 48),
                ),
                SizedBox(
                  height: 40.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Nama",
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  inputFormatters: [
                    WhitelistingTextInputFormatter(RegExp("[a-z A-Z]"))
                  ],
                  validator: (value) {
                    if (value.isEmpty)
                      return "Isikan nama kamu disini";

                    return null;
                  },
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (val){
                    FocusScope.of(context).requestFocus(umurFocusNode);
                  },
                  onSaved: (value){
                    Biodata.nama = value;
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Umur",
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
                    prefixIcon: Icon(Icons.accessible),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    WhitelistingTextInputFormatter.digitsOnly
                  ],
                  validator: (value){
                    if (value.isEmpty)
                      return "Tolong isikan umur kamu disini ya!";
                    else if (int.parse(value) > 150)
                      return "Umur kamu lebih dari 150 tahun? Serius?";

                    return null;
                  },
                  focusNode: umurFocusNode,
                  onSaved: (value){
                    Biodata.umur = int.parse(value);
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                  color: Theme.of(context).primaryColor,
                  padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 12.5),
                  child: Text(
                    "Lanjut!",
                    style: Theme.of(context).textTheme.title.copyWith(color: Colors.white),
                  ),
                  onPressed: () {
                    if (_formKey.currentState.validate()){
                      _formKey.currentState.save();
                      Navigator.of(context).popAndPushNamed("QuestionsPage");
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
