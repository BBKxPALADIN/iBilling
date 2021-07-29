import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fooderlich/theme/themes.dart';

class NewContract extends StatefulWidget {
  NewContract({Key key}) : super(key: key);

  @override
  _NewContractState createState() => _NewContractState();
}

class _NewContractState extends State<NewContract> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.25,
      width: MediaQuery.of(context).size.width,
      // child: new AlertDialog(
      //   title: Text(
      //     'Что вы хотите создать?',
      //     style: BillingThemes.textTheme.headline5,
      //   ),
      //   contentPadding: EdgeInsets.only(bottom: 28),
      //   content: new Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [
      //       FlatButton(
      //         onPressed: () {},
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.start,
      //           crossAxisAlignment: CrossAxisAlignment.center,
      //           children: [
      //             SvgPicture.asset('assets/icons/new_contract.svg'),
      //             SizedBox(width: 16),
      //             Text(
      //               'Contract',
      //               style: BillingThemes.textTheme.bodyText1,
      //             )
      //           ],
      //         ),
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}
