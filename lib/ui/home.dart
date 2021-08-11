import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/color.dart';
import '../components/components.dart';
import 'package:easy_localization/easy_localization.dart';

class Home extends StatefulWidget {
  static const routeName = '/home';

  const Home({Key key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) async {
    if (index == 2) {
      await showDialog(
          context: context,
          builder: (ctx) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: const TypeOfContract(),
            );
          });
    }
      setState(() {
        _selectedIndex = index;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBars(selectedIndex: _selectedIndex),
        preferredSize: const Size.fromHeight(kToolbarHeight),
      ),
      body: Pages.pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: BillingColor.darkestColor,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
            label: 'contracts'.tr(),
            icon: _selectedIndex == 0
                ? SvgPicture.asset('assets/icons/contracts-bold.svg')
                : SvgPicture.asset('assets/icons/contracts.svg'),
          ),
          BottomNavigationBarItem(
            label: 'history'.tr(),
            icon: _selectedIndex == 1
                ? SvgPicture.asset('assets/icons/history-bold.svg')
                : SvgPicture.asset('assets/icons/history.svg'),
          ),
          BottomNavigationBarItem(
            label: 'new'.tr(),
            icon: _selectedIndex == 2
                ? SvgPicture.asset('assets/icons/create-bold.svg')
                : SvgPicture.asset('assets/icons/create.svg'),
          ),
          BottomNavigationBarItem(
            label: 'saved'.tr(),
            icon: _selectedIndex == 3
                ? SvgPicture.asset('assets/icons/saved-bold.svg')
                : SvgPicture.asset('assets/icons/saved.svg'),
          ),
          BottomNavigationBarItem(
            label: 'profile'.tr(),
            icon: _selectedIndex == 4
                ? SvgPicture.asset('assets/icons/profile-bold.svg')
                : SvgPicture.asset('assets/icons/profile.svg'),
          ),
        ],
      ),
    );
  }
}
