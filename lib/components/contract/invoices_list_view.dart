import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jiffy/jiffy.dart';
import '../../theme/color.dart';
import '../../models/contract.dart';
import '../../theme/themes.dart';
import '../const_classes.dart';
import 'package:easy_localization/easy_localization.dart';

class InvoicesListView extends StatelessWidget {
  final Invoice invoices;

  const InvoicesListView({
    Key key,
    this.invoices,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var status=invoices.invoiceStatus;

    Color statusBackClr;
    Color statusTextClr;
    if (status == 'Paid'||status=='paid') {
      statusBackClr = BillingColor.darkGreenColor;
      statusTextClr = BillingColor.lightGreenColor;
      status=Titles.statuses[0].tr();
    } else if (status == 'In process'||status == 'in_process') {
      statusBackClr = BillingColor.darkOrangeColor;
      statusTextClr = BillingColor.lightOrangeColor;
      status=Titles.statuses[1].tr();
    } else if (status == 'Rejected by IQ'||status == 'rejected_by_IQ') {
      statusBackClr = BillingColor.darkRedColor;
      statusTextClr = BillingColor.lightRedColor;
      status=Titles.statuses[2].tr();
    }else if (status == 'Rejected by Payme'||status == 'rejected_by_payme') {
      statusBackClr = BillingColor.darkRedColor;
      statusTextClr = BillingColor.lightRedColor;
      status=Titles.statuses[3].tr();
    }


    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: BillingColor.darkColor,
        ),
        height: 100,
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
                      status,
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
                    text: '${'service_name'.tr()}:   ',
                    children: [
                      TextSpan(
                        text: invoices.serviceName,
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
                        text: '${'amount_of_invoice'.tr()}:   ',
                        children: [
                          TextSpan(
                            text: '${invoices.amountOfInvoice}',
                            style: BillingThemes.textTheme.bodyText2,
                          )
                        ],
                      ),
                    ),
                    Text(
                      '${Jiffy(invoices.createdAt)
                          .format('dd.MM.yyyy')}',
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
