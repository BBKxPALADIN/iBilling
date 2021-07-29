import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Saved extends StatefulWidget {
  Saved({Key key}) : super(key: key);

  @override
  _SavedState createState() => _SavedState();
}

class _SavedState extends State<Saved> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black,
      ),
      child: Center(
        child: SvgPicture.asset('assets/icons/no_saved.svg'),
      ),
    );
  }
}
