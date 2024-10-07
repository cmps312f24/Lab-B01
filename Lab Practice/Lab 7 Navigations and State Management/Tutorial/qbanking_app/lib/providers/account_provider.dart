import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qbanking_app/model/account.dart';

class AccountNotifier extends Notifier<List<Account>> {
  @override
  List<Account> build() {
    //initialize the data
    initializeState();
    return [];
  }

  void initializeState() async {
    List<Account> temp = [];
    var data = await rootBundle.loadString('assets/data/accounts.json');
    var accountsMap = jsonDecode(data);
    for (var account in accountsMap) {
      temp.add(Account.fromJson(account));
    }

    state = temp;
  }

  void addAccount(Account account) {
    state = [...state, account];
  }

  void removeAccount(Account account) {
    state = state.where((element) => element != account).toList();
  }

  void updateAccount(Account account) {
    state = state.map((e) => e == account ? account : e).toList();
  }
}

final accountNotifierProvider =
    NotifierProvider<AccountNotifier, List<Account>>(() => AccountNotifier());
