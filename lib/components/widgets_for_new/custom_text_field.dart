import 'package:flutter/material.dart';
import '../../theme/color.dart';
import '../../theme/themes.dart';

class CustomTextField extends StatelessWidget {
  final String title;

  const CustomTextField({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Text(
              title,
              style: BillingThemes.textTheme.bodyText2,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.07,
            child: TextField(
              cursorColor: BillingColor.lightGreenColor,
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
        ],
      ),
    );
  }
}
