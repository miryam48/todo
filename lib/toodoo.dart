import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: todo(),));
}
bool check = false;
class todo extends StatefulWidget {
  const todo({super.key});

  @override
  State<todo> createState() => _todoState();
}



class _todoState extends State<todo> {

  List tasks = [];
  List value = [];
  TextEditingController _textEditingController = TextEditingController();

  void addTodo(String task) {
    if (_textEditingController.text.isNotEmpty) {
      setState(() {
        tasks.add(task);
        value.add(false);
      });
    }
  }

  void deletetodo(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TooDoo'),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(tasks[index], style: TextStyle(color: Colors.black,
                decoration: value[index]
                    ? TextDecoration.lineThrough
                    : TextDecoration.none),),
            leading: Checkbox(value: value[index], onChanged: (king) {
              setState(() {
                value[index] = !value[index];
              });
            }),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(icon: Icon(Icons.edit, color: Colors.blue,),
                  onPressed: () {},
                ),
                IconButton(icon: Icon(Icons.delete, color: Colors.redAccent,),
                  onPressed: () {
                    deletetodo(index);
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context, builder: (BuildContext context) {
            String newTask = '';
            return AlertDialog(
              title: Text('Add a todo', style: TextStyle(color: Colors.blue),),
              content: TextField(
                controller: _textEditingController,
                decoration: const InputDecoration(hintText: 'Type you todo'),
                autofocus: true,
                onChanged: (value) {
                  newTask = value;
                },
              ),
              actions: [
                OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Cancel', style: TextStyle(color: Colors.white),)
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                      addTodo(_textEditingController.text);
                      _textEditingController.clear();
                    },
                    child: Text('Ok')
                )
              ],
            );
          },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}