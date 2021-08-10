import 'package:flutter/material.dart';
import '../components.dart';
import 'filter_checkbox.dart';
import '../../ui/screens.dart';
import '../../theme/themes.dart';
import '../../theme/color.dart';

class FilterPage extends StatefulWidget {
  static const routeName = '/filter';

  const FilterPage({Key key}) : super(key: key);

  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BillingColor.darkWorld,
      appBar: AppBar(
        backgroundColor: BillingColor.darkestColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(Home.routeName);
          },
        ),
        title: Padding(
          padding:
              EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.26),
          child: Text(
            'Filters',
            style: BillingThemes.textTheme.headline1
                .copyWith(color: BillingColor.whiteColor),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 28),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // ignore: sized_box_for_whitespace
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Text(
                    'Status',
                    style: BillingThemes.textTheme.headline2,
                  ),
                ),
                // ignore: sized_box_for_whitespace
                Container(
                  height: MediaQuery.of(context).size.height * 0.11,
                  padding: const EdgeInsets.only(bottom: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CheckBox(status: Status.statuses[0]),
                          CheckBox(status: Status.statuses[1]),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CheckBox(status: Status.statuses[2]),
                          CheckBox(status: Status.statuses[3]),
                        ],
                      ),
                    ],
                  ),
                ),
                // ignore: sized_box_for_whitespace
                Container(
                  height: MediaQuery.of(context).size.height * 0.18,
                  child: const DateFilter(),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: BillingColor.darkGreenColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.44,
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(Home.routeName);
                    },
                    child: Text(
                      'Cancel',
                      style: BillingThemes.textTheme.headline2.copyWith(
                        color: BillingColor.lightGreenColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: BillingColor.lightGreenColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.44,
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(Home.routeName);
                    },
                    child: Text(
                      'Apply filters',
                      style: BillingThemes.textTheme.headline2.copyWith(
                        color: BillingColor.whiteColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
