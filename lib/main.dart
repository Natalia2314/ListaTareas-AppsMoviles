import 'package:flutter/material.dart';
import 'package:flutter_visual_code/factory/task_factory.dart';
import 'package:flutter_visual_code/models/task.dart';

void main() {
  runApp(MaterialAppCustom());
}

class MaterialAppCustom extends StatelessWidget {
   const MaterialAppCustom();

   @override
   Widget build(BuildContext context){
    return MaterialApp(
      home: ToDoList(),
    );
   }
}

class ToDoList extends StatelessWidget {

  ToDoList({super.key});

  //tasks.map((e) => Container(child: Text("Hola"))).toList()

  List<Task> tasks = TaskFactory().generateTask();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
            child: Container(
              color: Color.fromARGB(255, 196, 194, 211),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 25, bottom: 20),
                  ),
                  const Text("Menú", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
                  Container(
                    margin: const EdgeInsets.only(top: 30),
                    width: double.infinity,
                    child: const Text("Inicio"),
                    padding: const EdgeInsets.all(20),
                    color: Color.fromARGB(255, 227, 227, 230),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 2),
                    width: double.infinity,
                    child: const Text("Opción 1"),
                    padding: const EdgeInsets.all(20),
                    color: Color.fromARGB(255, 227, 227, 230),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 2),
                    width: double.infinity,
                    child: const Text("Opción 2"),
                    padding: const EdgeInsets.all(20),
                    color: Color.fromARGB(255, 227, 227, 230),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 2),
                    width: double.infinity,
                    child: const Text("Opción 3"),
                    padding: const EdgeInsets.all(20),
                    color: Color.fromARGB(255, 227, 227, 230),
                  )
                ],
              ),
            ),
        ),
        //backgroundColor: Colors.lightBlue[50],
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 91, 78, 185),
          /*leading: const IconButton(
            icon: Icon(Icons.check),
             tooltip: 'Lista de tareas',
             onPressed: null,
          ),*/
          title: const Text("Lista de tareas"),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: 
              tasks.map((task) => Container(
                height: 50,
                padding: const EdgeInsets.only(left: 20, right: 20),
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Color.fromARGB(255, 74, 43, 184)),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:[
                      IconButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                              MaterialAppCustom2(task)
                            )
                        ),
                        icon: Icon(Icons.arrow_circle_right_outlined)
                      ),
                      Text(task.name()),
                      task.status() ? const Icon( Icons.check_box) : const Icon(Icons.check_box_outline_blank_outlined),
                  ],
                ),
              )).toList()
          ),
        )
      );
  }
}

class MaterialAppCustom2 extends StatelessWidget {
    Task _task;
  
    MaterialAppCustom2(this._task);
  
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        //Selecciona toda la pantalla!
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 91, 78, 185),
        ),
        //body: Text(_task.name()),
        body: Container(
          child: Column(            
            children: [
              Container (
                margin: const EdgeInsets.only(top: 25, bottom: 20),
                child: const Text("Detalle Tareas", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40, )),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30),
                width: double.infinity,
                //child: Text('haskld ${_task.endDate()} ${_task.name()}'),
                child: Text('Nombre: ${_task.name()}'),
                padding: const EdgeInsets.all(20),
                color: Color.fromARGB(255, 204, 204, 241),
              ),
              Container(
                margin: const EdgeInsets.only(top: 2),
                width: double.infinity,
                child: Text('Fecha Inicial: ${_task.initialDate()}'),
                padding: const EdgeInsets.all(20),
                color: Color.fromARGB(255, 204, 204, 241),
              ),
              Container(
                margin: const EdgeInsets.only(top: 2),
                width: double.infinity,
                child: Text('Fecha Final: ${_task.endDate()}'),
                padding: const EdgeInsets.all(20),
                color: Color.fromARGB(255, 204, 204, 241),
              ),     
              Container(
                margin: const EdgeInsets.only(top: 2),
                width: double.infinity,
                child: Text('Estado: ${_task.status()}'),
                padding: const EdgeInsets.all(20),
                color: Color.fromARGB(255, 204, 204, 241),
              ),         
            ]
          ),
        ),
      );
    }
  }