import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  var theValue = 100;
  final _textFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          controller: _textFieldController,
        ),
        Text(
          'value is  $theValue',
          style: const TextStyle(fontSize: 40),
        ),
        ElevatedButton(
            onPressed: () {
              setState(() {
                theValue = int.parse(_textFieldController.text);
              });
            },
            child: const Text('Show Value'))
      ],
    ));
  }
}
