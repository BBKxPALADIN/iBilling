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
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, top: 12),
      child: Container(
        padding: const EdgeInsets.all(12),
        color: BillingColor.darkColor,
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
                      style: BillingThemes.textTheme.headline2,
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: BillingColor.lightGreenColor,
                  ),
                  child: Text(contract.contractStatus),
                )
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Fish:  ${contract.fullName}'),
                const SizedBox(height: 7),
                Text('Amount:  ${contract.amount} UZS'),
                const SizedBox(height: 7),
                Text('Last Invoice:  № ${contract.lastInvoice}'),
                const SizedBox(height: 7),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Number of Invoice:  ${contract.invoiceAmount}'),
                    Text(contract.createdAt),
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
