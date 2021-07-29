import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/contract_cubit.dart';
import 'theme/themes.dart';
import './ui/screens.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() => runApp(MyProject());

class MyProject extends StatelessWidget {
  const MyProject({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ContractCubit(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
        theme: BillingThemes.dark(),
      ),
    );
  }
}


class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  static List<String> labels = <String>[
    'Contracts',
    'History',
    'New Contract',
    'Saved',
    'Profile',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static List<Widget> pages = <Widget>[
    Contracts(),
    History(),
    NewContract(),
    Saved(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff141416),
        title: Row(
          children: [
            const Image(image: AssetImage('assets/icons/ellipse.png')),
            const SizedBox(width: 12),
            Text(
              labels[_selectedIndex],
              style: const TextStyle(
                fontFamily: 'Ubuntu',
                fontSize: 18,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
              icon: SvgPicture.asset('assets/icons/filter.svg'),
              color: Colors.white,
              onPressed: () {}),
          const Center(
              child: Text(
                '|',
                style: TextStyle(fontSize: 18),
              )),
          IconButton(
              icon: SvgPicture.asset('assets/icons/search.svg'),
              color: Colors.white,
              onPressed: () {}),
        ],
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xff141416),
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
            label: 'Contracts',
            icon: _selectedIndex == 0
                ? SvgPicture.asset('assets/icons/contracts-bold.svg')
                : SvgPicture.asset('assets/icons/contracts.svg'),
          ),
          BottomNavigationBarItem(
            label: 'History',
            icon: _selectedIndex == 1
                ? SvgPicture.asset('assets/icons/history-bold.svg')
                : SvgPicture.asset('assets/icons/history.svg'),
          ),
          BottomNavigationBarItem(
            label: 'New',
            icon: _selectedIndex == 2
                ? SvgPicture.asset('assets/icons/create-bold.svg')
                : SvgPicture.asset('assets/icons/create.svg'),
          ),
          BottomNavigationBarItem(
            label: 'Saved',
            icon: _selectedIndex == 3
                ? SvgPicture.asset('assets/icons/saved-bold.svg')
                : SvgPicture.asset('assets/icons/saved.svg'),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: _selectedIndex == 4
                ? SvgPicture.asset('assets/icons/profile-bold.svg')
                : SvgPicture.asset('assets/icons/profile.svg'),
          ),
        ],
      ),
    );
  }

  Widget buildNewContract(){
    // ignore: sized_box_for_whitespace
    return Container(
      height: MediaQuery.of(context).size.height*0.25,
      width: MediaQuery.of(context).size.width*0.3,
      child: AlertDialog(
        title: Text(
          'Что вы хотите создать?',
          style: BillingThemes.textTheme.headline5,
        ),
        contentPadding: const EdgeInsets.only(bottom: 28),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ignore: deprecated_member_use
            FlatButton(
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder:
                    (context)=>NewContract()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/icons/new_contract.svg'),
                  const SizedBox(width: 16),
                  Text(
                    'Contract',
                    style: BillingThemes.textTheme.bodyText1,
                  )
                ],
              ),
            ),
            // ignore: deprecated_member_use
            FlatButton(
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder:
                    (context)=>NewContract()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/icons/new_invoice.svg'),
                  const SizedBox(width: 16),
                  Text(
                    'Invoice',
                    style: BillingThemes.textTheme.bodyText1,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
