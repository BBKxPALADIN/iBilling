import 'package:flutter/material.dart';
import '../../components/components.dart';
import '../../theme/color.dart';
import 'package:easy_localization/easy_localization.dart';

class NewInvoice extends StatefulWidget {
  static const routeName = '/newInvoice';

  const NewInvoice({Key key}) : super(key: key);

  @override
  _NewInvoiceState createState() => _NewInvoiceState();
}

class _NewInvoiceState extends State<NewInvoice> {
  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return SingleChildScrollView(
      child: Container(
        color: BillingColor.darkWorld,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(title: 'service_name'.tr()),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              CustomTextField(title: 'amount_of_invoice'.tr()),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              const DropDownStatus(),
            ],
          ),
        ),
      ),
    );
  }
}
