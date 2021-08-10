part of 'contracts_bloc.dart';

@immutable
abstract class ContractsState {}

class ContractsInitialState extends ContractsState {}

class LoadingContractsState extends ContractsState {}

// Loading all contracts states
class LoadedContractsState extends ContractsState {
  final List<Contract> contracts;

  LoadedContractsState({this.contracts});
}

class FailedToLoadContractsState extends ContractsState {
  final String error;

  FailedToLoadContractsState({this.error});
}

// Filtering contracts by date states
class FilteringContractsByDate extends ContractsState {}

class FilteredContractsByDate extends ContractsState {
  final List<Contract> filteredContracts;

  FilteredContractsByDate({this.filteredContracts});
}

class FailedToFilterContractsByDate extends ContractsState {
  final String error;

  FailedToFilterContractsByDate({this.error});
}

// Adding new contract
class AddingNewContract extends ContractsState {}

class AddedNewContract extends ContractsState {
  final Contract contract;

  AddedNewContract({this.contract});
}

class FailedToAddNewContract extends ContractsState {
  final Object error;

  FailedToAddNewContract({this.error});
}
