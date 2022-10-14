import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetToScreen extends StatelessWidget {
  const GetToScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GetX Get.to()')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Get.back(),
          child: Text(
            'Get.back()',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
