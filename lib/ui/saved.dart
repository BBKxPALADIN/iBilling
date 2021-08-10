import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/color.dart';

class Saved extends StatefulWidget {
  const Saved({Key key}) : super(key: key);

  @override
  _SavedState createState() => _SavedState();
}

class _SavedState extends State<Saved> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: BillingColor.darkWorld,
      ),
      child: Center(
        child: SvgPicture.asset('assets/icons/no_saved.svg'),
      ),
    );
  }
}
