import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../theme/color.dart';
import '../../blocs/contract_cubit.dart';
import '../../theme/themes.dart';
import '../../models/contract.dart';
import 'contracts_list_view.dart';
import 'custom_calendar.dart';
import '../../api/mock_contracts_service.dart';

class Contracts extends StatefulWidget {
  const Contracts({Key key}) : super(key: key);

  @override
  _ContractsState createState() => _ContractsState();
}

class _ContractsState extends State<Contracts> {
  final mockService = MockContractsService().getContractResponse();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: BillingColor.darkWorld,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.18,
            child: const CustomCalendar(),
          ),
          Expanded(
            child: BlocBuilder<ContractCubit, List<ContractsListView>>(
              builder: (context, state) {
                return FutureBuilder(
                  future: ContractCubit().getContracts(),
                  builder: (context, snapshot) {
                    if (snapshot.error == null) {
                      print(ContractCubit().getContracts());
                      print(state);
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator.adaptive(),
                        );
                      } else if (snapshot.connectionState ==
                          ConnectionState.done) {
                        final data = snapshot.data as List<Contract>;
                        if (data.length == null) {
                          return SvgPicture.asset(
                              'assets/icons/no_contracts.svg');
                        }
                        return SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 12, top: 16, right: 12),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    MaterialButton(
                                      onPressed: () {},
                                      child: Container(
                                        height: 30,
                                        width: 85,
                                        padding: const
                                        EdgeInsets.only(left: 10,top: 5),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          color: BillingColor.lightGreenColor,
                                        ),
                                        child: Text(
                                          'Contract',
                                          style:
                                              BillingThemes.textTheme.headline5,
                                        ),
                                      ),
                                    ),
                                    MaterialButton(
                                      onPressed: () {},
                                      child: Container(
                                        height: 30,
                                        width: 85,
                                        padding: const
                                        EdgeInsets.only(left: 10,top: 5),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          color: BillingColor.lightGreenColor,
                                        ),
                                        child: Text(
                                          'Contract',
                                          style:
                                              BillingThemes.textTheme.headline5,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                ...data
                                    .map((element) =>
                                        ContractsListView(contract: element))
                                    .toList(),
                              ],
                            ),
                          ),
                        );
                      }
                    } else {
                      print(snapshot.error);

                      print('Failed to work');
                      print(ContractCubit().getContracts());
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'An error has occurred!',
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                          Text(
                            'Sorry! Internal error has occured!',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ],
                      );
                    }

                    return Container();
                    // if (snapshot.connectionState == ConnectionState.done) {
                    //   final data=snapshot.data as List<Contracts>;
                    //   if (data.length == null) {
                    //     return SvgPicture.asset(
                    //         'assets/icons/no_contracts.svg');
                    //   }
                    //   return ListView.separated(
                    //     controller: _controller,
                    //     scrollDirection: Axis.vertical,
                    //     itemCount: data.length,
                    //     itemBuilder: (context, index) {
                    //       return ContractsListView(
                    //         fullName: state[index].fullName,
                    //         status: state[index].status,
                    //         amount: state[index].amount,
                    //         lastInvoice: state[index].lastInvoice,
                    //         invoiceAmount: state[index].invoiceAmount,
                    //         createdAt: state[index].createdAt,
                    //       );
                    //     },
                    //     separatorBuilder: (context, index) {
                    //       return const SizedBox(height: 16);
                    //     },
                    //   );
                    // } else {
                    //   return const Center(
                    //     child: CircularProgressIndicator(),
                    //   );
                    // }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
