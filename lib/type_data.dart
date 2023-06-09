import 'package:flutter/material.dart';

class TypeData extends StatefulWidget {
  const TypeData({Key? key}) : super(key: key);

  @override
  State<TypeData> createState() => _TypeDataState();
}

class _TypeDataState extends State<TypeData> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: ,

      body: Center(
        child: Text(
          '$counter',
          style: TextStyle(fontSize: 30),
        ),
      ),
      floatingActionButton: IconButton(
        onPressed: () {
          counter++;
          setState(() {

          });

        },
        icon: Icon(
          Icons.add,
          size: 50,
        ),
      ),
    );
  }
}
