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
    Response response = await _dio.get('$_baseUrl/beneficiaries/$customerId');
    if (response.statusCode != 200) {
      throw Exception('Failed to load beneficiaries');
    }
    // convert the list of map to a list of account
    List<Beneficiary> beneficiaries = [];
    for (var beneficiaryMap in response.data) {
      beneficiaries.add(Beneficiary.fromJson(beneficiaryMap));
    }
    return beneficiaries;
  }

  //add the addTransfer method
  Future<Transfer> addTransfer(Transfer transfer) async {
    var url = '$_baseUrl/transfers/${transfer.cid}';
    Response response = await _dio.post(url, data: jsonEncode(transfer));
    if (response.statusCode != 201) {
      throw Exception('Failed to add transfer');
    }
    return Transfer.fromJson(response.data);
  }

  Future<bool> removeTransfer(Transfer transfer) async {
    Response response = await _dio
        .delete('$_baseUrl/transfers/${transfer.cid}/${transfer.transferId}');
    if (response.statusCode != 200) {
      throw Exception('Failed to remove transfer');
    }
    return true;
  }

  Future<Beneficiary> updateBeneficiary(Beneficiary beneficiary) async {
    var url =
        '$_baseUrl/beneficiaries/${beneficiary.cid}/${beneficiary.accountNo}';

    Response response = await _dio.put(url, data: jsonEncode(beneficiary));
    if (response.statusCode != 200) {
      throw Exception('Failed to update beneficiary');
    }
    return Beneficiary.fromJson(response.data);
  }

  Future<Beneficiary> addBeneficiary(Beneficiary beneficiary) async {
    var url = '$_baseUrl/beneficiaries/${beneficiary.cid}';

    Response response = await _dio.post(url, data: jsonEncode(beneficiary));
    if (response.statusCode != 201) {
      throw Exception('Failed to update beneficiary');
    }
    return Beneficiary.fromJson(response.data);
  }
}
