import 'package:flutter/material.dart';

class ShellScreen extends StatefulWidget {
  final Widget? child;
  const ShellScreen({super.key, this.child});

  @override
  State<ShellScreen> createState() => _ShellScreenState();
}

class _ShellScreenState extends State<ShellScreen> {
  var title = "QBanking";

  @override
  Widget build(BuildContext context) {
    //get the name of the current route
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            letterSpacing: 1.5,
          ),
        ),
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
      ),
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        // set the current index
        currentIndex: 0,

        // make it active when selected
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Accounts',
          )
        ],
        onTap: (index) {
          if (index == 0) {
            // navigate to the home screen
            // change the title
          } else {
            // navigate to the home screen
            // change the title
          }
        },
      ),
    );
  }
}
