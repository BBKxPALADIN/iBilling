import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../theme/themes.dart';
import '../../ui/screens.dart';
import '../../components/components.dart';
import '../../theme/color.dart';
import 'package:easy_localization/easy_localization.dart';

part '../../components/widgets_for_new/save_button.dart';

class NewContract extends StatefulWidget {
  static const routeName = '/newContract';

  const NewContract({Key key}) : super(key: key);

  @override
  _NewContractState createState() => _NewContractState();
}

class _NewContractState extends State<NewContract> {
  final _keyForm = GlobalKey<FormState>();
  bool autoValidate = false;
  final String title='entity'.tr();
  String dropValue;
  bool isActive=false;

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Form(
      key: _keyForm,
      // ignore: deprecated_member_use
      autovalidate: autoValidate,
      child: Container(
        padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
        color: BillingColor.darkWorld,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: BillingThemes.textTheme.bodyText2,
          ),
        ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: MediaQuery.of(context).size.height * 0.07,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 1.7,
                color: BillingColor.lightGreyColor,
              ),
            ),
            child: DropdownButtonFormField<String>(
              dropdownColor: BillingColor.darkColor,
              decoration: const InputDecoration(
                enabledBorder: InputBorder.none,
              ),
              isExpanded: true,
              icon: SvgPicture.asset(
                'assets/icons/drop_down.svg',
                color: BillingColor.greyColor,
              ),
              value: dropValue,
              onChanged: (newValue) {
                setState(() {
                  dropValue = newValue;
                  isActive = !isActive;
                });
              },
              items:
              Titles.entity.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        value.tr(),
                        style: BillingThemes.textTheme.bodyText2,
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Text(
                  'full_name'.tr(),
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
                  'address'.tr(),
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
                  'ITN'.tr(),
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
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              buildSaveButton(context, autoValidate),
            ],
          ),
        ),
      ),
    );
  }
}
