import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../theme/color.dart';
import 'language_options.dart';
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
              child: MaterialButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          const LanguageOption());
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
