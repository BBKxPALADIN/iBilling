import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'const_classes.dart';
import 'contract/filter.dart';
import '../theme/color.dart';

// ignore: must_be_immutable
class AppBars extends StatelessWidget {
  final int selectedIndex;


  const AppBars({Key key, this.selectedIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildAppBar1(context);
  }

  Widget buildAppBar1(BuildContext context) {
    return AppBar(
      backgroundColor: BillingColor.darkestColor,
      title: Row(
        children: [
          const Image(image: AssetImage('assets/icons/ellipse.png')),
          const SizedBox(width: 12),
          Text(
            Titles.labels[selectedIndex],
            style: const TextStyle(
              fontFamily: 'Ubuntu',
              fontSize: 18,
            ),
          ),
        ],
      ),
      actions: selectedIndex == 2 || selectedIndex == 4 || selectedIndex == 5
          ? []
          : [
              IconButton(
                  icon: SvgPicture.asset('assets/icons/filter.svg'),
                  color: BillingColor.whiteColor,
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(FilterPage.routeName);
                  }),
              const Center(
                  child: Text(
                '|',
                style: TextStyle(fontSize: 18),
              )),
              IconButton(
                  icon: SvgPicture.asset('assets/icons/search.svg'),
                  color: BillingColor.whiteColor,
                  onPressed: () {}),
            ],
    );
  }
}
