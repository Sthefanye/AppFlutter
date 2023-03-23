import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Tarefas'),
        ),
        body: ListView(
          children: [
            Task('Aprender a andar de bike'),
            Task('Aprender FLutter'),
            Task('Aprender Dart'),
            Task('Aprender Dart'),
            Task('Aprender Dart'),
            Task('Aprender Dart'),
            Task('Aprender Dart'),
            Task('Aprender Dart'),
            Task('Aprender Dart'),
          ],
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {}),
      ),
    );
  }
}

class Task extends StatelessWidget {
  final String taskName;

  const Task(this.taskName, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int nivel = 0;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
          child: Stack(
        children: [
          Container(
            color: Colors.blue,
            height: 140,
          ),
          Column(
            children: [
              Container(
                  color: Colors.white,
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        color: Colors.black26,
                        height: 100,
                        width: 72,
                      ),
                      Container(
                          width: 200,
                          child: Text(
                            taskName,
                            style: TextStyle(
                                fontSize: 20, overflow: TextOverflow.ellipsis),
                          )),
                      ElevatedButton(
                          onPressed: () {
                            nivel++;
                            print(nivel);
                          },
                          child: Icon(Icons.arrow_drop_up))
                    ],
                  )),
              Text('Nível 0', style: TextStyle(color: Colors.white))
            ],
          ),
        ],
      )),
    );
  }
}
