import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import '../../theme/color.dart';

class BuildCalendar extends StatefulWidget {
  const BuildCalendar({Key key}) : super(key: key);

  @override
  _BuildCalendarState createState() => _BuildCalendarState();
}

class _BuildCalendarState extends State<BuildCalendar> {
  var pickedDate = DateTime.now();
  var _isActive = false;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 7,
      itemBuilder: (_, index) => buildCalendar(
          Jiffy(pickedDate.add(Duration(days: index)).toString()).format('E'),
          Jiffy(pickedDate.add(Duration(days: index)).toString()).format('dd'),
          MediaQuery.of(context).size.width * 0.015),
    );
  }

  Widget buildCalendar(String day, String date, double width) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isActive = !_isActive;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: _isActive ? BillingColor.lightGreenColor : Colors.transparent,
          borderRadius: const BorderRadius.all(Radius.circular(6)),
        ),
        margin: EdgeInsets.symmetric(horizontal: width),
        height: 72,
        width: 46,
        child: Column(
          children: [
            Text(day),
            const SizedBox(height: 7),
            Text(date),
            const SizedBox(height: 4),
            const Text('_'),
          ],
        ),
      ),
    );
  }
}
