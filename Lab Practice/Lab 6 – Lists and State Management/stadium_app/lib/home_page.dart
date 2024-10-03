import 'package:flutter/material.dart';
import 'package:stadium_app/repo/stadium_repo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var showSearchBar = false;
  var _stadiums = [];
  var repo = StadiumRepo();

  @override
  void initState() {
    repo.getStadiums().then((stadiums) => {_stadiums = stadiums});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stadium App'),
        actions: [
          if (!showSearchBar)
            IconButton(
              onPressed: () {
                setState(() {
                  showSearchBar = !showSearchBar;
                });
              },
              icon: const Icon(Icons.search),
            ),
        ],
      ),
      body: Center(
          child: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(_stadiums[index].name),
                subtitle: Text(_stadiums[index].city),
                leading:
                    Image.asset('assets/images/${_stadiums[index].imageName}'),
                trailing: Text(_stadiums[index].status),
              );
            },
            itemCount: _stadiums.length,
          ))
        ],
      )),
    );
  }
}
