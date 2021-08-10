import 'package:flutter/material.dart';
import '../../theme/color.dart';
import '../../theme/themes.dart';
import '../../ui/screens.dart';

class SaveButton extends StatefulWidget {
  final title;

  const SaveButton({Key key, this.title}) : super(key: key);

  @override
  _SaveButtonState createState() => _SaveButtonState();
}

class _SaveButtonState extends State<SaveButton> {
  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.065,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: BillingColor.lightGreenColor,
        ),
      child: MaterialButton(
        onPressed: () {
          Navigator.of(context).pushReplacementNamed(Home.routeName);
        },
        child: Text(
          widget.title,
          style: BillingThemes.textTheme.bodyText1,
        ),
      ),
    );
  }
}
