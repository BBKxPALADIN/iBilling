import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/contracts/contracts_bloc.dart';
import 'package:jiffy/jiffy.dart';
import '../../theme/color.dart';
import '../../models/contract.dart';
import '../../theme/themes.dart';
import 'package:easy_localization/easy_localization.dart';

class DetailedContractsListView extends StatefulWidget {
  final Contract contract;

  const DetailedContractsListView({
    Key key,
    this.contract,
  }) : super(key: key);

  @override
  _DetailedContractsListViewState createState() =>
      _DetailedContractsListViewState();
}

class _DetailedContractsListViewState extends State<DetailedContractsListView> {

  String statusInDifLang(){
    final status=widget.contract.contractStatus;
    if(status=='Paid')
      return 'paid'.tr();
    else if(status=='In process')
      return 'in_process'.tr();
    else if(status=='Rejected by Payme')
      return 'rejected_by_payme'.tr();
    return 'rejected_by_IQ'.tr();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: SizedBox(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 17),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: BillingColor.darkColor,
              ),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: '${'full_name'.tr()}:   ',
                      children: [
                        TextSpan(
                          text: widget.contract.fullName,
                          style: BillingThemes.textTheme.bodyText2,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 7),
                  RichText(
                    text: TextSpan(
                      text: '${'status'.tr()}:   ',
                      children: [
                        TextSpan(
                          text: statusInDifLang(),
                          style: BillingThemes.textTheme.bodyText2,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 7),
                  RichText(
                    text: TextSpan(
                      text: '${'amount'.tr()}:   ',
                      children: [
                        TextSpan(
                          text: '${widget.contract.amount} UZS',
                          style: BillingThemes.textTheme.bodyText2,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 7),
                  RichText(
                    text: TextSpan(
                      text: '${'last_invoice'.tr()}:   ',
                      children: [
                        TextSpan(
                          text: '${widget.contract.lastInvoice}',
                          style: BillingThemes.textTheme.bodyText2,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 7),
                  RichText(
                    text: TextSpan(
                      text: '${'number_of_invoice'.tr()}:   ',
                      children: [
                        TextSpan(
                          text: '${widget.contract.invoiceAmount}',
                          style: BillingThemes.textTheme.bodyText2,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 7),
                  RichText(
                    text: TextSpan(
                      text: '${'address'.tr()}:   ',
                      children: [
                        TextSpan(
                          text: '${widget.contract.address}',
                          style: BillingThemes.textTheme.bodyText2,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 7),
                  RichText(
                    text: TextSpan(
                      text: '${'ITN'.tr()}:   ',
                      children: [
                        TextSpan(
                          text: '${widget.contract.organizationItn}',
                          style: BillingThemes.textTheme.bodyText2,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 7),
                  RichText(
                    text: TextSpan(
                      text: '${'created_at'.tr()}:   ',
                      children: [
                        TextSpan(
                          text: Jiffy(widget.contract.createdAt)
                              .format('H:mm, d MMMM yyyy')
                              .toString(),
                          style: BillingThemes.textTheme.bodyText2,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: BillingColor.darkRedColor.withOpacity(0.23),
              ),
              child: MaterialButton(
                onPressed: () {
                  BlocProvider.of<ContractsBloc>(context, listen: false)
                      .setContractToDelete = widget.contract;
                  BlocProvider.of<ContractsBloc>(context, listen: false)
                      .deleteContractRequest();
                  BlocProvider.of<ContractsBloc>(context, listen: false)
                      .add(LoadContracts());
                },
                child: Text(
                  'delete'.tr(),
                  style: BillingThemes.textTheme.headline2
                      .copyWith(color: BillingColor.lightRedColor),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
