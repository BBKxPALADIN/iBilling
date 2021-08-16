part of 'invoices_bloc.dart';


@immutable
abstract class InvoicesEvent {}

class LoadInvoices extends InvoicesEvent{}

class FilterInvoicesByDate extends InvoicesEvent{
  final String pickedDateString;
  FilterInvoicesByDate(this.pickedDateString);
}

class AddNewInvoiceEvent extends InvoicesEvent{
  final Invoice invoice;

  AddNewInvoiceEvent({this.invoice});
}