import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GradeCalc extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GradeCalc();
  }
}

List<String> displayResult = ['', '', '', '', '', ''];

enum year { y2016, y2018 }

class _GradeCalc extends State<GradeCalc> {
  TextStyle textStyle = TextStyle(
    fontFamily: 'Poppins-Regular',
    fontSize: 18,
    color: Colors.blue,
    fontWeight: FontWeight.bold,
  );
  TextStyle textStyle2 = TextStyle(
    fontFamily: 'Poppins-Regular',
    color: Colors.blue,
  );
  TextStyle textStyle3 = TextStyle(
    fontFamily: 'Poppins-Regular',
    color: Colors.red,
  );

  @override
  var _formKey = GlobalKey<FormState>();
  year _character = year.y2018;
  var _autovalidate = false;
  var _minimumPadding = 1.5;
  TextEditingController internal = TextEditingController();
  int creator = 0;
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
            key: _formKey,
            autovalidate: _autovalidate,
            child: ListView(children: <Widget>[
              ListTile(
                title: const Text('Regulation 2016'),
                leading: Radio(
                  value: year.y2016,
                  groupValue: _character,
                  onChanged: (year value) {
                    setState(() {
                      _character = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Regulation 2018'),
                leading: Radio(
                  value: year.y2018,
                  groupValue: _character,
                  onChanged: (year value) {
                    setState(() {
                      _character = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: _minimumPadding * 5),
                child: Row(children: <Widget>[
                  Padding(padding: EdgeInsets.only(left: _minimumPadding * 60)),
                  Expanded(
                      child: TextFormField(
                          keyboardType: TextInputType.number,
                          validator: (String value) {
                            if (value.isEmpty) {
                              displayResult = emptyResult();
                              return 'Enter valid value';
                            }
                            // if (double.parse(value) == 1337) {
                            //   creator = 1;
                            //   //_showDialog();
                            //   debugPrint('1337 was called');

                            //   //  html.window.open('https://in.linkedin.com/in/swaran-iyappan','LinkedIn');
                            // }
                            if ((double.parse(value) > 50 ||
                                    double.parse(value) < 0)
                                     //&& double.parse(value) != 1337
                                     ) {
                              displayResult = emptyResult();
                              return 'Enter correct mark';
                            }
                          },
                          controller: internal,
                          decoration: InputDecoration(
                            errorStyle: textStyle3,
                            labelText: 'Internal Marks',
                            labelStyle: textStyle,
                            hintText: 'Enter Internal Marks',
                            hintStyle: textStyle2,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                          ))),
                  Padding(padding: EdgeInsets.only(left: _minimumPadding * 60)),
                ]),
              ),
              Container(height: _minimumPadding * 10),
              Row(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(left: _minimumPadding * 60)),
                  Expanded(
                    child: Container(
                      height: 45.0,
                      child: RaisedButton(
                        child: Text(
                          'Calculate',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          setState(() {
                            if (_formKey.currentState.validate() &&
                                creator == 1) {
                              displayResult = _showCreator();
                              SystemChannels.textInput
                                  .invokeMethod('TextInput.hide');
                            }
                            if (_formKey.currentState.validate() &&
                                _character == year.y2016 &&
                                creator == 0) {
                              displayResult = _calculateGrade2016();
                              SystemChannels.textInput
                                  .invokeMethod('TextInput.hide');
                            }

                            if (_formKey.currentState.validate() &&
                                _character == year.y2018 &&
                                creator == 0) {
                              debugPrint('2018');
                              displayResult = _calculateGrade2018();
                              SystemChannels.textInput
                                  .invokeMethod('TextInput.hide');
                            }
                            creator = 0;
                          });
                        },
                        color: Colors.blue,
                        textColor: Colors.white,
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(left: _minimumPadding * 60)),
                ],
              ),
              Padding(
                  padding: EdgeInsets.only(
                      top: _minimumPadding * 10,
                      left: _minimumPadding * 10,
                      bottom: _minimumPadding * 10),
                  child: Text(
                    displayResult[0],
                    style: textStyle,
                    textScaleFactor: 1.2,
                  )),
              Padding(
                  padding: EdgeInsets.only(
                      top: _minimumPadding * 10,
                      left: _minimumPadding * 10,
                      bottom: _minimumPadding * 10),
                  child: Text(
                    displayResult[1],
                    style: textStyle,
                    textScaleFactor: 1.2,
                  )),
              Padding(
                  padding: EdgeInsets.only(
                      top: _minimumPadding * 10,
                      left: _minimumPadding * 10,
                      bottom: _minimumPadding * 10),
                  child: Text(
                    displayResult[2],
                    style: textStyle,
                    textScaleFactor: 1.2,
                  )),
              Padding(
                  padding: EdgeInsets.only(
                      top: _minimumPadding * 10,
                      left: _minimumPadding * 10,
                      bottom: _minimumPadding * 10),
                  child: Text(
                    displayResult[3],
                    style: textStyle,
                    textScaleFactor: 1.2,
                  )),
              Padding(
                  padding: EdgeInsets.only(
                      top: _minimumPadding * 10,
                      left: _minimumPadding * 10,
                      bottom: _minimumPadding * 10),
                  child: Text(
                    displayResult[4],
                    style: textStyle,
                    textScaleFactor: 1.2,
                  )),
              Padding(
                  padding: EdgeInsets.only(
                      top: _minimumPadding * 10,
                      left: _minimumPadding * 10,
                      bottom: _minimumPadding * 10),
                  child: Text(
                    displayResult[5],
                    style: textStyle,
                    textScaleFactor: 1.2,
                  )),
            ])));
  }

  List<String> emptyResult() {
    List<String> ret;
    ret = ['', '', '', '', '', ''];
    return ret;
  }

  List<String> _showCreator() {
    List<String> ret = [
      'Swaran I.',
      'CSE',
      'Batch of 21\'',
      'Created this app.',
      '',
      ''
    ];
    return ret;
  }

  List<String> _calculateGrade2016() {
    String s, a, b, c, d, e;
    double inter = 0.0;
    List<String> ret = [];
    inter = double.parse(internal.text) + 50;
    debugPrint("Internal" + internal.text);
    debugPrint("Inter" + inter.toString());
    if (inter <= 90.0)
      s = 'S Grade : Not possible';
    else
      s = ('S Grade : ') + ((-(inter - 91.0) + 50.0) * 2).toStringAsFixed(2);
    ret.add(s);
    if (inter <= 80.0)
      a = 'A Grade : Not possible';
    else {
      if ((-(inter - 81.0) + 50.0) * 2 >= 46.0)
        a = ('A Grade : ') + ((-(inter - 81.0) + 50.0) * 2).toStringAsFixed(2);
      else
        a = 46.00.toString();
    }
    ret.add(a);
    if (inter <= 70.0)
      b = 'B Grade : Not possible';
    else {
      if (((-(inter - 71.0) + 50.0) * 2) >= 46.0)
        b = ('B Grade : ') + ((-(inter - 71.0) + 50.0) * 2).toStringAsFixed(2);
      else
        b = ('B Grade : ') + (46.00).toString();
    }
    ret.add(b);
    if (inter <= 60.0)
      c = 'C Grade : Not possible';
    else {
      if (((-(inter - 61.0) + 50.0) * 2) >= 46.0)
        c = ('C Grade : ') +
            ((-(inter - 61.0) + 50.0) * 2).toStringAsFixed((2));
      else
        c = ('C Grade : ') + (46.00).toString();
    }
    ret.add(c);
    if (inter <= 55.0)
      d = 'D Grade : Not possible';
    else {
      if (((-(inter - 56.0) + 50.0) * 2) >= 46.0)
        d = ('D Grade : ') + ((-(inter - 56.0) + 50.0) * 2).toStringAsFixed(2);
      else
        d = ('D Grade : ') + (46.00).toString();
    }
    ret.add(d);
    if (inter <= 50.0)
      e = 'E Grade : Not possible';
    else {
      if (((-(inter - 51.0) + 50.0) * 2) >= 46.0) {
        if (((-(inter - 51.0) + 50.0) * 2) <= 100)
          e = ('E Grade : ') +
              ((-(inter - 51.0) + 50.0) * 2).toStringAsFixed(2);
        else
          e = 'E Grade : Not possible';
      } else
        e = ('E Grade : ') + (46.00).toString();
    }
    ret.add(e);
    return ret;
  }

  List<String> _calculateGrade2018() {
    String s, a, b, c, d;
    double inter = 0.0;
    List<String> ret = [];
    debugPrint(internal.text);
    inter = double.parse(internal.text) + 50.0;
    if (inter <= 90.0)
      s = 'O Grade   : Not possible';
    else
      s = ('O Grade   : ') + ((-(inter - 91.0) + 50.0) * 2).toStringAsFixed(2);
    ret.add(s);
    if (inter <= 80.0)
      a = 'A+ Grade : Not possible';
    else {
      if ((-(inter - 81.0) + 50.0) * 2 >= 46.0)
        a = ('A+ Grade : ') + ((-(inter - 81.0) + 50.0) * 2).toStringAsFixed(2);
      else
        a = ('A+ Grade : ') + (46.00).toString();
    }
    ret.add(a);
    if (inter <= 70.0)
      b = ('A Grade   : ') + 'Not possible';
    else {
      if (((-(inter - 71.0) + 50.0) * 2) >= 46.0)
        b = ('A Grade   : ') +
            ((-(inter - 71.0) + 50.0) * 2).toStringAsFixed(2);
      else
        b = ('A Grade   : ') + (46.00).toString();
    }
    ret.add(b);
    if (inter <= 60.0)
      c = ('B+ Grade : ') + 'Not possible';
    else {
      if (((-(inter - 61.0) + 50.0) * 2) >= 46)
        c = ('B+ Grade : ') + ((-(inter - 61.0) + 50.0) * 2).toStringAsFixed(2);
      else
        c = ('B+ Grade : ') + (46.00).toString();
    }
    ret.add(c);
    if (inter <= 50.0)
      d = ('B Grade   : ') + 'Not possible';
    else {
      if (((-(inter - 51.0) + 50.0) * 2) >= 46.0) {
        if (((-(inter - 51.0) + 50.0) * 2) <= 100)
          d = ('B Grade   : ') +
              ((-(inter - 51.0) + 50.0) * 2).toStringAsFixed(2);
        else
          d = ('B Grade   : ') + 'Not possible';
      } else
        d = ('B Grade   : ') + (46.00).toString();
    }

    ret.add(d);
    ret.add('');
    return ret;
  }
}