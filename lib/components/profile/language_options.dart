import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../main.dart';
import '../../theme/color.dart';

import '../../theme/themes.dart';

enum Languages { uzb, rus, usa }

// ignore: must_be_immutable
class LanguageOption extends StatefulWidget {
  var currentLanguage;
  var currentSvg;

  LanguageOption({
    Key key,
    this.currentLanguage,
    this.currentSvg,
  }) : super(key: key);

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

  String language;
  Languages lng;

  void _changeLanguage(Languages languages){
    Locale _temp;
    switch(languages){
      case Languages.uzb:
        _temp=const Locale('uz');
        break;
      case Languages.rus:
        _temp=const Locale('ru');
        break;
      case Languages.usa:
        _temp=const Locale('en');
        break;
      default:
        _temp=const Locale('en');
    }
    MyProject.setLocale(context,_temp);
    print('---------------------------'
        '${_temp.toString()}----language options--------------------------');
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: AlertDialog(
        title: Text(
          'Choose a language',
          style: BillingThemes.textTheme.headline5,
          textAlign: TextAlign.center,
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
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
                  _changeLanguage(lng);
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
                      widget.currentSvg = lang[language];
                      lng = Languages.uzb;
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
                      groupValue: lng,
                      onChanged: (Languages value) {
                        setState(
                          () {
                            widget.currentLanguage = value;
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
                      widget.currentSvg = lang[language];
                      lng = Languages.rus;
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
                      groupValue: lng,
                      onChanged: (Languages value) {
                        setState(
                          () {
                            widget.currentLanguage = value;
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
                      widget.currentSvg = lang[language];
                      lng = Languages.usa;
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
                      groupValue: lng,
                      onChanged: (Languages value) {
                        setState(
                          () {
                            widget.currentLanguage = value;
                          },
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
