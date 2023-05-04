import 'package:flutter/cupertino.dart';

class Item extends StatelessWidget {
  const Item({Key? key, required this.data}) : super(key: key);
  
  final String data;

  @override
  Widget build(BuildContext context) {
    return Text(data);
  }
}

