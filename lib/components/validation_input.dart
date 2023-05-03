
import 'package:flutter/material.dart';

class ValidationInput extends StatefulWidget {
  const ValidationInput({Key? key}) : super(key: key);

  @override
  State<ValidationInput> createState() => _ValidationInputState();
}

class _ValidationInputState extends State<ValidationInput> {

  bool ismasterCard = false;

  void parseNumberCard(String value) {
    if(value.trim() == '1'){
      ismasterCard = true;
    }else{
      ismasterCard = false;
    }
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(50),
      child: Column(
        children: [
          TextField(
            keyboardType: TextInputType.number,
            onChanged: parseNumberCard,
          ),
          ismasterCard? Icon(Icons.add):Icon(Icons.map)
        ],
      ),
    );
  }
}