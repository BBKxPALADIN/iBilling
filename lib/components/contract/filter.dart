import 'package:flutter/material.dart';
import '../components.dart';
import 'filter_checkbox.dart';
import '../../ui/screens.dart';
import '../../theme/themes.dart';
import '../../theme/color.dart';
import 'package:easy_localization/easy_localization.dart';

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
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.25),
          child: Text(
            'filters'.tr(),
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
                    'status'.tr(),
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
                          CheckBox(status: Titles.statuses[0].tr()),
                          CheckBox(status: Titles.statuses[1].tr()),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CheckBox(status: Titles.statuses[2].tr()),
                          CheckBox(status: Titles.statuses[3].tr()),
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
                      'cancel'.tr(),
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
                      'apply_filters'.tr(),
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
