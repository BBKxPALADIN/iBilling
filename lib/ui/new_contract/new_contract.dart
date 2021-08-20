import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jiffy/jiffy.dart';
import '../../blocs/contracts/contracts_bloc.dart';
import '../../models/contract.dart';
import '../../theme/themes.dart';
import '../../components/components.dart';
import '../../theme/color.dart';
import 'package:easy_localization/easy_localization.dart';

import '../home.dart';

class NewContract extends StatefulWidget {
  static const routeName = '/newContract';

  const NewContract({Key key}) : super(key: key);

  @override
  _NewContractState createState() => _NewContractState();
}

class _NewContractState extends State<NewContract> {
  final _keyForm = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController tinController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController invoiceAmountController = TextEditingController();
  TextEditingController lastInvoiceController = TextEditingController();

  String entityValue;
  String statusValue;

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    tinController.dispose();
    addressController.dispose();
    amountController.dispose();
    invoiceAmountController.dispose();
    lastInvoiceController.dispose();
  }

  void _saveNewContract() {
    if (_keyForm.currentState.validate()) {
      _keyForm.currentState.save();
      BlocProvider.of<ContractsBloc>(context, listen: false).setNewContract =
          Contract(
        fullName: nameController.text,
        contractStatus: statusValue.toString(),
        amount: int.parse(amountController.text),
        address: addressController.text,
        createdAt: Jiffy(DateTime.now()).format('yyyy-MM-dd hh:mm'),
        organizationItn: int.parse(tinController.text),
        invoiceAmount: int.parse(invoiceAmountController.text),
        lastInvoice: int.parse(lastInvoiceController.text),
      );
      nameController.clear();
      addressController.clear();
      tinController.clear();
      amountController.clear();
      invoiceAmountController.clear();
      lastInvoiceController.clear();

      BlocProvider.of<ContractsBloc>(context, listen: false).add(
          AddNewContractEvent(
              contract: BlocProvider.of<ContractsBloc>(context, listen: false)
                  .getNewContract));
      BlocProvider.of<ContractsBloc>(context).add(LoadContracts());
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
                  'entity'.tr(),
                  textAlign: TextAlign.center,
                  style: BillingThemes.textTheme.bodyText2,
                ),
              ),
              DropdownButtonFormField<String>(
                validator: (value) {
                  if (value == null) return 'Entity field is empty!!!';
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
                value: entityValue,
                onChanged: (newValue) {
                  setState(() {
                    entityValue = newValue;
                  });
                },
                items: Titles.entity
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value.tr(),
                      style: BillingThemes.textTheme.bodyText2,
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Text(
                  'full_name'.tr(),
                  style: BillingThemes.textTheme.bodyText2,
                ),
              ),
              TextFormField(
                controller: nameController,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == '') {
                    return 'Please write your full name';
                  } else if (value.length < 5) {
                    return 'Full Name be less than 6 characters!!!';
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
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Text(
                  'address'.tr(),
                  style: BillingThemes.textTheme.bodyText2,
                ),
              ),
              TextFormField(
                controller: addressController,
                validator: (value) {
                  if (value == '') {
                    return 'Address field cannot be empty';
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
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Text(
                  'ITN'.tr(),
                  style: BillingThemes.textTheme.bodyText2,
                ),
              ),
              TextFormField(
                controller: tinController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == '') {
                    return 'TIN/ITN field cannot be empty';
                  } else if (value.length != 10) {
                    return 'TIN/ITN number should consist of 10 digits!!!';
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
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Text(
                  'status'.tr(),
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
                value: statusValue,
                onChanged: (newValue) {
                  setState(() {
                    statusValue = newValue;
                  });
                },
                items: Titles.statuses
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value.tr(),
                      style: BillingThemes.textTheme.bodyText2,
                      textAlign: TextAlign.center,
                    ),
                  );
                }).toList(),
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
                    return 'Total Amount of Contract field cannot be empty';
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
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Text(
                  'number_of_invoice'.tr(),
                  style: BillingThemes.textTheme.bodyText2,
                ),
              ),
              TextFormField(
                controller: invoiceAmountController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == '') {
                    return 'Number of invoice field cannot be empty';
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
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Text(
                  'last_invoice'.tr(),
                  style: BillingThemes.textTheme.bodyText2,
                ),
              ),
              TextFormField(
                controller: lastInvoiceController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == '') {
                    return 'Last Invoice field cannot be empty';
                  } else if (value.length != 3) {
                    return 'Last invoice number should consist of 3 digits!!!';
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
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.065,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: BillingColor.lightGreenColor,
                ),
                child: MaterialButton(
                  onPressed: _saveNewContract,
                  child: BlocBuilder<ContractsBloc, ContractsState>(
                    builder: (_, state) {
                      if (state is ContractsInitialState ||
                          state is LoadedContractsState ||
                          state is FilteredContractsByDate) {
                        return Text(
                          'save'.tr(),
                          style: BillingThemes.textTheme.bodyText1,
                        );
                      } else if (state is AddingNewContract) {
                        return const CircularProgressIndicator();
                      } else if (state is AddedNewContract) {
                        return Text(
                          'save'.tr(),
                          style: BillingThemes.textTheme.bodyText1,
                        );
                      } else if (state is FailedToLoadContractsState) {
                        return Text('${state.error}');
                      }
                      return const Text('Nothing');
                    },
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}
