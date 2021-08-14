import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../blocs/invoices/invoices_bloc.dart';
import '../../../blocs/contracts/contracts_bloc.dart';
import '../../../theme/color.dart';
import '../../../theme/themes.dart';
import 'package:jiffy/jiffy.dart';

import 'day_container.dart';

class CustomCalendar extends StatefulWidget {
  const CustomCalendar({Key key}) : super(key: key);

  @override
  _CustomCalendarState createState() => _CustomCalendarState();
}

DateTime changeWeekdayToMonday(DateTime pickedDate) {
  final weekday = pickedDate.weekday;
  print(pickedDate.weekday);
  if (weekday == 2) {
    return pickedDate.subtract(const Duration(days: 1));
  } else if (weekday == 3) {
    return pickedDate.subtract(const Duration(days: 2));
  } else if (weekday == 4) {
    return pickedDate.subtract(const Duration(days: 3));
  } else if (weekday == 5) {
    return pickedDate.subtract(const Duration(days: 4));
  } else if (weekday == 6) {
    return pickedDate.subtract(const Duration(days: 5));
  } else if (weekday == 7) {
    return pickedDate.subtract(const Duration(days: 6));
  } else {
    return pickedDate;
  }
}

class _CustomCalendarState extends State<CustomCalendar> {
  var pickedDate = changeWeekdayToMonday(DateTime.now());
  var _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraint) => Container(
        height: constraint.maxHeight,
        decoration: const BoxDecoration(
          color: BillingColor.darkColor,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: BillingColor.darkColor,
                blurRadius: 15.0,
                offset: Offset(0.0, 0.75))
          ],
        ),
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
                          _selectedIndex = -1;
                          pickedDate =
                              pickedDate.subtract(const Duration(days: 7));
                        });
                      },
                      icon: SvgPicture.asset('assets/icons/back.svg'),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _selectedIndex = -1;
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
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      final pickedIndexDay =
                          pickedDate.add(Duration(days: index));
                      final pickedIndexDate =
                          pickedDate.add(Duration(days: index));
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedIndex = index;
                          });
                          BlocProvider.of<ContractsBloc>(context).setData =
                              pickedIndexDay.toString();
                          BlocProvider.of<ContractsBloc>(context).add(
                              FilterContractsByDate(pickedIndexDay.toString()));
                          BlocProvider.of<InvoicesBloc>(context).setData =
                              pickedIndexDay.toString();
                          BlocProvider.of<InvoicesBloc>(context).add(
                              FilterInvoicesByDate(pickedIndexDay.toString()));
                        },
                        child: DayContainer(
                            isActive: _selectedIndex == index,
                            day: Jiffy(pickedIndexDay
                                    .toString())
                                .format('E'),
                            date: Jiffy(pickedIndexDate
                                    .toString())
                                .format('dd'),
                            width: MediaQuery.of(context).size.width * 0.027),
                      );
                    },
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