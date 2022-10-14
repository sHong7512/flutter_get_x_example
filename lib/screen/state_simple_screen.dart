import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_example/controller/state_simple_controller.dart';

class StateSimpleScreen extends StatelessWidget {
  StateSimpleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final simpleController = Get.put(SimpleController());

    return Scaffold(
      appBar: AppBar(title: Text('GetX State simple 방식')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<SimpleController>(
              init: SimpleController(),
              builder: (controller) => Text(
                'clicks: ${controller.cnt}',
                style: TextStyle(fontSize: 30),
              ),
            ),
            ElevatedButton(
              onPressed: simpleController.increment1,
              child: SizedBox(
                child: Text(
                  'increment1',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
