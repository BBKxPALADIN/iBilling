import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../theme/themes.dart';
import '../components/components.dart';
import '../theme/color.dart';
import '../blocs/contracts/contracts_bloc.dart';
import '../api/mock_contracts_service.dart';
import 'package:easy_localization/easy_localization.dart';

class Contracts extends StatefulWidget {
  static const routeName = '/contracts';

  const Contracts({Key key}) : super(key: key);

  @override
  _ContractsState createState() => _ContractsState();
}

class _ContractsState extends State<Contracts> {
  final mockService = MockContractsService().getContractResponse();
  bool _isContract = true;
  bool _isInvoice = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContractsBloc, ContractsState>(
      builder: (context, state) => Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: BillingColor.darkWorld,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.18,
              decoration: const BoxDecoration(
                color: BillingColor.darkerColor,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: BillingColor.darkColor,
                      blurRadius: 15.0,
                      offset: Offset(0.0, 0.75))
                ],
              ),
              child: const CustomCalendar(),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 12, top: 16, right: 12),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          MaterialButton(
                            onPressed: () {
                              setState(() {
                                _isContract = true;
                                _isInvoice = false;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: _isContract
                                    ? BillingColor.lightGreenColor
                                    : BillingColor.darkWorld,
                              ),
                              child: Text(
                                'contracts'.tr(),
                                style: BillingThemes.textTheme.headline5,
                              ),
                            ),
                          ),
                          MaterialButton(
                            onPressed: () {
                              setState(() {
                                _isContract = false;
                                _isInvoice = true;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: _isInvoice
                                    ? BillingColor.lightGreenColor
                                    : BillingColor.darkWorld,
                              ),
                              child: Text(
                                'invoice'.tr(),
                                style: BillingThemes.textTheme.headline5,
                              ),
                            ),
                          ),
                        ],
                      ),
                      InvoicesOrContracts(isContracts: _isContract),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
