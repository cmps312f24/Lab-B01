import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var counter = 10;
  var byHowMuch = 0;

  @override
  Widget build(BuildContext context) {
    print('I am being redrawn');
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            onChanged: (value) {
              byHowMuch = int.parse(value);
            },
            decoration: const InputDecoration(border: OutlineInputBorder()),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
              child: Text(
            'Counter : $counter',
            style: const TextStyle(fontSize: 30),
          )),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                counter += byHowMuch;
              });
            },
            child: const Text(
              'Increment Value',
            ),
          )
        ],
      ),
    ));
  }
}
