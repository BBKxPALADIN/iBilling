import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../api/mock_contracts_service.dart';
import '../../models/contract.dart';

part 'history_event.dart';

part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc() : super(HistoryInitial());

  String initialPeriod = '';
  String lastPeriod = '';
  List<Contract> mockData = [];
  List<Contract> historyContracts = [];

  void set setInitialPeriod(String initialPeriod) {
    this.initialPeriod = initialPeriod;
  }

  void set setLastPeriod(String lastPeriod) {
    this.lastPeriod = lastPeriod;
  }

  String get getInitialPeriod {
    return initialPeriod;
  }

  String get getLastPeriod {
    return lastPeriod;
  }

  // Fetch All Json data from sample.json file
  Future<void> fetchMockData() async {
    mockData = await MockContractsService().getContractResponse();
  }

// Apply logic to filter requested contracts out of mockData
  void filterHistoryContracts() {
    historyContracts = [];
    mockData.forEach((element) {
      final contractCreated = DateTime.parse(element.createdAt);
      if (contractCreated.isAfter(DateTime.parse(initialPeriod)) &&
          contractCreated.isBefore(DateTime.parse(lastPeriod))) {
        historyContracts.add(element);
      }
    });
  }

  @override
  Stream<HistoryState> mapEventToState(HistoryEvent event) async* {
    if (event is InitializeHistoryEvent) {
      yield HistoryInitial();
    }
    if (event is LoadHistoryContractsEvents) {
      if (!(initialPeriod == '' || lastPeriod == '')) {
        yield LoadingHistoryContractsState();
        await fetchMockData();
        filterHistoryContracts();
        try {
          yield LoadedHistoryContractsState(contracts: historyContracts);
        } catch (error) {
          yield FailedToLoadHistoryContractsState(error: '$error');
        }
      } else {
        yield DateNoProvidedState();
      }
    }
  }
}
