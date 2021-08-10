import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../components/components.dart';
import '../../theme/color.dart';
import '../../theme/themes.dart';

class DropDownStatus extends StatefulWidget {
  const DropDownStatus({
    Key key,
  }) : super(key: key);

  @override
  _DropDownStatusState createState() => _DropDownStatusState();
}

class _DropDownStatusState extends State<DropDownStatus> {
  final String title = 'Status of the invoice';
  String dropValue;
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return Column(
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
              alignLabelWithHint: true,
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
                Status.statuses.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      value,
                      style: BillingThemes.textTheme.bodyText2,
                      textAlign: TextAlign.center,
                    ),
                    isActiveRadio(dropValue == value),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget isActiveRadio(bool isActive) {
    return isActive
        ? SvgPicture.asset('assets/icons/radio_on.svg')
        : SvgPicture.asset('assets/icons/radio_off.svg');
  }
}
