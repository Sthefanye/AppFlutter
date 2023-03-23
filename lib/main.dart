import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool opacidade = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: Container(),
          title: Text('Tarefas'),
        ),
        body: AnimatedOpacity(
          opacity: opacidade ? 1 : 0,
          duration: Duration(milliseconds: 800),
          child: ListView(
            children: [
              Task(
                  'Aprender Flutter',
                  'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large',
                  3),
              Task('Aprender a andar de bike',
                  'https://cdn-icons-png.flaticon.com/512/946/946971.png', 2),
              Task('Ler o clean code',
                  'https://cdn-icons-png.flaticon.com/512/1830/1830845.png', 5),
              Task('Ir ao mercado',
                  'https://cdn-icons-png.flaticon.com/512/862/862819.png', 1),
              Task('Assitir podcast',
                  'https://cdn-icons-png.flaticon.com/512/3771/3771390.png', 2),
              Task(
                  'Fazer curso Alura',
                  'https://www.alurastart.com.br/assets/api/share/alura-start.jpg',
                  3),
              Task('Brincar com gatos',
                  'https://cdn-icons-png.flaticon.com/512/5904/5904059.png', 4),
              Task(
                  'Aprender Dart',
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/Dart-logo-icon.svg/2048px-Dart-logo-icon.svg.png',
                  2),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          setState(() {
            opacidade = !opacidade;
          });
        },
        child: Icon(Icons.remove_red_eye),
        ),
      ),
    );
  }
}

class Task extends StatefulWidget {
  final String taskName;
  final String foto;
  final int dificuldade;

  const Task(this.taskName, this.foto, this.dificuldade, {Key? key})
      : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
          child: Stack(
        children: [
          Container(
            color: null,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0), color: Colors.blue),
            height: 140,
          ),
          Column(
            children: [
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: Colors.white),
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            color: Colors.black26),
                        height: 100,
                        width: 72,
                        child: ClipRRect( borderRadius: BorderRadius.circular(4), child: Image.network(widget.foto, fit: BoxFit.cover)),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              width: 200,
                              child: Text(
                                widget.taskName,
                                style: TextStyle(
                                    fontSize: 20,
                                    overflow: TextOverflow.ellipsis),
                              )),
                          Row(
                            children: [
                              Icon(
                                (Icons.star),
                                size: 15,
                                color: (widget.dificuldade) >= 1
                                    ? Colors.blue
                                    : Colors.blue[100],
                              ),
                              Icon(
                                (Icons.star),
                                size: 15,
                                color: (widget.dificuldade) >= 2
                                    ? Colors.blue
                                    : Colors.blue[100],
                              ),
                              Icon(
                                (Icons.star),
                                size: 15,
                                color: (widget.dificuldade) >= 3
                                    ? Colors.blue
                                    : Colors.blue[100],
                              ),
                              Icon(
                                (Icons.star),
                                size: 15,
                                color: (widget.dificuldade) >= 4
                                    ? Colors.blue
                                    : Colors.blue[100],
                              ),
                              Icon(
                                (Icons.star),
                                size: 15,
                                color: (widget.dificuldade) >= 5
                                    ? Colors.blue
                                    : Colors.blue[100],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        height: 52,
                        width: 52,
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                nivel++;
                              });
                              print(nivel);
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.arrow_drop_up),
                                Text('Up', style: TextStyle(fontSize: 12))
                              ],
                            )),
                      )
                    ],
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      child: LinearProgressIndicator(
                        color: Colors.white,
                        value: (widget.dificuldade > 0)
                            ? (nivel / widget.dificuldade) / 10
                            : 1,
                      ),
                      width: 200,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text('Nível $nivel',
                        style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ],
          ),
        ],
      )),
    );
  }
}
