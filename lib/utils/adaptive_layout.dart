import 'package:get/get.dart';

/// Manually define refined breakpoints
///
/// Overrides the defaults

const RefinedBreakpoints refinedBreakpoints = RefinedBreakpoints();

class RefinedBreakpoints {
  final double mobile;
  final double tabletSmall;
  final double tablet;
  final double desktop;

  const RefinedBreakpoints({
    this.mobile = 600,
    this.tabletSmall = 800,
    this.tablet = 1023,
    this.desktop = 1439,
  });
}

double responsiveSize({
  required double mobile,
  required double desktop,
  double? tabletSmall,
  double? tabletNormal,
}) {
  if (Get.width < 600) {
    return mobile;
  } else if (Get.width < 1023) {
    return tabletSmall ??
        (tabletNormal ??
            mobile); //assign tabletNormal to tabletSmall if it is not null, if null assign mobile
  } else if (Get.width < 1439) {
    return tabletNormal ?? desktop;
  } else {
    return desktop;
  }
}
