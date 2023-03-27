import 'package:flutter/material.dart';
import 'package:nosso_primeiro_projeto/components/task.dart';
import 'package:nosso_primeiro_projeto/screens/form_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text('Tarefas'),
      ),
      body: ListView(
        children: const [
          Task(
              'Aprender Flutter',
              'assets/images/flutter.png',
              3),
          Task('Aprender a andar de bike',
              'assets/images/bike.png', 2),
          Task('Ler o clean code',
              'assets/images/ler.png', 5),
          Task('Assitir podcast',
              'assets/images/podcast.png', 2),
          Task(
              'Fazer curso Alura',
              'assets/images/alura-start.jpg',
              3),
          SizedBox(height: 80,),
        ],

      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const FormScreen())
        );
      },
        child: const Icon(Icons.add),
      ),
    );
  }
}
