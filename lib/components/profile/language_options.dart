import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../theme/color.dart';

import '../../theme/themes.dart';


class LanguageOption extends StatefulWidget {
  const LanguageOption({
    Key key,
  }) : super(key: key);

  @override
  _LanguageOptionState createState() => _LanguageOptionState();
}

class _LanguageOptionState extends State<LanguageOption> {
  var language = '';
  @override
  Widget build(BuildContext context) {
    final initialLang = context.locale;

    return AlertDialog(
      title: Text(
        'choose_language'.tr(),
        style: BillingThemes.textTheme.headline5,
        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListTile(
            onTap: () {
              context.setLocale(const Locale('uz'));
              language = 'uz';

            },
            leading: SvgPicture.asset('assets/icons/uz.svg'),
            title: Text(
              'O\'zbek (Lotin)',
              style: BillingThemes.textTheme.headline6,
            ),
            trailing: SizedBox(
              width: 30,
              child: Radio(
                value: 'uz',
                groupValue: language,
                onChanged: (value) {},
              ),
            ),
          ),
          ListTile(
            onTap: () {
              context.setLocale(const Locale('ru'));
              language = 'ru';

            },
            leading: SvgPicture.asset('assets/icons/ru.svg'),
            title: Text(
              'Русский',
              style: BillingThemes.textTheme.headline6,
            ),
            trailing: SizedBox(
              width: 30,
              child: Radio(
                value: 'ru',
                groupValue: language,
                onChanged: (value) {},
              ),
            ),
          ),
          ListTile(
            onTap: () {
              context.setLocale(const Locale('en'));
              language = 'en';

            },
            leading: SvgPicture.asset('assets/icons/en.svg'),
            title: Text(
              'English (USA)',
              style: BillingThemes.textTheme.headline6,
            ),
            trailing: SizedBox(
              width: 30,
              child: Radio(
                value: 'en',
                groupValue: language,
                onChanged: (value) {},
              ),
            ),
          ),
          const SizedBox(height: 10),

        ],
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            MaterialButton(
              onPressed: () {
                language = '';
                context.setLocale(initialLang);
                setState(() {});
                Navigator.of(context).pop();
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
                  'cancel'.tr(),
                  style: BillingThemes.textTheme.headline6
                      .copyWith(color: const Color(0xff11dbee)),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            MaterialButton(
              onPressed: () {
                setState(() {
                  context.setLocale(Locale(language));
                });
                Navigator.of(context).pop();
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
                  'done'.tr(),
                  style: BillingThemes.textTheme.headline6
                      .copyWith(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
