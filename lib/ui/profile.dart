import 'package:flutter/material.dart';
import '../theme/color.dart';
import '../components/components.dart';

class Profile extends StatelessWidget {
  const Profile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: BillingColor.darkWorld,
      ),
      child: const ProfileCard(),
    );
  }
}
