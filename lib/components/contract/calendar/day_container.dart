import 'package:flutter/material.dart';
import '../../../theme/color.dart';

class DayContainer extends StatelessWidget {
  final isActive;
  final day;
  final date;
  final width;

  const DayContainer({
    Key key,
    this.isActive,
    this.day,
    this.date,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constrain) => Container(
              decoration: BoxDecoration(
                color: isActive
                    ? BillingColor.lightGreenColor
                    : Colors.transparent,
                borderRadius: const BorderRadius.all(Radius.circular(6)),
              ),
              margin: EdgeInsets.symmetric(horizontal: width),
              height: 72,
              width: 46,
              child: Column(
                children: [
                  SizedBox(height: constrain.maxHeight * 0.025),
                  Text(day),
                  SizedBox(height: constrain.maxHeight * 0.15),
                  Text(date),
                  SizedBox(height: constrain.maxHeight * 0.025),
                  const Text('_'),
                ],
              ),
            ));
  }
}
