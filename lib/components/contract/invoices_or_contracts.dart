import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'detailed_contract.dart';
import '../../blocs/invoices/invoices_bloc.dart';
import '../../blocs/contracts/contracts_bloc.dart';
import '../components.dart';

class InvoicesOrContracts extends StatefulWidget {
  final isContracts;

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
        builder: (context, state) {
          if (state is LoadingContractsState ||
              state is ContractsInitialState ||
              state is FilteringContractsByDate) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LoadedContractsState ||
              state is FilteredContractsByDate) {
            if (state is FilteredContractsByDate &&
                state.filteredContracts.isEmpty) {
              return Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.15),
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
        builder: (context, state) {
          if (state is LoadingInvoicesState ||
              state is InvoicesInitialState ||
              state is FilteringInvoicesByDate) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LoadedInvoicesState ||
              state is FilteredInvoicesByDate) {
            if (state is FilteredInvoicesByDate &&
                state.filteredInvoices.isEmpty) {
              return Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.15),
                child: SvgPicture.asset('assets/icons/no_contracts.svg'),
              );
            }
            return Padding(
              padding: const EdgeInsets.only(left: 12, top: 16, right: 12),
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
