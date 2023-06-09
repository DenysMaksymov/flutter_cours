import 'package:flutter/material.dart';

import 'controller/loader_controller.dart';

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
    // LoaderController().getLoader();
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
          // FutureBuilder(
          //   future: LoaderController.getLoader(),
          //     builder: (_, snap) {
          //     print(snap.connectionState);
          //   if (snap.connectionState != ConnectionState.done) {
          //     return CircularProgressIndicator();
          //   } else {
          //     return Container(
          //       height: 50,
          //       width: 50,
          //       color: Colors.red,
          //     );
          //   }
          // })
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
