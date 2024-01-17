import 'package:flutter/material.dart';

void main(){
 runApp(MaterialApp(debugShowCheckedModeBanner: false,home: cat(),));
}

bool check = false;
class cat extends StatefulWidget {
  const cat({super.key});

  @override
  State<cat> createState() => _catState();
}

class _catState extends State<cat> {

  List tasks =[];
  List desc1 =[];
  List value =[];

  TextEditingController _titlecontroller=TextEditingController();
  TextEditingController _desccontroller=TextEditingController();

  void titlechange(String titletask) {
    if (_titlecontroller.text.isNotEmpty) {
      setState(() {
        tasks.add(titletask);
        value.add(false);
      });
    }
  }

  void descchange(String desctask){
    if(_desccontroller.text.isNotEmpty){
      setState(() {
        desc1.add(desctask);
        value.add(false);
      });
    }
  }
  
  void deletedolist(int index){
    setState(() {
      tasks.removeAt(index);
      desc1.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dolist'),
      ),
      body:ListView.builder(
        itemCount: tasks.length,
          itemBuilder: (context,index){
          return ListTile(
            leading: Checkbox(value: value[index],onChanged: (king){
            setState(() {
              value[index] = !value[index];
            });  
            },
            ),
            title: Text(tasks[index],style: TextStyle(color: Colors.black,decoration: value[index]? TextDecoration.lineThrough : TextDecoration.none),),
            subtitle: Text(desc1[index],style: TextStyle(color: Colors.grey,decoration: value[index]? TextDecoration.lineThrough : TextDecoration.none),),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                    onPressed: (){
                      
                    }, 
                    icon: Icon(Icons.edit,color: Colors.blue,)
                ),
                IconButton(
                    onPressed: (){
                      deletedolist(index);
                    }, 
                    icon: Icon(Icons.delete,color: Colors.red,)
                )
              ],
            ),
          );
          }
      ),
        floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog(context: context, builder: (BuildContext context){
           String newTask =''; 
           return AlertDialog(
             title: Text('Add Dolist',style: TextStyle(color: Colors.black),),
             content: Column(
               mainAxisSize: MainAxisSize.min,
               children: [
                 TextField(
                   controller: _titlecontroller,
                   decoration: const InputDecoration(hintText: 'type',suffixStyle: TextStyle(fontSize: 20,color: Colors.black)),
                   autofocus: true,
                   onChanged: (value){
                     newTask = value;
                   },
                 ),
                 TextField(
                   controller: _desccontroller,
                   decoration: const InputDecoration(hintText: 'type',suffixStyle: TextStyle(fontSize: 20,color: Colors.grey)),
                   autofocus: true,
                   onChanged: (value){
                     newTask = value;
                   },
                 )
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
                     
                   }, 
                   child: Text('Ok')
               )
             ],
           );
          },
          );
        },
    ),
    );
  }
}
