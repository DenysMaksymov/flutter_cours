import 'package:flutter/material.dart';

class AnimationTest extends StatefulWidget {
  const AnimationTest({Key? key}) : super(key: key);

  @override
  State<AnimationTest> createState() => _AnimationTestState();
}

class _AnimationTestState extends State<AnimationTest> {
  ScrollController controller = ScrollController();

  int r = 0;

  @override
  void initState() {
    controller.addListener(() => listen());
    super.initState();
  }

  void listen() {
    if (controller.position.pixels < 255 && controller.position.pixels > 0) {
      r = controller.position.pixels.round();
    }
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$r'),
        backgroundColor: Color.fromRGBO(r, 55, 50, 1),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              controller: controller,
              itemCount: 20,
              itemBuilder: (_, index) => Container(
                color: index % 2 == 1 ? Colors.grey : Colors.white12,
                height: 50,
                alignment: Alignment.center,
                child: Text('${index + 1} $r'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
