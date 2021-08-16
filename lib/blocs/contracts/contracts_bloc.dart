import 'dart:async';

import '../../models/contract.dart';
import 'package:bloc/bloc.dart';
import '../../api/mock_contracts_service.dart';
import 'package:meta/meta.dart';

part 'contracts_event.dart';

part 'contracts_state.dart';

class ContractsBloc extends Bloc<ContractsEvent, ContractsState> {

  ContractsBloc() : super(ContractsInitialState());

  List<Contract> mockData = [];
  String _date;
  List<Contract> filteredContracts = [];
  Contract contractToDelete;
  Contract newContract;
  int isChanged=0;

  Future<void> getMockData() async {
    try{
      mockData = await MockContractsService().getContractResponse();
    }catch(error){
      print(error);
      mockData=[];
    }
  }

  void set setNewContract(Contract newContract) {
    this.newContract = newContract;
  }

  Contract get getNewContract {
    return newContract;
  }

  void set setData(String param) {
    _date = param;
  }

  String get getDate {
    return _date;
  }

  set setContractToDelete(Contract contractToDelete) {
    this.contractToDelete = contractToDelete;
  }

  Contract get getContractToDelete {
    return contractToDelete;
  }


  void deleteContractRequest() {
    final newList = <Contract>[];
    mockData.forEach((element) {
      if (element.createdAt != contractToDelete.createdAt)
        newList.add(element);
    });
    print(newList.length);
    mockData = newList;
  }

  Future<void> fetchContractsByDate(DateTime dateTime) async {
    filteredContracts = [];

    mockData.forEach((contract) {
      try {
        final contractDate = DateTime.parse(contract.createdAt);

        if (dateTime.day == contractDate.day &&
            dateTime.month == contractDate.month &&
            dateTime.year == contractDate.year) {
          filteredContracts.add(contract);
        }
      } catch (error) {
        filteredContracts = [];
      }
    });
  }


  @override
  Stream<ContractsState> mapEventToState(
    ContractsEvent contractsEvent,
  ) async* {
    if (contractsEvent is LoadContracts) {
      yield LoadingContractsState();
      if(isChanged==0) {
        isChanged=1;
        await getMockData();
      }
      try {
        yield LoadedContractsState(contracts: mockData);
      } catch (error) {
        yield FailedToLoadContractsState(error: '$error');
      }
    } else if (contractsEvent is FilterContractsByDate) {
      final filteringTime =
          DateTime.parse(FilterContractsByDate(getDate).pickedDateString);
      yield FilteringContractsByDate();
      await fetchContractsByDate(filteringTime);

      try {
        yield FilteredContractsByDate(filteredContracts: filteredContracts);
      } catch (error) {
        yield FailedToFilterContractsByDate(error: '$error');
      }
    } else if (contractsEvent is AddNewContractEvent) {
      yield AddingNewContract();
      final newContract =
          AddNewContractEvent(contract: getNewContract).contract;
      mockData.add(newContract);

      try{
        yield AddedNewContract(contract: newContract);
      }catch(error){
        yield FailedToAddNewContract(error: error);
      }
    } else if (contractsEvent is DeleteContractEvent) {
      yield DeletedContract();
      deleteContractRequest();
      try {
        yield DeletedContract(contract: contractToDelete);
      } catch (error) {
        yield FailedToDeleteContract(error: error);
      }
    }
  }
}
