import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_example/controller/example_controller.dart';
import 'package:get_x_example/screen/binding_lazy_put_screen.dart';
import 'package:get_x_example/screen/binding_put_screen.dart';
import 'package:get_x_example/screen/state_reactive_screen.dart';
import 'package:get_x_example/screen/state_simple_screen.dart';
import 'package:get_x_example/screen/get_to_screen.dart';
import 'package:get_x_example/screen/home_screen.dart';

/*
  ref
  1. 1~8까지 있음
  https://velog.io/@giyeon/flutter-1-1-Getx-General-Route-management
  2.
  https://velog.io/@coding_egg/Flutter-GetX-%EC%82%AC%EC%9A%A9%ED%95%98%EA%B8%B0
 */
void main() {
  runApp(
    // 라우트 관리를 위해 GetMaterialApp으로 변경
    GetMaterialApp(
      title: 'GetX example',
      home: HomeScreen(),
      getPages: [
        GetPage(
          name: '/',
          page: () => HomeScreen(),
        ),
        GetPage(
          name: '/next',
          page: () => GetToScreen(),
        ),
        GetPage(
          name: '/state-simple',
          page: () => StateSimpleScreen(),
        ),
        GetPage(
          name: '/state-reative',
          page: () => StateReactiveScreen(),
        ),
        GetPage(
          name: '/binding',
          page: () => BindingPutScreen(),
          binding: BindingsBuilder<ExampleController>(() {
            Get.put(ExampleController());
          }),
        ),
        GetPage(
          name: '/binding_lazy',
          page: () => BindingLazyPutScreen(),
          binding: BindingsBuilder<ExampleController>(() {
            Get.lazyPut(() => ExampleController());
          }),
        ),
      ],
    ),
  );
}
