import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_example/controller/example_controller.dart';

class BindingPutScreen extends StatelessWidget {
  const BindingPutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final exampleController = Get.find<ExampleController>();
    return Scaffold(
      appBar: AppBar(title: Text('Binding lazyput'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<ExampleController>(
              builder: (controller) => Text(
                '${controller.cnt}',
                style: TextStyle(fontSize: 30),
              ),
            ),
            ElevatedButton(
              onPressed: () => exampleController.increment(),
              child: Text('increment'),
            ),
            ElevatedButton(
              onPressed: () => exampleController.decrement(),
              child: Text('decrement'),
            ),
          ],
        ),
      ),
    );
  }
}
