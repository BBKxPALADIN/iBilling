import 'package:flutter/material.dart';
import '../components/components.dart';

class Profile extends StatelessWidget {
  static const routeName = '/profile';

  const Profile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ProfileCard();
  }
}
