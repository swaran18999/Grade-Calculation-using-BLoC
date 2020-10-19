import 'package:bloc/bloc.dart';

enum Year {
  y2018,
  y2016
}

abstract class CalculatorState {}

class CalculatorInitial extends CalculatorState {}

class CalculatorSuccess extends CalculatorState {
  final String result;

  CalculatorSuccess(this.result);
}

class CalculatorFailed extends CalculatorState {
  final String error;

  CalculatorFailed(this.error);
}

class CalculatorEvent {
  final Year year;
  final int numberA;
  CalculatorEvent(this.year, this.numberA);
}

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc(CalculatorState initialState) : super(initialState);

  @override
  CalculatorState get initialState {
    return CalculatorInitial();
  }

  @override
  Stream<CalculatorState> mapEventToState(CalculatorEvent event) async* {
    String result = "";
    switch (event.year) {
      case Year.y2018:
        result = _calculateGrade2018(event.numberA.toString());
        yield CalculatorSuccess(result);
        break;
      case Year.y2016:
        result = _calculateGrade2016(event.numberA.toString());
        yield CalculatorSuccess(result);
        break;
    }
  }
  String _calculateGrade2016(String text) {
    String s, a, b, c, d, e;
    double inter = 0.0;
    List<String> ret = [];
    inter = double.parse(text.toString()) + 50;
    // debugPrint("Internal" + internal.text);
    print("Inter" + inter.toString());
    if (inter <= 90.0)
      s = 'S Grade : Not possible';
    else
      s = ('S Grade : ') + ((-(inter - 91.0) + 50.0) * 2).toStringAsFixed(2);
    ret.add(s);
    if (inter <= 80.0)
      a = '\nA Grade : Not possible';
    else {
      if ((-(inter - 81.0) + 50.0) * 2 >= 46.0)
        a = ('\nA Grade : ') + ((-(inter - 81.0) + 50.0) * 2).toStringAsFixed(2);
      else
        a = 46.00.toString();
    }
    ret.add(a);
    if (inter <= 70.0)
      b = '\nB Grade : Not possible';
    else {
      if (((-(inter - 71.0) + 50.0) * 2) >= 46.0)
        b = ('\nB Grade : ') + ((-(inter - 71.0) + 50.0) * 2).toStringAsFixed(2);
      else
        b = ('\nB Grade : ') + (46.00).toString();
    }
    ret.add(b);
    if (inter <= 60.0)
      c = '\nC Grade : Not possible';
    else {
      if (((-(inter - 61.0) + 50.0) * 2) >= 46.0)
        c = ('\nC Grade : ') +
            ((-(inter - 61.0) + 50.0) * 2).toStringAsFixed((2));
      else
        c = ('\nC Grade : ') + (46.00).toString();
    }
    ret.add(c);
    if (inter <= 55.0)
      d = '\nD Grade : Not possible';
    else {
      if (((-(inter - 56.0) + 50.0) * 2) >= 46.0)
        d = ('\nD Grade : ') + ((-(inter - 56.0) + 50.0) * 2).toStringAsFixed(2);
      else
        d = ('\nD Grade : ') + (46.00).toString();
    }
    ret.add(d);
    if (inter <= 50.0)
      e = '\nE Grade : Not possible';
    else {
      if (((-(inter - 51.0) + 50.0) * 2) >= 46.0) {
        if (((-(inter - 51.0) + 50.0) * 2) <= 100)
          e = ('\nE Grade : ') +
              ((-(inter - 51.0) + 50.0) * 2).toStringAsFixed(2);
        else
          e = '\nE Grade : Not possible';
      } else
        e = ('\nE Grade : ') + (46.00).toString();
    }
    ret.add(e);
    print(ret);
    return ret.toString();
  }

  String _calculateGrade2018(String text) {
    String s, a, b, c, d;
    double inter = 0.0;
    List<String> ret = [];
    inter = double.parse(text.toString()) + 50;
    if (inter <= 90.0)
      s = 'O Grade   : Not possible';
    else
      s = ('O Grade   : ') + ((-(inter - 91.0) + 50.0) * 2).toStringAsFixed(2);
    ret.add(s);
    if (inter <= 80.0)
      a = '\nA+ Grade : Not possible';
    else {
      if ((-(inter - 81.0) + 50.0) * 2 >= 46.0)
        a = ('\nA+ Grade : ') + ((-(inter - 81.0) + 50.0) * 2).toStringAsFixed(2);
      else
        a = ('\nA+ Grade : ') + (46.00).toString();
    }
    ret.add(a);
    if (inter <= 70.0)
      b = ('\nA Grade   : ') + 'Not possible';
    else {
      if (((-(inter - 71.0) + 50.0) * 2) >= 46.0)
        b = ('\nA Grade   : ') +
            ((-(inter - 71.0) + 50.0) * 2).toStringAsFixed(2);
      else
        b = ('\nA Grade   : ') + (46.00).toString();
    }
    ret.add(b);
    if (inter <= 60.0)
      c = ('\nB+ Grade : ') + 'Not possible';
    else {
      if (((-(inter - 61.0) + 50.0) * 2) >= 46)
        c = ('\nB+ Grade : ') + ((-(inter - 61.0) + 50.0) * 2).toStringAsFixed(2);
      else
        c = ('\nB+ Grade : ') + (46.00).toString();
    }
    ret.add(c);
    if (inter <= 50.0)
      d = ('\nB Grade   : ') + 'Not possible';
    else {
      if (((-(inter - 51.0) + 50.0) * 2) >= 46.0) {
        if (((-(inter - 51.0) + 50.0) * 2) <= 100)
          d = ('\nB Grade   : ') +
              ((-(inter - 51.0) + 50.0) * 2).toStringAsFixed(2);
        else
          d = ('\nB Grade   : ') + 'Not possible';
      } else
        d = ('\nB Grade   : ') + (46.00).toString();
        
    }
     
    ret.add(d);
    // ret.add('');
    return ret.toString();

  }   
}
