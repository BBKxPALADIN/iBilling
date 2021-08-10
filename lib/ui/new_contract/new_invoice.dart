import 'package:flutter/material.dart';
import '../../components/components.dart';
import '../../theme/color.dart';

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
              const CustomTextField(title: 'Service Name'),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              const CustomTextField(title: 'Total Amount of Invoice'),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              const DropDownStatus(),
            ],
          ),
        ),
      ),
    );
  }
}
