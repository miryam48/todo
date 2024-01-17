import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: cat(),));
}

String appbartitle='';

class cat extends StatefulWidget {
  const cat({super.key});

  @override
  State<cat> createState() => _catState();
}

class _catState extends State<cat> {

  TextEditingController _controller=TextEditingController();

 void appbarchange(){
   setState(() {
     appbartitle = _controller.text;
   });
   _controller.clear();
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appbartitle),
      ),
      body: TextField(
        controller: _controller,
        decoration: InputDecoration(hintText: ''),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          appbarchange();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

