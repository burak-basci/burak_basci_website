import 'package:burak_basci_website/widgets/scaffolding/footer/bottom_part_footer.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';

import '../../../../utils/adaptive_layout.dart';
import '../../../../utils/values/values.dart';
import '../../../pages/contact/contact_page.dart';
import '../../buttons/animated_bubble_button.dart';
import '../../text/self_positioning_text.dart';
import '../../text/self_positioning_widget.dart';

class FullFooter extends StatelessWidget {
  const FullFooter({
    required this.controller,
    super.key,
  });

  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double circleImageSize = responsiveSize(mobile: 160, desktop: 200);

        return Container(
          width: Get.width,
          height: (Get.height * 0.54) <= 450 ? 450 : (Get.height * 0.54),
          color: CustomColors.black,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Spacer(),
              SizedBox(
                height: circleImageSize,
                child: Stack(
                  children: <Widget>[
                    /// Circle Image
                    Positioned(
                      right: Get.width * 0.2,
                      child: SelfPositioningWidget(
                        controller: controller,
                        width: circleImageSize,
                        height: circleImageSize,
                        child: Image.asset(
                          ImagePath.DEFAULT_PAGE_FOOTER,
                          color: CustomColors.white,
                        ),
                      ),
                    ),

                    /// Let's Work Together Text
                    Center(
                      child: SelfPositioningText(
                        controller: controller,
                        text: StringConst.WORK_TOGETHER,
                        textAlign: TextAlign.center,
                        width: Get.width,
                        textStyle: Get.textTheme.headlineMedium?.copyWith(
                          color: CustomColors.accentColor,
                          fontSize: responsiveSize(
                            mobile: Sizes.TEXT_SIZE_30,
                            tabletNormal: Sizes.TEXT_SIZE_50,
                            desktop: Sizes.TEXT_SIZE_64,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              /// Available for Freelance Text
              SelfPositioningText(
                text: StringConst.AVAILABLE_FOR_FREELANCE,
                textAlign: TextAlign.center,
                width: Get.width,
                textStyle: Get.textTheme.bodyLarge?.copyWith(
                  color: CustomColors.grey550,
                  fontSize: Sizes.TEXT_SIZE_18,
                  fontWeight: FontWeight.w400,
                ),
                controller: controller,
              ),
              const Spacer(),

              /// Say Hello Button
              AnimatedBubbleButton(
                title: StringConst.SAY_HELLO.toUpperCase(),
                onTap: () {
                  Navigator.pushNamed(context, ContactPage.contactPageRoute);
                },
              ),
              const Spacer(flex: 2),

              const BottomPartFooter(),

              const Spacer(),
            ],
          ),
        );
      },
    );
  }
}
