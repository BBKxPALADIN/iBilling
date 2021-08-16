import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../theme/color.dart';
import '../../theme/themes.dart';
import 'package:easy_localization/easy_localization.dart';

class ProfileCard extends StatefulWidget {
  const ProfileCard({Key key}) : super(key: key);

  @override
  _ProfileCardState createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  var lang = {
    'English (USA)': SvgPicture.asset('assets/icons/en.svg'),
    'Русский': SvgPicture.asset('assets/icons/ru.svg'),
    'O\'zbek (Lotin)': SvgPicture.asset('assets/icons/uz.svg'),
  };

  @override
  Widget build(BuildContext context) {
    var language = '';
    final  initialLang = context.locale;
    return LayoutBuilder(
      builder: (ctx, constrain) => Padding(
        padding: const EdgeInsets.only(left: 12, top: 16, right: 12),
        child: Column(
          children: [
            Container(
              width: constrain.maxWidth,
              height: constrain.maxHeight * 0.325,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: BillingColor.darkColor,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 16, top: 20, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset('assets/icons/profile_card.svg'),
                        const SizedBox(width: 16),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Otabek Abdusamatov',
                              style: TextStyle(
                                color: BillingColor.lightGreenColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              'Graphic designer • IQ Education',
                              style: TextStyle(
                                color: Color(0xffE7E7E7),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 22),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '${'date_of_birth'.tr()}:    ',
                          style: BillingThemes.textTheme.headline6,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '16.09.2001',
                          style: BillingThemes.textTheme.bodyText2,
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '${'phone_number'.tr()}:    ',
                          style: BillingThemes.textTheme.headline6,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '+998 97 721 06 88',
                          style: BillingThemes.textTheme.bodyText2,
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '${'email'.tr()}:    ',
                          style: BillingThemes.textTheme.headline6,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'predatorhunter041@gmail.com',
                          style: BillingThemes.textTheme.bodyText2,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: constrain.maxWidth,
              height: constrain.maxHeight * 0.08,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: BillingColor.darkColor,
              ),
              padding: const EdgeInsets.only(left: 10),
              // ignore: deprecated_member_use
              child: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
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
                                height:
                                    MediaQuery.of(context).size.width * 0.08,
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
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.25,
                                height:
                                    MediaQuery.of(context).size.width * 0.08,
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
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'language'.tr(),
                      style: BillingThemes.textTheme.headline6,
                    ),
                    lang['language'.tr()],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
