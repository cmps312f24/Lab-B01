import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qbanking_app/model/account.dart';
import 'package:qbanking_app/providers/account_provider.dart';

class AccountScreen extends ConsumerStatefulWidget {
  const AccountScreen({super.key});

  @override
  ConsumerState<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends ConsumerState<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    var accounts = ref.watch(accountNotifierProvider);
    // print(accounts);
    return ListView.builder(
      itemCount: accounts.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 3,
          child: ListTile(
            title: Text(accounts[index].accountNo),
            subtitle: Text(accounts[index].type),
            trailing: Text(accounts[index].balance.toString()),
            leading: IconButton(
                onPressed: () {
                  ref
                      .read(accountNotifierProvider.notifier)
                      .removeAccount(accounts[index]);
                },
                icon: const Icon(Icons.person)),
          ),
        );
      },
    );
  }
}
