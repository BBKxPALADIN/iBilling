import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../theme/color.dart';
import '../../models/contract.dart';
import '../../theme/themes.dart';

class ContractsListView extends StatelessWidget {
  final Contract contract;

  const ContractsListView({
    Key key,
    this.contract,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color statusBackClr;
    Color statusTextClr;
    if (contract.contractStatus == 'Paid') {
      statusBackClr = BillingColor.darkGreenColor;
      statusTextClr = BillingColor.lightGreenColor;
    } else if (contract.contractStatus == 'In process') {
      statusBackClr = BillingColor.darkOrangeColor;
      statusTextClr = BillingColor.lightOrangeColor;
    } else if (contract.contractStatus == 'Rejected by Payme' ||
        contract.contractStatus == 'Rejected by IQ') {
      statusBackClr = BillingColor.darkRedColor;
      statusTextClr = BillingColor.lightRedColor;
    }

    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: BillingColor.darkColor,
        ),
        height: 150,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/paper.svg'),
                    const SizedBox(width: 9),
                    Text(
                      '№ 156',
                      style: BillingThemes.textTheme.headline2
                          .copyWith(color: Colors.white),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: statusBackClr,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 3, bottom: 3, left: 10, right: 10),
                    child: Text(
                      contract.contractStatus,
                      style: BillingThemes.textTheme.headline6.copyWith(
                        color: statusTextClr,
                        fontSize: 12,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Fish:   ',
                    children: [
                      TextSpan(
                        text: contract.fullName,
                        style: BillingThemes.textTheme.bodyText2,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 7),
                RichText(
                  text: TextSpan(
                    text: 'Amount:   ',
                    children: [
                      TextSpan(
                        text: '${contract.amount} UZS',
                        style: BillingThemes.textTheme.bodyText2,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 7),
                RichText(
                  text: TextSpan(
                    text: 'Last Invoice:   ',
                    children: [
                      TextSpan(
                        text: '№ ${contract.lastInvoice}',
                        style: BillingThemes.textTheme.bodyText2,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 7),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Number of Invoice:   ',
                        children: [
                          TextSpan(
                            text: '${contract.invoiceAmount}',
                            style: BillingThemes.textTheme.bodyText2,
                          )
                        ],
                      ),
                    ),
                    Text(
                      contract.createdAt,
                      style: BillingThemes.textTheme.headline2,
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
