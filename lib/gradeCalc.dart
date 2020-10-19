import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gradecalc/gradBloc.dart';

class GradeCalc extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GradeCalc();
  }
}

// List<String> displayResult = ['', '', '', '', '', ''];
String displayResult = "";
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
  String result="";
  TextBloc _textBloc = TextBloc();
  var _formKey = GlobalKey<FormState>();
  Year _character = Year.y2018;
  var _autovalidate = false;
  var _minimumPadding = 1.5;
  TextEditingController internal = TextEditingController();
  int creator = 0;
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
            key: _formKey,
            autovalidate: _autovalidate,
            child: StreamBuilder(
              stream: _textBloc.textStream,
                      builder: (ctxt, AsyncSnapshot<String> textStream) {
            return Column(children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: _minimumPadding * 5),
                child: Row(children: <Widget>[
                  Padding(padding: EdgeInsets.only(left: _minimumPadding * 60)),
                  Expanded(
                      child: TextFormField(
                          keyboardType: TextInputType.number,
                          validator: (String value) {
                            if (value.isEmpty) {
                              displayResult = "";
                              return 'Enter valid value';
                            }
                            if ((double.parse(value) > 50 ||
                                double.parse(value) < 0)) {
                              displayResult = "";
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
                            // _textBloc.updateText(internal.text);
                            
                            if (_formKey.currentState.validate()) {
                            //   displayResult = _calculateGrade2016();
                            String resukt =_textBloc.updateText(internal.text).toString();
                              print(resukt.toString());  
                              SystemChannels.textInput
                                  .invokeMethod('TextInput.hide');
                            }
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
                    result,
                    style: textStyle,
                    textScaleFactor: 1.2,
                  )),
            ]);})));
  }
}