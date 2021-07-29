import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'build_calendar.dart';
import '../../theme/themes.dart';
import 'package:jiffy/jiffy.dart';

class CustomCalendar extends StatefulWidget {
  const CustomCalendar({Key key}) : super(key: key);

  @override
  _CustomCalendarState createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  var pickedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraint) => Container(
        color: const Color(0xff2A2A2D),
        height: constraint.maxHeight,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: Text(
                    '${Jiffy(pickedDate.toString()).format("MMMM, yyyy ")}',
                    style: BillingThemes.textTheme.headline1,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          pickedDate =
                              pickedDate.subtract(const Duration(days: 7));
                        });
                      },
                      icon: SvgPicture.asset('assets/icons/back.svg'),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          pickedDate = pickedDate.add(const Duration(days: 7));
                        });
                      },
                      icon: SvgPicture.asset('assets/icons/forward.svg'),
                    )
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: constraint.maxWidth,
                  height: constraint.maxHeight * 0.6,
                  alignment: Alignment.center,
                  child: const BuildCalendar(
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
