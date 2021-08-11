import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../theme/themes.dart';
import 'package:jiffy/jiffy.dart';
import '../blocs/history/history_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

class DateFilter extends StatelessWidget {
  const DateFilter({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final historyBloc = BlocProvider.of<HistoryBloc>(context, listen: false);

    String displayPickedDate(String time) {
      if (time == '1') {
        if (historyBloc.getInitialPeriod == '') return 'from'.tr();
        return Jiffy(historyBloc.getInitialPeriod).format('dd.MM.yyyy');
      } else if (time == '2') {
        if (historyBloc.getInitialPeriod == '') return 'to'.tr();
        return Jiffy(historyBloc.getLastPeriod).format('dd.MM.yyyy');
      } else
        return '';
    }

    return BlocBuilder<HistoryBloc, HistoryState>(builder: (context, state) {
      return LayoutBuilder(
        builder: (ctx, constraint) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: constraint.maxHeight * 0.15),
            Text(
              'date'.tr(),
              style: BillingThemes.textTheme.headline2,
            ),
            SizedBox(height: constraint.maxHeight * 0.15),
            // ignore: avoid_unnecessary_containers
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: constraint.maxHeight * 0.25,
                    width: constraint.maxWidth * 0.35,
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
                            displayPickedDate('1') == ''
                                ? 'from'.tr()
                                : '${displayPickedDate('1')}',
                            style: BillingThemes.textTheme.bodyText2,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        IconButton(
                          onPressed: () async {
                            final pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2001),
                              lastDate: DateTime(2222),
                            );
                            historyBloc.setInitialPeriod =
                                pickedDate.toString();
                            if (!(historyBloc.getInitialPeriod == '' ||
                                historyBloc.getLastPeriod == '')) {
                              historyBloc.add(LoadHistoryContractsEvents(
                                  historyBloc.getInitialPeriod,
                                  historyBloc.getLastPeriod));
                            }
                          },
                          icon: SvgPicture.asset('assets/icons/calendar.svg'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Text('--', style: TextStyle(fontSize: 18)),
                  const SizedBox(width: 12),
                  Container(
                    height: constraint.maxHeight * 0.25,
                    width: constraint.maxWidth * 0.35,
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
                            displayPickedDate('2') == ''
                                ? 'to'.tr()
                                : '${displayPickedDate('2')}',
                            style: BillingThemes.textTheme.bodyText2,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        IconButton(
                          onPressed: () async {
                            final pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2001),
                              lastDate: DateTime(2222),
                            );
                            historyBloc.setLastPeriod =
                                pickedDate.toString();
                            if (!(historyBloc.getInitialPeriod == '' ||
                                historyBloc.getLastPeriod == '')) {
                              historyBloc.add(LoadHistoryContractsEvents(
                                  historyBloc.getInitialPeriod,
                                  historyBloc.getLastPeriod));
                            }
                          },
                          icon: SvgPicture.asset('assets/icons/calendar.svg'),
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
      );
    });
  }
}
