import 'package:flutter/material.dart';

import 'difficulty.dart';

class Task extends StatefulWidget {
  final String taskName;
  final String photo;
  final int difficulty;

  Task(this.taskName, this.photo, this.difficulty, {Key? key})
      : super(key: key);

  int level = 0;


  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {


  bool assertOrNetwork() {
    if (widget.photo.contains('http')) {
      return false;
    }
    return true;
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
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
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: assertOrNetwork()
                                ? Image.asset(widget.photo, fit: BoxFit.cover)
                                : Image.network(widget.photo,
                                    fit: BoxFit.cover)),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: 200,
                              child: Text(
                                widget.taskName,
                                style: const TextStyle(
                                    fontSize: 20,
                                    overflow: TextOverflow.ellipsis),
                              )),
                          Difficulty(difficultyLevel: widget.difficulty),
                        ],
                      ),
                      SizedBox(
                        height: 52,
                        width: 52,
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                widget.level++;
                              });
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
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
                    child: SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                        color: Colors.white,
                        value: (widget.difficulty > 0)
                            ? (widget.level / widget.difficulty) / 10
                            : 1,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text('Level ${widget.level}',
                        style: const TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
