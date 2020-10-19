import 'dart:async';

enum Year { y2016, y2018 }

class TextBloc {
  var _textController = StreamController<String>();
  // StreamSink<Stream> get textSink => _textController.sink;
  Stream<String> get textStream => _textController.stream;
  List<String> grades = ['', '', '', '', '', ''];
  updateText(String text) {
    grades = _calculateGrade2016(text);
    print("grades:"+grades.toString());
    _textController.sink.add(grades.toString());
    print(_textController.sink);
    print(text+"debug");
  }

  List<String> _calculateGrade2016(String text) {
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
    print(ret);
    return ret;
  }


  dispose() {
    _textController.close();
  }
}

// class GradeBloc{
//   int selectedYear;
//   final _stateStreamController = StreamController<int>();
//   StreamSink<int> get gradeSink => _stateStreamController.sink;
//   Stream<int> get gradeStream => _stateStreamController.stream;

//   final _yearStreamController = StreamController<Year>();
//   StreamSink<Year> get yearSink => _yearStreamController.sink;
//   Stream<Year> get yearStream => _yearStreamController.stream;

//   // GradeBloc(){
//   //   selectedYear = 2016;
//   //   yearStream.listen((event) {
//   //     if(event == Year.y2018)
//   //       selectedYear = 2018;   
//   //     else 
//   //       selectedYear = 2016;
//   //   });

//     // gradeSink.add(selectedYear);

// //  }
//     GradeBloc(){
//       print(gradeSink.toString());
//       print(gradeStream);
//     }
// }