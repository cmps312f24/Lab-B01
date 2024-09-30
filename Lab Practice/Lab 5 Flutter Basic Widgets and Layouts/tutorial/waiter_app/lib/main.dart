import 'package:flutter/material.dart';
import 'package:waiter_app/main_body.dart';

void main() {
  runApp(const MyWidget(text: 'Abdulaziz!'));
}

class MyWidget extends StatelessWidget {
  final String text;

  const MyWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My App',
        home: Scaffold(
            appBar: AppBar(
              title: const Text(
                'My App Bar',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.red,
              leading: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
              actions: const [
                Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                Icon(
                  Icons.notification_add,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            body: MainBody(text: text)));
  }
}
