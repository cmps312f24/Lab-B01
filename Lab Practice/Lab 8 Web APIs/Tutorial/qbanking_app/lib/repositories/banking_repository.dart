import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:qbanking_app/model/account.dart';
import 'package:qbanking_app/model/beneficiary.dart';
import 'package:qbanking_app/model/transfer.dart';

class BankingRepository {
  //create the Dio object and the base url
  final _dio = Dio();

  //create the base url _baseUrl
  final String _baseUrl = 'https://api1.codedbyyou.com/api';

//Add the getCustomerAccounts method
  /*
 HTML Statis code meaning
  200 OK - The request was successful.
  201 Created - The request was successful and a new resource was created.
  204 No Content - The request was successful but there is no content to send in the response.

  300 Requests
  301 Moved Permanently - The requested resource has been moved permanently.
  302 Found - The requested resource has been moved temporarily.
  304 Not Modified - The requested resource has not been modified.
  

  400 Bad Request - The request was unsuccessful due to a client error.
  401 Unauthorized - The request was unsuccessful because the client is not authorized to access the resource.
  403 Forbidden - The request was unsuccessful because the client does not have permission to access the resource.
  404 Not Found - The request was unsuccessful because the resource was not found.

  /500 Internal Server Error - The request was unsuccessful due to a server error.
  502 Bad Gateway - The request was unsuccessful because the server received an invalid response from an upstream server.
 */
  Future<List<Account>> getCustomerAccounts(int customerId) async {
    Response response = await _dio.get('$_baseUrl/accounts/$customerId');
    if (response.statusCode == 200) {
      List<Account> accounts = [];
      for (var map in response.data) {
        accounts.add(Account.fromJson(map));
      }
      return accounts;
    } else {
      throw Exception('Failed to load accounts');
    }
  }

// add the getTransfers method
  Future<List<Transfer>> getTransfers(int customerId) async {
    // read the json file
    Response response = await _dio.get('$_baseUrl/transfers/$customerId');
    if (response.statusCode == 200) {
      // convert the list of map to a list of account
      List<Transfer> transfers = [];
      for (var transferMap in response.data) {
        transfers.add(Transfer.fromJson(transferMap));
      }
      return transfers;
    } else {
      throw Exception('Failed to load transfers');
    }
  }

  //add the getBeneficiaries method
  Future<List<Beneficiary>> getBeneficiaries(int customerId) async {
    // read the json file
    String data = await rootBundle.loadString('assets/data/beneficiaries.json');
    // convert the json to a list of map
    var beneficiariesMap = jsonDecode(data);
    // convert the list of map to a list of account
    List<Beneficiary> beneficiaries = [];
    for (var beneficiaryMap in beneficiariesMap) {
      beneficiaries.add(Beneficiary.fromJson(beneficiaryMap));
    }
    return beneficiaries;
  }

  //add the addTransfer method
  Future<bool> addTransfer(Transfer transfer) async {
    return true;
  }

  Future<bool> removeTransfer(Transfer transfer) async {
    return true;
  }
}
