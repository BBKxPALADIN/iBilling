part of 'invoices_bloc.dart';

@immutable
abstract class InvoicesState {}

class InvoicesInitialState extends InvoicesState {}

class LoadingInvoicesState extends InvoicesState {}


class LoadedInvoicesState extends InvoicesState {
  final List<Invoice> invoices;

  LoadedInvoicesState({this.invoices});
}

class FailedToLoadInvoicesState extends InvoicesState {
  final String error;

  FailedToLoadInvoicesState({this.error});
}

// Filtering contracts by date states
class FilteringInvoicesByDate extends InvoicesState {}

class FilteredInvoicesByDate extends InvoicesState {
  final List<Invoice> filteredInvoices;

  FilteredInvoicesByDate({this.filteredInvoices});
}

class FailedToFilterInvoicesByDate extends InvoicesState {
  final String error;

  FailedToFilterInvoicesByDate({this.error});
}

// Adding new contract
class AddingNewInvoice extends InvoicesState {}

class AddedNewInvoice extends InvoicesState {
  final Invoice invoice;

  AddedNewInvoice({this.invoice});
}

class FailedToAddNewInvoice extends InvoicesState {
  final Object error;

  FailedToAddNewInvoice({this.error});
}
