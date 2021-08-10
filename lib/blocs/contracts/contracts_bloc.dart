import 'dart:async';

import '../../models/contract.dart';
import 'package:bloc/bloc.dart';
import '../../api/mock_contracts_service.dart';
import 'package:meta/meta.dart';

part 'contracts_event.dart';

part 'contracts_state.dart';

class ContractsBloc extends Bloc<ContractsEvent, ContractsState> {
  List<Contract> mockData = [];
  String _date;
  List<Contract> filteredContracts = [];

  Future<void> getMockData() async {
    mockData = await MockContractsService().getContractResponse();
  }

  void set setData(String param) {
    _date = param;
  }

  String get getDate {
    return _date;
  }

  Future<void> fetchContractsByDate(DateTime dateTime) async {
    filteredContracts = [];
    await getMockData();


    mockData.forEach((contract) {
      try {
        final contractDate = DateTime.parse(contract.createdAt);

        if (dateTime.day == contractDate.day &&
            dateTime.month == contractDate.month &&
            dateTime.year == contractDate.year) {
          filteredContracts.add(contract);
          filteredContracts.isEmpty;
        }
      } catch (error) {
        filteredContracts = [];
      }
    });
  }

  ContractsBloc() : super(ContractsInitialState());

  @override
  Stream<ContractsState> mapEventToState(
      ContractsEvent contractsEvent,) async* {
    if (contractsEvent is LoadContracts) {
      yield LoadingContractsState();
      await getMockData();
      try {
        yield LoadedContractsState(contracts: mockData);
      } catch (error) {
        yield FailedToLoadContractsState(error: '$error');
      }
    }
    else if (contractsEvent is FilterContractsByDate) {
      final filteringTime = DateTime.parse(
          FilterContractsByDate(getDate).pickedDateString);
      yield FilteringContractsByDate();
      await fetchContractsByDate(filteringTime);

      try {
        yield FilteredContractsByDate(filteredContracts: filteredContracts);
      } catch (error) {
        yield FailedToFilterContractsByDate(error: '$error');
      }
    }
  }
}