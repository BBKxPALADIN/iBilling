part of 'invoices_bloc.dart';



class LoadInvoices extends InvoicesEvent{}

class FilterInvoicesByDate extends InvoicesEvent{
  final String pickedDateString;
  FilterInvoicesByDate(this.pickedDateString);
}

class AddNewInvoiceEvent extends InvoicesEvent{
  final Invoice invoice;

  AddNewInvoiceEvent({this.invoice});
}


@immutable
abstract class InvoicesEvent {}