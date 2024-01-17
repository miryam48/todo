import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: cat(),));
}

String typetext = '';

class cat extends StatefulWidget {
  const cat({super.key});

  @override
  State<cat> createState() => _catState();
}

class _catState extends State<cat> {

  TextEditingController _controller = TextEditingController();

  void snackbarchange(){
    setState(() {
      typetext = _controller.text;
    });
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SnackBar'),
      ),
      body: TextField(
        controller: _controller,
        decoration: InputDecoration(hintText: 'Type'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          snackbarchange();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content : Text(typetext)));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
