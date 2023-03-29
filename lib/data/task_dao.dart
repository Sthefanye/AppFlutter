import 'package:nosso_primeiro_projeto/components/task.dart';
import 'package:nosso_primeiro_projeto/data/database.dart';
import 'package:sqflite/sqflite.dart';

class TaskDao {
  static const String tableSql = 'CREATE TABLE $_tablename('
      '$_name TEXT, '
      '$_difficulty INTEGER, '
      '$_image TEXT)';

  static const String _tablename = 'taskTable';
  static const String _name = 'name';
  static const String _difficulty = 'difficulty';
  static const String _image = 'image';

  save(Task task) async {
    print('Iniciando o save: ');
    final Database databse = await getDatabase();
    var itemExists = await find(task.name);
    Map<String, dynamic> taskMap = toMap(task);
    if (itemExists.isEmpty) {
      print('a Tarefa não Existia.');
      return await databse.insert(_tablename, taskMap);
    } else {
      print('a Tarefa existia!');
      return await databse.update(
        _tablename,
        taskMap,
        where: '$_name = ?',
        whereArgs: [task.name],
      );
    }
  }

  Map<String, dynamic> toMap(Task task) {
    print('Convertendo to Map: ');
    final Map<String, dynamic> mapaDeTarefas = Map();
    mapaDeTarefas[_name] = task.name;
    mapaDeTarefas[_difficulty] = task.difficulty;
    mapaDeTarefas[_image] = task.image;
    print('Mapa de Tarefas: $mapaDeTarefas');
    return mapaDeTarefas;
  }

  Future<List<Task>> findAll() async {
    print('Acessando o findAll: ');
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result =
    await bancoDeDados.query(_tablename);
    print('Procurando dados no banco de dados... encontrado: $result');
    return toList(result);
  }

  List<Task> toList(List<Map<String, dynamic>> taskMap) {
    print('Convertendo to List:');
    final List<Task> taskList = [];
    for (Map<String, dynamic> line in taskMap) {
      final Task tarefa = Task(
        line[_name],
        line[_image],
        line[_difficulty],
      );
      taskList.add(tarefa);
    }
    print('Lista de Tarefas: ${taskList.toString()}');
    return taskList;
  }

  Future<List<Task>> find(String taskName) async {
    print('Acessando find: ');
    final Database database = await getDatabase();
    print('Procurando tarefa com o nome: $taskName');
    final List<Map<String, dynamic>> result = await database
        .query(_tablename, where: '$_name = ?', whereArgs: [taskName]);
    print('Tarefa encontrada: ${toList(result)}');

    return toList(result);
  }

  delete(String taskName) async {
    print('Deletando tarefa: $taskName');
    final Database database = await getDatabase();
    return await database.delete(
      _tablename,
      where: '$_name = ?',
      whereArgs: [taskName],
    );
  }
}