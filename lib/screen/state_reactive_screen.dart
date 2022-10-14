import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_example/controller/state_reactive_controller.dart';

class StateReactiveScreen extends StatelessWidget {
  const StateReactiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final reactiveController = Get.put(ReactiveController());

    return Scaffold(
      appBar: AppBar(title: Text('GetX State reactive 방식')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /* GetX() 사용 */
            // GetX<ReactiveController>(
            //   builder: (controller) => Text(
            //     'clicks: ${controller.count2.value}',
            //     style: TextStyle(
            //       fontSize: 30,
            //     ),
            //   ),
            // ),
            /* Obx() 사용 */
            Obx(() {
              return Text(
                'clicks: ${reactiveController.cnt.value}',
                style: TextStyle(fontSize: 30),
              );
            }),
            ElevatedButton(
              onPressed: reactiveController.increment,
              child: Text('increment', style: TextStyle(fontSize: 20)),
            ),
            Obx((){
              return Text('${reactiveController.trueFalse.value}',style: TextStyle(fontSize: 30),);
            }),
            ElevatedButton(
              onPressed: reactiveController.changeBool,
              child: Text('changeBool', style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}
