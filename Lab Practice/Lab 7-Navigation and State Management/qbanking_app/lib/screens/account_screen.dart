import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    final accounts = [];
    // print(accounts);
    return ListView.builder(
      itemCount: accounts.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 3,
          child: ListTile(
            title: Text(accounts[index].accountNo),
            subtitle: Text(accounts[index].type),
            trailing: GestureDetector(
                onTap: () {
                  accounts[index].balance += 100;
                  //TODO update account balance
                },
                child: Text(accounts[index].balance.toString())),
          ),
        );
      },
    );
  }
}
