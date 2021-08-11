import 'package:flutter/material.dart';
import '../../components/widgets_for_new/save_button.dart';
import '../../components/components.dart';
import '../../theme/color.dart';
import 'package:easy_localization/easy_localization.dart';

class NewContract extends StatefulWidget {
  static const routeName = '/newContract';

  const NewContract({Key key}) : super(key: key);

  @override
  _NewContractState createState() => _NewContractState();
}

class _NewContractState extends State<NewContract> {
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
              const DropDownEntity(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              CustomTextField(title: 'full_name'.tr()),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              CustomTextField(title: 'address'.tr()),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              CustomTextField(title: 'ITN'.tr()),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              const DropDownStatus(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
               SaveButton(title: 'save'.tr()),
            ],
          ),
        ),
      ),
    );
  }
}
