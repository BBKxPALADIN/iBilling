import 'dart:async';
import '../../models/contract.dart';
import 'package:bloc/bloc.dart';
import '../../api/mock_contracts_service.dart';
import 'package:meta/meta.dart';

part 'invoices_event.dart';

part 'invoices_state.dart';

class InvoicesBloc extends Bloc<InvoicesEvent, InvoicesState> {

  InvoicesBloc() : super(InvoicesInitialState());

  List<Invoice> mockData = [];
  String _date;
  List<Invoice> filteredInvoices = [];
  Invoice newInvoice;
  int isChanged=0;

  Future<void> getMockData() async {
   try{
     mockData = await MockContractsService().getInvoiceResponse();
   }catch(error){
     print(error);
     mockData=[];
   }
  }

  void set setNewInvoice(Invoice newInvoice){
    this.newInvoice=newInvoice;
  }

  Invoice get getNewInvoice{
    return newInvoice;
  }

  void set setData(String param) {
    _date = param;
  }

  String get getDate {
    return _date;
  }

  Future<void> fetchInvoicesByDate(DateTime dateTime) async {
    filteredInvoices = [];

    mockData.forEach((invoice) {
      try {
        final invoiceDate = DateTime.parse(invoice.createdAt);

        if (dateTime.day == invoiceDate.day &&
            dateTime.month == invoiceDate.month &&
            dateTime.year == invoiceDate.year) {
          filteredInvoices.add(invoice);
        }
      } catch (error) {
        filteredInvoices = [];
      }
    });
  }

  @override
  Stream<InvoicesState> mapEventToState(
      InvoicesEvent invoicesEvent,) async* {
    if (invoicesEvent is LoadInvoices) {
      yield LoadingInvoicesState();
      if(isChanged==0) {
        isChanged=1;
        await getMockData();
      }
      try {
        yield LoadedInvoicesState(invoices: mockData);
      } catch (error) {
        yield FailedToLoadInvoicesState(error: '$error');
      }
    }
    else if (invoicesEvent is FilterInvoicesByDate) {
      final filteringTime = DateTime.parse(
          FilterInvoicesByDate(getDate).pickedDateString);
      yield FilteringInvoicesByDate();
      await fetchInvoicesByDate(filteringTime);

      try {
        yield FilteredInvoicesByDate(filteredInvoices: filteredInvoices);
      } catch (error) {
        yield FailedToFilterInvoicesByDate(error: '$error');
      }
    }else if(invoicesEvent is AddNewInvoiceEvent){
      yield AddingNewInvoice();
      final newInvoice=AddNewInvoiceEvent(invoice: getNewInvoice).invoice;
      mockData.add(newInvoice);

      try{
        yield AddedNewInvoice(invoice: newInvoice);
      }catch(error){
        yield FailedToAddNewInvoice(error: error);
      }
    }
  }
}