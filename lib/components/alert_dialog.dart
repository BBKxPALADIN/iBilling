import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'const_classes.dart';
import '../theme/color.dart';
import '../theme/themes.dart';
import '../ui/screens.dart';

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
        'Что вы хотите создать?',
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
                Titles.labels[2]='New Contract';
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
                    'Contract',
                    style: BillingThemes.textTheme.bodyText1,
                  )
                ],
              ),
            ),
            // ignore: deprecated_member_use
            FlatButton(
              onPressed: () {
                Pages.pages[2]=const NewInvoice();
                Titles.labels[2]='New Invoice';
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
                    'Invoice',
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
