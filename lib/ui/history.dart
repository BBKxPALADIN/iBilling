import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../blocs/history/history_bloc.dart';
import '../components/history_contracts.dart';
import '../components/components.dart';
import '../theme/color.dart';

class History extends StatefulWidget {
  const History({Key key}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 13),
          height: MediaQuery.of(context).size.height * 0.18,
          child: const DateFilter(),
        ),
        Expanded(
          child: BlocProvider.of<HistoryBloc>(context).historyContracts == []
              ? Expanded(
                  child: Center(
                    child: SvgPicture.asset('assets/icons/no_history.svg'),
                  ),
                )
              : const HistoryContracts(),
        ),
      ],
    );
  }
}
