
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
          opacity = !opacity;
        });
      },
        child: const Icon(Icons.remove_red_eye),
      ),
    );
  }
}
