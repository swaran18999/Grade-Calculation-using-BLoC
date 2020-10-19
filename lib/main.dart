import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
import 'package:gradecalc/calcBloc.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final TextEditingController _internalController = TextEditingController();
  final CalculatorBloc _calculatorBloc = CalculatorBloc(null);
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SVCE Grade Calculator BLoC'),
      ),
      body: BlocProvider<CalculatorBloc>(
        create: (context) => _calculatorBloc,
        child: BlocListener<CalculatorBloc, CalculatorState>(
          listener: (context, state) {
            if (state is CalculatorFailed) {
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text('${state.error}'),
              ));
            }
          },
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(height: 30),
                  TextField(
                    controller: _internalController,
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
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  Container(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          height: 45.0,
                          child: RaisedButton(
                            color: Colors.blue,
                            textColor: Colors.white,
                            child: Text(
                              'Reg. 2018',
                              textScaleFactor: 1.5,
                            ),
                            onPressed: () {
                              calculate(Year.y2018);
                            },
                          ),
                        ),
                      ),
                      SizedBox(width: 8.0),
                      Expanded(
                        child: Container(
                          height: 45.0,
                          child: RaisedButton(
                            color: Colors.blue,
                            textColor: Colors.white,
                            child: Text(
                              'Reg. 2016',
                              textScaleFactor: 1.5,
                            ),
                            onPressed: () {
                              calculate(Year.y2016);
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20.0),
                  BlocBuilder<CalculatorBloc, CalculatorState>(
                    builder: (context, state) {
                      if (state is CalculatorInitial) {
                        return Text('Result: -');
                      } else if (state is CalculatorSuccess) {
                        return Text(
                          '${state.result.substring(1, state.result.length - 1)}',
                          style: textStyle,
                          textScaleFactor: 1.2,
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void calculate(Year year) {
    int numberA = int.parse(_internalController.text.toString());
    _calculatorBloc.add(CalculatorEvent(year, numberA));
  }
}
