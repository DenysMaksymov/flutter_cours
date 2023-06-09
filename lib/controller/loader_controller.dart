import 'dart:async';

class LoaderController {


  static Future<String> getLoader() async {

    await Future.delayed(const Duration(milliseconds: 1500));

    return 'Data ready';

  }
}
