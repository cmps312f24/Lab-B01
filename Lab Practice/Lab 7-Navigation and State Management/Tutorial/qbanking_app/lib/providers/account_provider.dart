import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qbanking_app/model/account.dart';

class AccountNotifier extends Notifier<List<Account>> {
  @override
  List<Account> build() {
    initializeAccounts();
    return [];
  }

  void initializeAccounts() async {
    // read the json file
    String data = await rootBundle.loadString('assets/data/accounts.json');
    // convert the json to a list of map
    var accountsMap = jsonDecode(data);
    // convert the list of map to a list of account
    List<Account> accounts = [];
    for (var accountMap in accountsMap) {
      accounts.add(Account.fromJson(accountMap));
    }
    state = accounts;
  }

  void addAccount(Account account) {
    state = [...state, account];
  }
} // AccountNotifier

final accountNotifierProvider =
    NotifierProvider<AccountNotifier, List<Account>>(() => AccountNotifier());
