import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'const_classes.dart';
import '../theme/color.dart';
import '../theme/themes.dart';
import '../ui/screens.dart';
import 'package:easy_localization/easy_localization.dart';

// ignore: must_be_immutable
class TypeOfContract extends StatefulWidget {

  const TypeOfContract({Key key,})
      : super(key: key);

  @override
  _TypeOfContractState createState() => _TypeOfContractState();
}

class _TypeOfContractState extends State<TypeOfContract> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'what_dou_you_wanna_create'.tr(),
        style: BillingThemes.textTheme.headline5,
        textAlign: TextAlign.center,
      ),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ignore: deprecated_member_use
            FlatButton(
              onPressed: () {
                Pages.pages[2]=const NewContract();
                Titles.labels[2]='new_contract'.tr();
                Navigator.of(context).pop();
              },
              color: BillingColor.lightGreyColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/icons/new_contract.svg'),
                  const SizedBox(width: 16),
                  Text(
                    'new_contract'.tr(),
                    style: BillingThemes.textTheme.bodyText1,
                  )
                ],
              ),
            ),
            // ignore: deprecated_member_use
            FlatButton(
              onPressed: () {
                Pages.pages[2]=const NewInvoice();
                Titles.labels[2]='new_invoice'.tr();
                Navigator.of(context).pop();
              },
              color: BillingColor.lightGreyColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: 3),
                  SvgPicture.asset('assets/icons/new_invoice.svg'),
                  const SizedBox(width: 16),
                  Text(
                    'new_invoice'.tr(),
                    style: BillingThemes.textTheme.bodyText1,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
