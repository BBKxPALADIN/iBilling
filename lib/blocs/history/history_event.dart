part of 'history_bloc.dart';

@immutable
abstract class HistoryEvent {}

class InitializeHistoryEvent extends HistoryEvent {}

class LoadHistoryContractsEvents extends HistoryEvent {
  final String initialDate;
  final String lastDate;

  LoadHistoryContractsEvents(this.initialDate, this.lastDate);
}
