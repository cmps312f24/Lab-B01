import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qbanking_app/model/beneficiary.dart';

class BeneficiaryNotifier extends Notifier<List<Beneficiary>> {
  @override
  List<Beneficiary> build() {
    initializeBeneficiaries();
    return [];
  }

  void initializeBeneficiaries() async {
    // read the json file
    String data = await rootBundle.loadString('assets/data/beneficiaries.json');
    // convert the json to a list of map
    var beneficiariesMap = jsonDecode(data);
    // convert the list of map to a list of account
    for (var beneficiaryMap in beneficiariesMap) {
      addBeneficiary(Beneficiary.fromJson(beneficiaryMap));
    }
  }

  void addBeneficiary(Beneficiary beneficiary) {
    state = [...state, beneficiary];
  }
}

// provider

final beneficiaryNotifierProvider =
    NotifierProvider<BeneficiaryNotifier, List<Beneficiary>>(
        () => BeneficiaryNotifier());
