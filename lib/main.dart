import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  bool a = true;
  int i = 100;
  double d = 10.2;
  String s = '';

  List<Map> list = [
    {'index': 0, 'name': 'Денис', 'isSelect': false},
    {'index': 1, 'name': 'Женя', 'isSelect': false},
    {'index': 2, 'name': 'Андрій', 'isSelect': false},
    {'index': 3, 'name': 'Ріма', 'isSelect': false},
    {'index': 4, 'name': 'Олег', 'isSelect': false},
  ];

  Map dog = {
    'name': 'Nick',
    'age': 3,
  };

  Set set = {1, 2, 6, 1, 3, 1};

  void fore() {
    for (int i = 0; list.length >= i; i++) {
      print(list[i]);
    }
  }

  void _select(int index) {
    setState(() {
      list[index]['isSelect'] = !list[index]['isSelect'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...list
                .map((e) => Item(
                      data: e,
                      onTap: () {
                        _select(e['index']);
                      },
                    ))
                .toList()
          ],
        ),
      ),
    ));
  }
}

class Item extends StatelessWidget {
  const Item({
    Key? key,
    required this.data,
    required this.onTap,
  }) : super(key: key);

  final Map data;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        margin: EdgeInsets.all(20),
        height: 60,
        width: MediaQuery.of(context).size.width,
        color: data['isSelect'] ? Colors.black : Colors.blueGrey,
        alignment: Alignment.center,
        child: Text(
          data['name'],
          style: TextStyle(fontSize: 26, color: Colors.white),
        ),
      ),
    );
  }
}

class Person {
  const Person({
    required this.name,
    required this.isSelect,
  });

  final String name;
  final bool isSelect;
}
