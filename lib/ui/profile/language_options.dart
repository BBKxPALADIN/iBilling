import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fooderlich/theme/color.dart';

import '../../theme/themes.dart';

enum Languages { uzb, rus, usa }

class LanguageOption extends StatefulWidget {
  const LanguageOption({Key key}) : super(key: key);

  @override
  _LanguageOptionState createState() => _LanguageOptionState();
}

class _LanguageOptionState extends State<LanguageOption> {
  final _key = GlobalKey<FormState>();

  var lang = {
    'English (USA)': SvgPicture.asset('assets/icons/en.svg'),
    'Русский': SvgPicture.asset('assets/icons/ru.svg'),
    'O\'zbek (Lotin)': SvgPicture.asset('assets/icons/uz.svg'),
  };

  Languages _chosen = Languages.uzb;
  String language;
  var lngIcon;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Choose a language',
        style: BillingThemes.textTheme.headline5,
        textAlign: TextAlign.center,
      ),
      content: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ListTile(
                onTap: () {
                  setState(() {
                    language = lang.keys.elementAt(2);
                    lngIcon = lang[language];
                    _chosen = Languages.uzb;
                  });
                },
                leading: SvgPicture.asset('assets/icons/uz.svg'),
                title: Text(
                  'O\'zbek (Lotin)',
                  style: BillingThemes.textTheme.headline6,
                ),
                trailing: SizedBox(
                  width: 30,
                  child: RadioListTile<Languages>(
                    value: Languages.uzb,
                    groupValue: _chosen,
                    onChanged: (Languages value) {
                      setState(
                        () {
                          _chosen = value;
                        },
                      );
                    },
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    language = lang.keys.elementAt(1);
                    lngIcon = lang[language];
                    _chosen = Languages.rus;
                  });
                },
                leading: SvgPicture.asset('assets/icons/ru.svg'),
                title: Text(
                  'Русский',
                  style: BillingThemes.textTheme.headline6,
                ),
                trailing: SizedBox(
                  width: 30,
                  child: RadioListTile<Languages>(
                    value: Languages.rus,
                    groupValue: _chosen,
                    onChanged: (Languages value) {
                      setState(
                        () {
                          _chosen = value;
                        },
                      );
                    },
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    language = lang.keys.elementAt(0);
                    lngIcon = lang[language];
                    _chosen = Languages.usa;
                  });
                },
                leading: SvgPicture.asset('assets/icons/en.svg'),
                title: Text(
                  'English (USA)',
                  style: BillingThemes.textTheme.headline6,
                ),
                trailing: SizedBox(
                  width: 30,
                  child: RadioListTile<Languages>(
                    value: Languages.usa,
                    groupValue: _chosen,
                    onChanged: (Languages value) {
                      setState(
                        () {
                          _chosen = value;
                        },
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MaterialButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      if (_key.currentState.validate()) {
                        _key.currentState.save();
                      }
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      height: MediaQuery.of(context).size.width * 0.08,
                      padding: const EdgeInsets.all(9),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: BillingColor.darkGreenColor,
                      ),
                      child: Text(
                        'Cancel',
                        style: BillingThemes.textTheme.headline6
                            .copyWith(color: const Color(0xff11dbee)),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      if (_key.currentState.validate()) {
                        _key.currentState.save();
                      }
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      height: MediaQuery.of(context).size.width * 0.08,
                      padding: const EdgeInsets.all(9),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: BillingColor.lightGreenColor,
                      ),
                      child: Text(
                        'Done',
                        style: BillingThemes.textTheme.headline6
                            .copyWith(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
