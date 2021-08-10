import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../theme/color.dart';
import '../../models/contract.dart';
import '../../theme/themes.dart';

class InvoicesListView extends StatelessWidget {
  final Invoice invoice;

  const InvoicesListView({
    Key key,
    this.invoice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color statusBackClr;
    Color statusTextClr;
    if (invoice.invoiceStatus == 'Paid') {
      statusBackClr = BillingColor.darkGreenColor;
      statusTextClr = BillingColor.lightGreenColor;
    } else if (invoice.invoiceStatus == 'In process') {
      statusBackClr = BillingColor.darkOrangeColor;
      statusTextClr = BillingColor.lightOrangeColor;
    } else if (invoice.invoiceStatus == 'Rejected by Payme' ||
        invoice.invoiceStatus == 'Rejected by IQ') {
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
                      invoice.invoiceStatus,
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
                    text: 'Service Name:   ',
                    children: [
                      TextSpan(
                        text: invoice.serviceName,
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
                        text: 'Total amount of Invoice:   ',
                        children: [
                          TextSpan(
                            text: '${invoice.amountOfInvoice}',
                            style: BillingThemes.textTheme.bodyText2,
                          )
                        ],
                      ),
                    ),
                    Text(
                      invoice.createdAt,
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
