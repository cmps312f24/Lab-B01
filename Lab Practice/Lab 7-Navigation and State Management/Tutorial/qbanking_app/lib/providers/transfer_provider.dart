// create the TransferProvider class
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qbanking_app/model/transfer.dart';

class TransferNotifier extends Notifier<List<Transfer>> {
  @override
  List<Transfer> build() {
    initializeTransfers();
    return [];
  }

  void initializeTransfers() async {
    // read the json file
    String data = await rootBundle.loadString('assets/data/transfers.json');
    // convert the json to a list of map
    var transfersMap = jsonDecode(data);
    // convert the list of map to a list of account

    for (var transferMap in transfersMap) {
      addTransfer(Transfer.fromJson(transferMap));
    }
  }

  void addTransfer(Transfer transfer) {
    state = [...state, transfer];
  }
}

final transferNotifierProvider =
    NotifierProvider<TransferNotifier, List<Transfer>>(
        () => TransferNotifier());
