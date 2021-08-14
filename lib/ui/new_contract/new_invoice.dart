import 'package:flutter/material.dart';
import '../../theme/themes.dart';
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
    return Container(
      color: BillingColor.darkWorld,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Text(
                  'service_name'.tr(),
                  style: BillingThemes.textTheme.bodyText2,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
                child: TextFormField(
                  cursorColor: BillingColor.whiteColor,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        width: 1.7,
                        color: BillingColor.lightGreyColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        width: 1.7,
                        color: BillingColor.greyColor,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),

              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Text(
                  'amount'.tr(),
                  style: BillingThemes.textTheme.bodyText2,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
                child: TextFormField(
                  cursorColor: BillingColor.whiteColor,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        width: 1.7,
                        color: BillingColor.lightGreyColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        width: 1.7,
                        color: BillingColor.greyColor,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              const DropDownStatus(),
            ],
          ),
        ),
      ),
    );
  }
}
