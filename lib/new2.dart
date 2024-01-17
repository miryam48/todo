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

  List tasks =[];
  List value =[];
  List desc1 = [];
  TextEditingController _titleEditingController = TextEditingController();
  TextEditingController _descEditingController = TextEditingController();

  void addTodo(String task){
    if(_titleEditingController.text.isNotEmpty){
      setState(() {
        tasks.add(task);
        value.add(false);
      });
    }
  }
  void addTodo1(String desc){
    if(_descEditingController.text.isNotEmpty){
      setState(() {
        desc1.add(desc);
        value.add(false);
      });
    }
  }

  void deletetodo(int index){
    setState(() {
      tasks.removeAt(index);
      desc1.removeAt(index);
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
        itemBuilder: (context, index){
          return ListTile(
            title: Text(tasks[index],style: TextStyle(color: Colors.black,decoration: value[index]? TextDecoration.lineThrough :  TextDecoration.none),),
            subtitle: Text(desc1[index],style: TextStyle(color: Colors.grey,decoration: value[index]? TextDecoration.lineThrough :  TextDecoration.none),),
            leading: Checkbox(value: value[index], onChanged: (king){
              setState(() {
                value[index] =!value[index];
              });
            }),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(icon: Icon(Icons.edit,color: Colors.blue,),
                  onPressed: (){
                  },
                ),
                IconButton(icon: Icon(Icons.delete,color: Colors.redAccent,),
                  onPressed: (){
                    deletetodo(index);
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog(context: context, builder: (BuildContext context) {
            String newTask ='';
            return AlertDialog(
              title: Text('Add a todo',style: TextStyle(color: Colors.blue),),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: _titleEditingController,
                    decoration: const InputDecoration(hintText: 'Title',suffixStyle: TextStyle(fontSize: 20,color: Colors.black)),
                    autofocus: true,
                    onChanged: (value){
                      newTask = value;
                    },
                  ),
                  TextField(
                    controller: _descEditingController,
                    decoration: const InputDecoration(hintText: 'Description',suffixStyle: TextStyle(fontSize: 20,color: Colors.grey)),
                    autofocus: true,
                    onChanged: (value){
                      newTask = value;
                    },
                  ),
                ],
              ),

              actions: [
                OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )
                    ),
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel',style: TextStyle(color: Colors.white),)
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),
                    onPressed: (){
                      Navigator.of(context).pop();
                      addTodo(_titleEditingController.text);
                      _titleEditingController.clear();
                      addTodo1(_descEditingController.text);
                      _descEditingController.clear();
                    },
                    child:Text('Ok')
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
