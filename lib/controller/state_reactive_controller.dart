import 'package:get/get.dart';

class ReactiveController extends GetxController {
  var cnt = 0.obs;
  // var cnt = Rx<int>(0);
  // var cnt = RxInt(0);
  var trueFalse = false.obs;

  void increment() => cnt.value++;

  changeBool() => trueFalse.value = !trueFalse.value;

  @override
  void onInit() {
    super.onInit();

    once(cnt, (callback) {
      print('$callback이 처음으로 변경되었습니다.');
    });
    once(trueFalse, (callback) => print('trueFalse가 $callback으로 처음으로 변경되었습니다.'));
    ever(trueFalse, (callback) => print('trueFalse가 $callback로 변경되었습니다.'));

    // once: listener가 처음으로 변경되었을 때만 호출된다.
    // ever: listener가 변경될 때마다 호출된다.
    // debounce: listener가 변경되다가 마지막 변경 후, 1초간 변경이 없을 때 호출된다.
    // interval: listener가 변경되고 있는 동안, 1초마다 호출된다.
  }
}
