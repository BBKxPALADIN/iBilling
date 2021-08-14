part of 'contracts_bloc.dart';

class LoadContracts extends ContractsEvent {}

class FilterContractsByDate extends ContractsEvent {
  final String pickedDateString;

  FilterContractsByDate(this.pickedDateString);
}

class AddNewContractEvent extends ContractsEvent {
  final Contract contract;

  AddNewContractEvent({this.contract});
}

class DeleteContractEvent extends ContractsEvent {
  final Contract contract;

  DeleteContractEvent({this.contract});
}

@immutable
abstract class ContractsEvent {}
