import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  ScrollController controller = ScrollController();

  @override
  void initState() {
    controller.addListener(() => listen());
    super.initState();
  }

  void listen(){
   print(controller.position.pixels);
  }

  void toUp() {
    controller.animateTo(
      controller.position.minScrollExtent,
      duration: Duration(milliseconds: 1000),
      curve: Curves.ease,
    );
  }

  void toDown() {
    controller.animateTo(
      controller.position.maxScrollExtent,
      duration: Duration(milliseconds: 1000),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: ListView.builder(
        controller: controller,
        itemCount: 50,
        itemBuilder: (_, index) {
          return Container(
            margin: EdgeInsets.only(bottom: 10),
            height: 50,
            color: Colors.grey,
            child: Center(
              child: Text(
                '$index',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ),
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () => toUp(),
            icon: const Icon(
              Icons.arrow_circle_up,
              size: 40,
            ),
          ),
          const SizedBox(
            width: 50,
          ),
          IconButton(
            onPressed: () => toDown(),
            icon: const Icon(
              Icons.arrow_circle_down,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }
}
