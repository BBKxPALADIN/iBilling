import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/themes.dart';
import 'package:jiffy/jiffy.dart';

class History extends StatefulWidget {
  History({Key key}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  DateTime fromDate = DateTime.now();
  DateTime toDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 13),
            height: MediaQuery.of(context).size.height * 0.18,
            child: LayoutBuilder(
              builder: (ctx, constraint) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: constraint.maxHeight * 0.15),
                  Text(
                    'Date',
                    style: BillingThemes.textTheme.headline2,
                  ),
                  SizedBox(height: constraint.maxHeight * 0.15),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: constraint.maxHeight * 0.25,
                          width: constraint.maxWidth * 0.33,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0xff2A2A2D),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Text(
                                  fromDate.day == DateTime.now().day &&
                                      fromDate.month==DateTime.now().month &&
                                      fromDate.year==DateTime.now().year
                                      ? 'From'
                                      : '${Jiffy(fromDate.toString())
                                      .format("dd.MM.yyyy")}',
                                  style: BillingThemes.textTheme.bodyText2,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              IconButton(
                                onPressed: () async {
                                  final pickedDate =
                                      await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2001),
                                    lastDate: DateTime(2222),
                                  );

                                  setState(() {
                                    if (pickedDate != null) {
                                      fromDate = pickedDate;
                                    }
                                  });
                                },
                                icon: SvgPicture.asset(
                                    'assets/icons/calendar.svg'),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Text('--', style: TextStyle(fontSize: 18)),
                        const SizedBox(width: 12),
                        Container(
                          height: constraint.maxHeight * 0.25,
                          width: constraint.maxWidth * 0.33,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0xff2A2A2D),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Text(
                                  toDate.day == DateTime.now().day &&
                                      fromDate.month==DateTime.now().month &&
                                      fromDate.year==DateTime.now().year
                                      ? 'To'
                                      : '${Jiffy(toDate.toString())
                                      .format("dd.MM.yyyy")}',
                                  style: BillingThemes.textTheme.bodyText2,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              IconButton(
                                onPressed: () async {
                                  final pickedDate =
                                      await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2001),
                                    lastDate: DateTime(2222),
                                  );

                                  setState(() {
                                    if (pickedDate != null) {
                                      toDate = pickedDate;
                                    }
                                  });
                                },
                                icon: SvgPicture.asset(
                                    'assets/icons/calendar.svg'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: constraint.maxHeight * 0.15),
                ],
              ),
            ),
          ),
          // ignore: sized_box_for_whitespace
          Container(
            height: MediaQuery.of(context).size.height * 0.62,
            child: Center(
              child: SvgPicture.asset('assets/icons/no_contracts.svg'),
            ),
          ),
        ],
      ),
    );
  }
}
