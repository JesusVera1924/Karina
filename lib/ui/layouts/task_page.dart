import 'package:flutter/material.dart';
import 'package:tesis_karina/widgets/white_card.dart';

class TaskPage extends StatefulWidget {
  TaskPage({Key? key}) : super(key: key);

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Generar Tareas')),
      body: WhiteCard(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Text('prueba'),
                  Text('a'),
                  Text('77777'),
                ],
              )
            ],
          ),
          acciones: Icon(Icons.emoji_objects_rounded)),
    );
  }
}
