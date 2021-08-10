import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'components.dart';
import '../blocs/history/history_bloc.dart';

class HistoryContracts extends StatelessWidget {
  const HistoryContracts({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryBloc, HistoryState>(builder: (context, state) {
      if (state is LoadingHistoryContractsState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is LoadedHistoryContractsState) {
        if (state is LoadedHistoryContractsState && state.contracts.isEmpty) {
          return Expanded(
              child: Center(
            child: SvgPicture.asset('assets/icons/no_contracts'),
          ));
        }
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                if (state is LoadedHistoryContractsState)
                  ...state.contracts
                      .map(
                        (contract) => Column(
                          children: [
                            ContractsListView(
                              contract: contract,
                            )
                          ],
                        ),
                      )
                      .toList()
              ],
            ),
          ),
        );
      } else if (state is FailedToLoadHistoryContractsState) {
        return Center(
          child: Text(
            '${state.error}',
            textAlign: TextAlign.center,
          ),
        );
      }
      if (state is HistoryInitial) {
        return Container();
      }
      return Expanded(
          child: Center(
            child: SvgPicture.asset('assets/icons/no_contracts'),
          ),);
    });
  }
}
