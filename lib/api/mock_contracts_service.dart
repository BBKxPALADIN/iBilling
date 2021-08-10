import 'package:flutter/services.dart';
import 'dart:convert';
import '../models/contract.dart';
import 'dart:async';

class MockContractsService {
  Future<List<Contract>> getContractResponse() async {
    final contracts = await _getContracts();
    return contracts;
  }

  Future<List<Invoice>> getInvoiceResponse() async {
    final invoices = await _getInvoices();
    return invoices;
  }

  Future<List<Invoice>> _getInvoices()async{
    final contractResponse=await getStringJson();
    return contractResponse.invoices;
  }

  Future<List<Contract>> _getContracts()async{
    final contractResponse=await getStringJson();
    return contractResponse.contracts;
  }

  Future<ContractResponse> getStringJson() async {

    await Future.delayed(const Duration(seconds: 2));
    final contractString =
        await loadAsset('assets/sample_data/sample.json');

    final jsonData = json.decode(contractString);

    final contracts = ContractResponse.fromJson(jsonData);
    return contracts;
  }

  Future<String> loadAsset(String path) async {
    return rootBundle.loadString(path);
  }
}
