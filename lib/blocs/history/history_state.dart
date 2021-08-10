part of 'history_bloc.dart';

@immutable
abstract class HistoryState{}

class HistoryInitial extends HistoryState{}

class LoadingHistoryContractsState extends HistoryState{}

class LoadedHistoryContractsState extends HistoryState{
  final List<Contract> contracts;

  LoadedHistoryContractsState({this.contracts});
}

class FailedToLoadHistoryContractsState extends HistoryState{
  final Object error;

  FailedToLoadHistoryContractsState({this.error});
}

class DateNoProvidedState extends HistoryState{}