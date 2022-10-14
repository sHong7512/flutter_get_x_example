import 'package:get/get.dart';

class SimpleController extends GetxController {
  var cnt = 0;

  void increment1() {
    cnt++;
    update();
  }
}