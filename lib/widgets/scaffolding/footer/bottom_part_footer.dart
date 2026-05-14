import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../utils/functions.dart';
import '../../../../utils/values/values.dart';
import '../../../utils/adaptive_layout.dart';
import '../../../utils/values/spaces.dart';
import '../../buttons/animated_underline_text_button.dart';
import '../../buttons/socials_icon_button.dart';

class BottomPartFooter extends StatelessWidget {
  const BottomPartFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle? textStyle = Get.textTheme.bodyLarge?.copyWith(
      fontFamily: StringConst.INTER,
      color: CustomColors.accentColor,
      fontSize: Sizes.TEXT_SIZE_14,
      fontWeight: FontWeight.w300,
    );

    return Container(
      width: Get.width,
      height: (Get.height * 0.2) <= 175 ? 175 : (Get.height * 0.2),
      color: CustomColors.black,
      child: Center(
        child: Column(
          children: <Widget>[
            const Spacer(flex: 2),
            const SpaceH16(),

            /// Socials
            SocialIconButtonList(socialData: Data.socialData),
            const Spacer(),
            const SpaceH16(),

            /// Privacy Policy
            AnimatedUnderlineTextButton(
              text: StringConst.PRIVACY_POLICY,
              underlineColor: CustomColors.white,
              underlineBottomOffset: 3.0,
              textStyle: textStyle?.copyWith(
                decoration: TextDecoration.underline,
              ),
              onTap: () {
                Navigator.of(context).pushNamed(StringConst.PRIVACY_POLICY_PAGE);
              },
            ),
            const SpaceH8(),

            LayoutBuilder(
              builder: (context, constraints) {
                if (Get.width > refinedBreakpoints.tablet) {
                  return Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            StringConst.COPYRIGHT,
                            style: textStyle,
                          ),

                          /// Julius Links
                          CreditTextButtons(style: textStyle)
                        ],
                      ),
                    ],
                  );
                } else {
                  return Column(
                    children: <Widget>[
                      Text(
                        StringConst.COPYRIGHT,
                        style: textStyle,
                      ),

                      /// Julius Links
                      CreditTextButtons(style: textStyle),
                    ],
                  );
                }
              },
            ),

            const SpaceH8(),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: <Widget>[
                Text(
                  StringConst.BUILT_WITH_FLUTTER,
                  style: textStyle,
                ),
                const FlutterLogo(size: 14),
                Text(
                  " with ",
                  style: textStyle,
                ),
                const Icon(
                  FontAwesomeIcons.solidHeart,
                  size: 14,
                  color: CustomColors.errorRed,
                )
              ],
            ),
            const SpaceH8(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class CreditTextButtons extends StatelessWidget {
  const CreditTextButtons({
    required this.style,
    super.key,
  });

  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          StringConst.COPYRIGHT3,
          style: style,
        ),
        AnimatedUnderlineTextButton(
          text: StringConst.DESIGNED_BY,
          underlineColor: Colors.white,
          underlineBottomOffset: 3.0,
          textStyle: style?.copyWith(
            decoration: TextDecoration.underline,
          ),
          onTap: () {
            Functions.launchUrl(StringConst.DESIGN_LINK);
          },
        ),
      ],
    );
  }
}

class BuiltWithFlutterText extends StatelessWidget {
  const BuiltWithFlutterText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle? style = Get.textTheme.bodyLarge?.copyWith(
      fontFamily: StringConst.INTER,
      color: CustomColors.accentColor,
      fontSize: Sizes.TEXT_SIZE_14,
      fontWeight: FontWeight.w300,
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: <Widget>[
        Text(
          StringConst.BUILT_WITH_FLUTTER,
          style: style,
        ),
        const FlutterLogo(size: 14),
        Text(
          " with ",
          style: style,
        ),
        const Icon(
          FontAwesomeIcons.solidHeart,
          size: 14,
          color: CustomColors.errorRed,
        )
      ],
    );
  }
}
