import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/example_controller.dart';

class BindingLazyPutScreen extends StatelessWidget {
  const BindingLazyPutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Binding lazyput'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder<bool>(
              future: Future.delayed(const Duration(seconds: 2), () => true),
              builder: (context, snapshot) {
                if (snapshot.hasData == false) {
                  return const CircularProgressIndicator();
                }
                // GetBuilder를 넣어주면 controller가 사용되야하기때문에 바로 init됨
                log('Future 끝, Getbuilder 실행(controller를 사용하므로 initialized됨)');
                return GetBuilder<ExampleController>(
                  builder: (controller) => Text(
                    '${controller.cnt}',
                    style: TextStyle(fontSize: 30),
                  ),
                );
              },
            ),
            ElevatedButton(
              onPressed: () => Get.find<ExampleController>().increment(),
              child: Text('increment'),
            ),
            ElevatedButton(
              onPressed: () => Get.find<ExampleController>().decrement(),
              child: Text('decrement'),
            ),
          ],
        ),
      ),
    );
  }
}
