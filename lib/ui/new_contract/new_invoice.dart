import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jiffy/jiffy.dart';
import '../../blocs/invoices/invoices_bloc.dart';
import '../../models/contract.dart';
import '../../theme/themes.dart';
import '../../components/components.dart';
import '../../theme/color.dart';
import 'package:easy_localization/easy_localization.dart';

import '../home.dart';

class NewInvoice extends StatefulWidget {
  static const routeName = '/newInvoice';

  const NewInvoice({Key key}) : super(key: key);

  @override
  _NewInvoiceState createState() => _NewInvoiceState();
}

class _NewInvoiceState extends State<NewInvoice> {
  final String title = 'invoice_status'.tr();
  String dropValue;
  String invoiceStatus;
  TextEditingController serviceNameController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  final _keyForm = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    serviceNameController.dispose();
    amountController.dispose();
  }

  void _saveNewInvoice() {
    if (_keyForm.currentState.validate()) {
      _keyForm.currentState.save();
      BlocProvider.of<InvoicesBloc>(context, listen: false).setNewInvoice =
          Invoice(
        serviceName: serviceNameController.text,
        amountOfInvoice: int.parse(amountController.text),
        invoiceStatus: invoiceStatus.toString(),
        createdAt: Jiffy(DateTime.now()).format('yyyy-MM-dd hh:mm'),
      );
      serviceNameController.clear();
      amountController.clear();
      BlocProvider.of<InvoicesBloc>(context, listen: false).add(
          AddNewInvoiceEvent(
              invoice: BlocProvider.of<InvoicesBloc>(context, listen: false)
                  .getNewInvoice));
      BlocProvider.of<InvoicesBloc>(context).add(LoadInvoices());
      Navigator.of(context)
          .pushReplacementNamed(Home.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _keyForm,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Text(
                  'service_name'.tr(),
                  style: BillingThemes.textTheme.bodyText2,
                ),
              ),
              TextFormField(
                controller: serviceNameController,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == '') {
                    return 'Service Name field cannot be empty';
                  } else if (value.length < 5) {
                    return
                      'Service Name cannot include less than 6 characters!!!';
                  }
                  return null;
                },
                cursorColor: BillingColor.whiteColor,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      width: 1.7,
                      color: BillingColor.lightGreyColor,
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Text(
                  'amount'.tr(),
                  style: BillingThemes.textTheme.bodyText2,
                ),
              ),
              TextFormField(
                controller: amountController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == '') {
                    return 'Total Amount of Invocie field cannot be empty';
                  } else if (value.length < 5) {
                    return 'Amount cannot be less than 6 digits!!!';
                  }
                  return null;
                },
                cursorColor: BillingColor.whiteColor,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      width: 1.7,
                      color: BillingColor.lightGreyColor,
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: BillingThemes.textTheme.bodyText2,
                ),
              ),
              DropdownButtonFormField<String>(
                validator: (value) {
                  if (value == null) return 'Status field is empty!!!';
                  return null;
                },
                dropdownColor: BillingColor.darkColor,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      width: 1.7,
                      color: BillingColor.lightGreyColor,
                    ),
                  ),
                ),
                isExpanded: true,
                icon: SvgPicture.asset(
                  'assets/icons/drop_down.svg',
                  color: BillingColor.greyColor,
                ),
                value: invoiceStatus,
                onChanged: (newValue) {
                  setState(() {
                    invoiceStatus = newValue;
                  });
                },
                items: Titles.statuses
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          value.tr(),
                          style: BillingThemes.textTheme.bodyText2,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.065,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: BillingColor.lightGreenColor,
                ),
                child: MaterialButton(
                  onPressed: _saveNewInvoice,
                  child: BlocBuilder<InvoicesBloc, InvoicesState>(
                    builder: (_, state) {
                      if (state is InvoicesInitialState ||
                          state is LoadedInvoicesState ||
                          state is FilteredInvoicesByDate) {
                        return Text(
                          'save'.tr(),
                          style: BillingThemes.textTheme.bodyText1,
                        );
                      } else if (state is AddingNewInvoice) {
                        return const CircularProgressIndicator();
                      } else if (state is AddedNewInvoice) {
                        return Text(
                          'save'.tr(),
                          style: BillingThemes.textTheme.bodyText1,
                        );
                      } else if (state is FailedToAddNewInvoice) {
                        return Text('${state.error}');
                      }
                      return Container();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}