import 'dart:math';

import '../models/task.dart';

class TaskFactory{
  
  Random random = Random(DateTime.now().microsecondsSinceEpoch);


  List<Task> generateTask({int items = 5}){
    List<Task> list = [];

    for(int i = 0; i < items; i++){
      list.add(
        Task(
          generateName(), 
          generateDate(), 
          generateDate(), 
          generateStatus()
          )
      );
    }

    return list;
  }

  String generateName(){
    const characters = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz';
    Random random = Random();
    return String.fromCharCodes(Iterable.generate(
        7, (_) => characters.codeUnitAt(random.nextInt(characters.length))));
  }

  String generateDate(){
    return DateTime.fromMillisecondsSinceEpoch(
      random.nextInt(10) + 10
    ).toString();
  }

  bool generateStatus(){
    return random.nextBool();
  }
}