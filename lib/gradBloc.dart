import 'dart:async';

enum year { y2016, y2018 }

class GradeBloc{
  int selectedYear;
  final stateStreamController = StreamController<int>();
  StreamSink<int> get gradeSink => stateStreamController.sink;
  Stream<int> get gradeStream => stateStreamController.stream;

  final yearStreamController = StreamController();
  StreamSink<int> get yearSink => stateStreamController.sink;
  Stream<int> get yearStream => stateStreamController.stream;

  GradeBloc(){
    selectedYear = 2016;
    yearStream.listen((event) {
      if(event == year.y2018)
        selectedYear = 2018;   
      else 
        selectedYear = 2016;
    });

    gradeSink.add(selectedYear);

  }



}