import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_example/controller/example_controller.dart';
import 'package:get_x_example/screen/binding_lazy_put_screen.dart';
import 'package:get_x_example/screen/get_to_screen.dart';
import 'package:get_x_example/screen/binding_put_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget buildButton(VoidCallback onPressed, String text) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(fontSize: 15),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const TextStyle ts = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
    return Scaffold(
      appBar: AppBar(title: Text('GetX screen')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              const Text("라우트 관리", style: ts),
              const SizedBox(height: 16),
              buildButton(() => Get.to(GetToScreen()), 'Get.to()'),
              buildButton(
                () => Get.toNamed('/next'),
                'Get.toNamed()',
              ),
              buildButton(
                () => Get.off(GetToScreen()),
                'Get.off()',
              ),
              buildButton(
                () => Get.offAll(GetToScreen()),
                'Get.offAll()',
              ),
              buildButton(
                () => Get.showSnackbar(
                  GetSnackBar(
                    title: 'Snackbar',
                    message: 'Snackbar',
                    duration: Duration(seconds: 1),
                    snackPosition: SnackPosition.BOTTOM,
                  ),
                  // default snackbar
                  // Get.snackbar(
                  //   'Snackbar',
                  //   'Snackbar',
                  //   snackPosition: SnackPosition.TOP,
                  // ),
                ),
                'Get.showSnackbar()',
              ),
              buildButton(
                () => Get.dialog(
                  Dialog(
                    child: Container(
                      height: 100,
                      child: Center(
                        child: Text('Dialog'),
                      ),
                    ),
                  ),
                  // default dialog
                  // Get.defaultDialog(title: 'Dialog', middleText: 'Dialog')
                ),
                'Get.dialog()',
              ),
              buildButton(
                () => Get.bottomSheet(
                  Container(
                    height: 100,
                    color: Colors.white,
                    child: Center(
                      child: Text('BottomSheet'),
                    ),
                  ),
                ),
                'Get.bottomSheet()',
              ),
              const SizedBox(height: 30),
              const Text("상태 관리", style: ts),
              const SizedBox(height: 16),
              buildButton(
                () => Get.toNamed('/state-simple'),
                'State simple',
              ),
              buildButton(
                () => Get.toNamed('/state-reative'),
                'State reative',
              ),
              buildButton(
                () => Get.to(BindingPutScreen(), binding: BindingsBuilder(() {
                  Get.put(ExampleController());
                })),
                'Route Binding put',
              ),
              buildButton(
                () => Get.toNamed('/binding'),
                'Route Binding put /named',
              ),
              buildButton(
                () => Get.to(BindingLazyPutScreen(), binding: BindingsBuilder(() {
                  Get.lazyPut(() => ExampleController());
                })),
                'Route Binding lazy put',
              ),
              buildButton(
                () => Get.toNamed('/binding_lazy'),
                'Route Binding lazy put /named',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
