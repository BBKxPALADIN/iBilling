import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Saved extends StatefulWidget {
  const Saved({Key key}) : super(key: key);

  @override
  _SavedState createState() => _SavedState();
}

class _SavedState extends State<Saved> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset('assets/icons/no_saved.svg'),
    );
  }
}
