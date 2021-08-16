import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'detailed_contract.dart';
import '../../blocs/invoices/invoices_bloc.dart';
import '../../blocs/contracts/contracts_bloc.dart';
import '../components.dart';

class InvoicesOrContracts extends StatefulWidget {
  final bool isContracts;

  const InvoicesOrContracts({Key key, this.isContracts}) : super(key: key);

  @override
  _InvoicesOrContractsState createState() => _InvoicesOrContractsState();
}

class _InvoicesOrContractsState extends State<InvoicesOrContracts> {
  bool detailed = false;
  var chosenIndex;
  String createdAt;

  @override
  Widget build(BuildContext context) {
    if (widget.isContracts) {
      return BlocBuilder<ContractsBloc, ContractsState>(
        builder: (ctx, state) {
          if (state is LoadingContractsState ||
              state is ContractsInitialState ||
              state is FilteringContractsByDate) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LoadedContractsState ||
              state is FilteredContractsByDate) {
            if (state is FilteredContractsByDate &&
                state.filteredContracts.isEmpty) {
              return Center(
                child: SvgPicture.asset('assets/icons/no_contracts.svg'),
              );
            }
            if (state is LoadedContractsState)
              return ListView.builder(
                itemCount: state.contracts.length,
                itemBuilder: (_, index) {
                  return GestureDetector(
                    onLongPress: () {
                      createdAt = state.contracts[index].createdAt.toString();
                      detailed = !detailed;
                      chosenIndex = index;
                      setState(() {});
                    },
                    onDoubleTap: () {
                      detailed = false;
                      setState(() {});
                    },
                    child: detailed &&
                            chosenIndex == index &&
                            createdAt ==
                                state.contracts[index].createdAt.toString()
                        ? DetailedContractsListView(
                            contract: state.contracts[chosenIndex],
                          )
                        : ContractsListView(
                            contract: state.contracts[index],
                          ),
                  );
                },
              );
            else if (state is FilteredContractsByDate) {
              return ListView.builder(
                itemCount: state.filteredContracts.length,
                itemBuilder: (_, index) {
                  return GestureDetector(
                    onLongPress: () {
                      createdAt =
                          state.filteredContracts[index].createdAt.toString();
                      detailed = !detailed;
                      chosenIndex = index;
                      setState(() {});
                    },
                    onDoubleTap: () {
                      detailed = false;
                      setState(() {});
                    },
                    child: detailed &&
                            chosenIndex == index &&
                            createdAt ==
                                state.filteredContracts[index].createdAt
                                    .toString()
                        ? DetailedContractsListView(
                            contract: state.filteredContracts[chosenIndex],
                          )
                        : ContractsListView(
                            contract: state.filteredContracts[index],
                          ),
                  );
                },
              );
            }
          } else if (state is FailedToFilterContractsByDate ||
              state is FailedToLoadContractsState) {
            return Center(
              child: Text(
                state is FailedToLoadContractsState
                    ? '${state.error}'
                    : state is FailedToFilterContractsByDate
                        ? '${state.error}'
                        : 'An Internal Error Occurred!',
                textAlign: TextAlign.center,
              ),
            );
          }
          return Container();
        },
      );
    } else {
      return BlocBuilder<InvoicesBloc, InvoicesState>(
        builder: (ctx, state) {
          if (state is LoadingInvoicesState ||
              state is InvoicesInitialState ||
              state is FilteringInvoicesByDate) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LoadedInvoicesState ||
              state is FilteredInvoicesByDate) {
            if (state is FilteredInvoicesByDate &&
                state.filteredInvoices.isEmpty) {
              return Center(
                child: SvgPicture.asset('assets/icons/no_contracts.svg'),
              );
            }
            return Padding(
              padding: const EdgeInsets.only(left: 8, top: 5, right: 8),
              child: Column(
                children: [
                  if (state is LoadedInvoicesState)
                    ...state.invoices
                        .map((e) => InvoicesListView(invoices: e))
                        .toList()
                  else if (state is FilteredInvoicesByDate)
                    ...state.filteredInvoices
                        .map((e) => InvoicesListView(invoices: e))
                        .toList()
                ],
              ),
            );
          } else if (state is FailedToFilterInvoicesByDate ||
              state is FailedToLoadInvoicesState) {
            return Center(
              child: Text(
                state is FailedToLoadInvoicesState
                    ? '${state.error}'
                    : state is FailedToFilterInvoicesByDate
                        ? '${state.error}'
                        : 'An Internal Error Occurred!',
                textAlign: TextAlign.center,
              ),
            );
          }
          return Container();
        },
      );
    }
  }
}
