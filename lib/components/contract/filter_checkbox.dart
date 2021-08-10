import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../theme/color.dart';
import '../../theme/themes.dart';

class CheckBox extends StatefulWidget {
  final String status;

  const CheckBox({Key key, this.status}) : super(key: key);

  @override
  _CheckBoxState createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
        });
      },
      child: Row(
        children: [
          _isSelected
              ? SvgPicture.asset('assets/icons/check-active.svg')
              : SvgPicture.asset('assets/icons/check-inactive.svg'),
          SizedBox(width: MediaQuery.of(context).size.width * 0.02),
          Text(
            widget.status,
            style: _isSelected
                ? BillingThemes.textTheme.headline6
                : BillingThemes.textTheme.headline2
                .copyWith(color: BillingColor.greyInactive),
          ),
        ],
      ),
    );
  }
}
