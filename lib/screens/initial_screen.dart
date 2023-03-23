
import 'package:flutter/material.dart';
import 'package:nosso_primeiro_projeto/components/task.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool opacity = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text('Tarefas'),
      ),
      body: AnimatedOpacity(
        opacity: opacity ? 1 : 0,
        duration: const Duration(milliseconds: 800),
        child: ListView(
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
            SizedBox(height: 80, ),
          ],

        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          opacity = !opacity;
        });
      },
        child: const Icon(Icons.remove_red_eye),
      ),
    );
  }
}
