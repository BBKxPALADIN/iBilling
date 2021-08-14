import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/history/history_bloc.dart';
import 'blocs/invoices/invoices_bloc.dart';
import 'ui/new_contract/new_contract.dart';
import 'ui/new_contract/new_invoice.dart';
import 'components/contract/filter.dart';
import 'ui/contracts.dart';
import 'ui/home.dart';
import 'blocs/contracts/contracts_bloc.dart';
import 'theme/themes.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      child: const MyProject(),
      supportedLocales: const [
        Locale('en'),
        Locale('uz'),
        Locale('ru'),
      ],
      path: 'assets/languages',
      fallbackLocale: const Locale('en'),
      saveLocale: true,
    ),
  );
}

class MyProject extends StatefulWidget {
  const MyProject({Key key}) : super(key: key);

  @override
  _MyProjectState createState() => _MyProjectState();
}

class _MyProjectState extends State<MyProject> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ContractsBloc()..add(LoadContracts()),
        ),
        BlocProvider(
          create: (_) => InvoicesBloc()..add(LoadInvoices()),
        ),
        BlocProvider(
          create: (_) => HistoryBloc()..add(InitializeHistoryEvent()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const Home(),
        theme: BillingThemes.dark(),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        routes: {
          FilterPage.routeName: (context) => const FilterPage(),
          Contracts.routeName: (context) => const Contracts(),
          Home.routeName: (context) => const Home(),
          NewContract.routeName: (context) => const NewContract(),
          NewInvoice.routeName: (context) => const NewInvoice(),
        },
      ),
    );
  }
}
