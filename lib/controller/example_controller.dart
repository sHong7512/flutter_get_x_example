import 'package:get/get.dart';

class ExampleController extends GetxController {
  var cnt = 0;

  void increment() {
    cnt++;
    update();
  }

  void decrement() {
    cnt--;
    update();
  }
}
