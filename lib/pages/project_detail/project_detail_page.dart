import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../utils/adaptive_layout.dart';
import '../../../utils/functions.dart';
import '../../../utils/values/values.dart';
import '../../utils/values/spaces.dart';
import '../../data/projects.dart';
import '../../widgets/animations/animated_wave_line.dart';
import '../../widgets/buttons/animated_bubble_button.dart';
import '../../widgets/device_mockup.dart';
import '../../widgets/helper/custom_spacer.dart';
import '../../widgets/project_item/project_item.dart';
import '../../widgets/scaffolding/footer/full_footer.dart';
import '../../widgets/scaffolding/page_wrapper.dart';
import '../../widgets/text/self_positioning_text.dart';
import '../../widgets/text/slide_box_transitioning_text.dart';

/// Navigator argument shape.
class ProjectDetailArguments {
  ProjectDetailArguments({required this.index});
  final int index;
}

class ProjectDetailPage extends StatefulWidget {
  const ProjectDetailPage({super.key});

  static const String projectDetailPageRoute = StringConst.PROJECT_DETAIL_PAGE;

  @override
  ProjectDetailPageState createState() => ProjectDetailPageState();
}

class ProjectDetailPageState extends State<ProjectDetailPage>
    with TickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();

  // One controller per logical section, all gated by VisibilityDetector
  // except _heroController (forwarded on page-load complete) and
  // _waveController (loops forever).
  late AnimationController _navController;
  late AnimationController _heroController;
  late AnimationController _waveController;
  late AnimationController _aboutController;
  late AnimationController _aboutBodyController;
  late AnimationController _decisionsController;
  late AnimationController _learningsController;
  late AnimationController _galleryController;
  late AnimationController _nextProjectController;
  late AnimationController _footerController;

  @override
  void initState() {
    _navController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _heroController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    _waveController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _waveController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _waveController.forward();
        }
      });
    _waveController.forward();

    _aboutController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _aboutBodyController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    );
    _decisionsController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
    );
    _learningsController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
    );
    _galleryController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    );
    _nextProjectController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _footerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    super.initState();
  }

  @override
  void dispose() {
    _navController.dispose();
    _heroController.dispose();
    _waveController.dispose();
    _aboutController.dispose();
    _aboutBodyController.dispose();
    _decisionsController.dispose();
    _learningsController.dispose();
    _galleryController.dispose();
    _nextProjectController.dispose();
    _footerController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ProjectDetailArguments args =
        ModalRoute.of(context)!.settings.arguments as ProjectDetailArguments? ??
            ProjectDetailArguments(index: 0);
    final int idx = args.index.clamp(0, recentWorks.length - 1);
    final ProjectItemData project = recentWorks[idx];
    final ProjectItemData? nextProject =
        recentWorks.length > 1 ? recentWorks[(idx + 1) % recentWorks.length] : null;

    final double horizontalPadding = responsiveSize(
      mobile: Get.width * 0.10,
      desktop: Get.width * 0.15,
    );
    final double contentWidth = Get.width - horizontalPadding * 2;

    return PageWrapper(
      selectedRoute: ProjectDetailPage.projectDetailPageRoute,
      selectedPageName: project.title,
      navigationBarAnimationController: _navController,
      hasSideTitle: false,
      showFloatingBack: true,
      onLoadingAnimationDone: () {
        _navController.forward();
        _heroController.forward();
      },
      child: ListView(
        controller: _scrollController,
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: <Widget>[
          _hero(project),
          const CustomSpacer(heightFactor: 0.12),
          _aboutSection(project, contentWidth, horizontalPadding),
          if (project.decisions.isNotEmpty) ...<Widget>[
            const CustomSpacer(heightFactor: 0.10),
            _decisionsSection(project, contentWidth, horizontalPadding),
          ],
          if (project.learnings.isNotEmpty) ...<Widget>[
            const CustomSpacer(heightFactor: 0.10),
            _learningsSection(project, contentWidth, horizontalPadding),
          ],
          if (project.screenshots.isNotEmpty) ...<Widget>[
            const CustomSpacer(heightFactor: 0.10),
            _gallerySection(project, contentWidth, horizontalPadding),
          ],
          if (nextProject != null) ...<Widget>[
            const CustomSpacer(heightFactor: 0.15),
            _nextProjectSection(nextProject, (idx + 1) % recentWorks.length,
                contentWidth, horizontalPadding),
          ],
          const CustomSpacer(heightFactor: 0.10),
          VisibilityDetector(
            key: const Key('project-detail-footer'),
            onVisibilityChanged: (info) {
              if (info.visibleFraction > 0.25) _footerController.forward();
            },
            child: FullFooter(controller: _footerController),
          ),
        ],
      ),
    );
  }

  // ---------- HERO ----------
  Widget _hero(ProjectItemData project) {
    final TextStyle? titleStyle = Get.textTheme.displayMedium?.copyWith(
      fontFamily: StringConst.VISUELT_PRO,
      color: Colors.white,
      fontSize: responsiveSize(mobile: 44, desktop: 88),
      fontWeight: FontWeight.w700,
    );
    final TextStyle? categoryStyle = Get.textTheme.bodyLarge?.copyWith(
      fontFamily: StringConst.INTER,
      fontSize: responsiveSize(mobile: 14, desktop: 18),
      fontWeight: FontWeight.w500,
      letterSpacing: 3,
      color: Colors.white.withValues(alpha: 0.85),
    );

    return SizedBox(
      width: Get.width,
      height: Get.height,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // Cover image (parallax-style scale on load)
          Positioned.fill(
            child: Image.asset(project.image, fit: BoxFit.cover)
                .animate(controller: _heroController, autoPlay: false)
                .scale(
                  begin: const Offset(1.08, 1.08),
                  end: const Offset(1.0, 1.0),
                  duration: const Duration(milliseconds: 1800),
                  curve: Curves.easeOutCubic,
                ),
          ),

          // Dark gradient at the bottom for legibility
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Colors.black.withValues(alpha: 0.0),
                    Colors.black.withValues(alpha: 0.45),
                    Colors.black.withValues(alpha: 0.85),
                  ],
                  stops: const <double>[0.45, 0.78, 1.0],
                ),
              ),
            ),
          ),

          // Centred title block, just above the wave
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 140),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  AnimatedSlideBoxTransitionText(
                    controller: _heroController,
                    text: project.category,
                    textStyle: categoryStyle,
                    textAlign: TextAlign.center,
                  ),
                  const SpaceH24(),
                  AnimatedSlideBoxTransitionText(
                    controller: _heroController,
                    text: project.title,
                    textStyle: titleStyle,
                    textAlign: TextAlign.center,
                  ),
                  const SpaceH16(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: responsiveSize(
                        mobile: Get.width * 0.08,
                        desktop: Get.width * 0.20,
                      ),
                    ),
                    child: Text(
                      project.subtitle,
                      textAlign: TextAlign.center,
                      style: Get.textTheme.bodyLarge?.copyWith(
                        fontFamily: StringConst.INTER,
                        color: Colors.white.withValues(alpha: 0.85),
                        fontWeight: FontWeight.w300,
                        fontSize: responsiveSize(mobile: 15, desktop: 19),
                      ),
                    )
                        .animate(controller: _heroController, autoPlay: false)
                        .fadeIn(
                          duration: const Duration(milliseconds: 700),
                          delay: const Duration(milliseconds: 900),
                        )
                        .slideY(
                          begin: 0.4,
                          end: 0,
                          duration: const Duration(milliseconds: 700),
                          delay: const Duration(milliseconds: 900),
                          curve: Curves.easeOut,
                        ),
                  ),
                ],
              ),
            ),
          ),

          // Wave line at the bottom
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: AnimatedWaveLine(
                controller: _waveController,
                height: 64,
                color: project.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ---------- SECTION HEADER ----------
  Widget _sectionHeader({
    required AnimationController controller,
    required String number,
    required String label,
    required String heading,
    required double width,
  }) {
    final TextStyle? numberStyle = Get.textTheme.bodyLarge?.copyWith(
      fontFamily: StringConst.INTER,
      fontSize: 12,
      fontWeight: FontWeight.w600,
      letterSpacing: 2,
      color: CustomColors.black,
    );
    final TextStyle? labelStyle = Get.textTheme.bodyLarge?.copyWith(
      fontFamily: StringConst.INTER,
      fontSize: 12,
      fontWeight: FontWeight.w500,
      letterSpacing: 2,
      color: CustomColors.grey700,
    );
    final TextStyle? headingStyle = Get.textTheme.headlineMedium?.copyWith(
      fontFamily: StringConst.VISUELT_PRO,
      fontSize: responsiveSize(mobile: 28, desktop: 36),
      fontWeight: FontWeight.w700,
      color: CustomColors.black,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            AnimatedSlideBoxTransitionText(
              controller: controller,
              text: number,
              textStyle: numberStyle,
            ),
            const SpaceW16(),
            AnimatedSlideBoxTransitionText(
              controller: controller,
              text: label,
              textStyle: labelStyle,
            ),
          ],
        ),
        const SpaceH16(),
        AnimatedSlideBoxTransitionText(
          controller: controller,
          text: heading,
          textStyle: headingStyle,
          width: width,
        ),
      ],
    );
  }

  // ---------- ABOUT ----------
  Widget _aboutSection(ProjectItemData project, double width, double pad) {
    return VisibilityDetector(
      key: const Key('project-detail-about'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.20) {
          _aboutController.forward();
          Future<void>.delayed(const Duration(milliseconds: 350), () {
            if (mounted) _aboutBodyController.forward();
          });
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: pad),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _sectionHeader(
              controller: _aboutController,
              number: '/01',
              label: 'ABOUT',
              heading: 'About this project',
              width: width,
            ),
            const SpaceH32(),
            LayoutBuilder(builder: (context, constraints) {
              final bool wide = constraints.maxWidth > 800;
              final Widget description = SelfPositioningText(
                controller: _aboutBodyController,
                text: project.portfolioDescription,
                width: wide ? width * 0.62 : width,
                heightFactor: 1.0,
                textStyle: Get.textTheme.bodyLarge?.copyWith(
                  fontFamily: StringConst.INTER,
                  fontSize: responsiveSize(mobile: 16, desktop: 19),
                  fontWeight: FontWeight.w300,
                  color: CustomColors.grey800,
                  height: 1.8,
                ),
              );
              final Widget meta = _metaPanel(project, wide ? width * 0.32 : width);
              if (wide) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(flex: 2, child: description),
                    const SpaceW40(),
                    Expanded(flex: 1, child: meta),
                  ],
                );
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[description, const SpaceH40(), meta],
              );
            }),
            const SpaceH32(),
            _ctaRow(project),
          ],
        ),
      ),
    );
  }

  Widget _metaPanel(ProjectItemData p, double width) {
    final List<MapEntry<String, String>> rows = <MapEntry<String, String>>[
      MapEntry('Platform', p.platform),
      MapEntry('Category', p.category),
      if ((p.technologyUsed ?? '').isNotEmpty)
        MapEntry('Technology', p.technologyUsed!),
      MapEntry('Status', p.isLive ? 'Live' : 'Archived / WIP'),
    ];
    final TextStyle? labelStyle = Get.textTheme.bodyLarge?.copyWith(
      fontFamily: StringConst.INTER,
      fontSize: 11,
      fontWeight: FontWeight.w600,
      letterSpacing: 2,
      color: CustomColors.grey600,
    );
    final TextStyle? valueStyle = Get.textTheme.bodyLarge?.copyWith(
      fontFamily: StringConst.INTER,
      fontSize: 15,
      fontWeight: FontWeight.w400,
      color: CustomColors.black,
      height: 1.6,
    );
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: CustomColors.grey100.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: CustomColors.grey300, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          for (int i = 0; i < rows.length; i++) ...<Widget>[
            Text(rows[i].key.toUpperCase(), style: labelStyle),
            const SpaceH8(),
            Text(rows[i].value, style: valueStyle),
            if (i < rows.length - 1) const SpaceH20(),
          ],
        ],
      )
          .animate(controller: _aboutBodyController, autoPlay: false)
          .fadeIn(
            duration: const Duration(milliseconds: 700),
            delay: const Duration(milliseconds: 300),
          )
          .slideY(
            begin: 0.2,
            end: 0,
            duration: const Duration(milliseconds: 700),
            delay: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          ),
    );
  }

  Widget _ctaRow(ProjectItemData p) {
    if (p.webUrl.isEmpty && p.gitHubUrl.isEmpty) return const SizedBox.shrink();
    return Wrap(
      spacing: 24,
      runSpacing: 16,
      children: <Widget>[
        if (p.webUrl.isNotEmpty)
          AnimatedBubbleButton(
            title: 'OPEN LIVE',
            height: 56,
            targetWidth: 200,
            bubbleColor: p.primaryColor,
            imageColor: Colors.white,
            titleStyle: Get.textTheme.bodyLarge?.copyWith(
              fontFamily: StringConst.INTER,
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w700,
              letterSpacing: 2,
            ),
            onTap: () => Functions.launchUrl(p.webUrl),
          ),
        if (p.gitHubUrl.isNotEmpty)
          AnimatedBubbleButton(
            title: 'VIEW SOURCE',
            height: 56,
            targetWidth: 220,
            bubbleColor: CustomColors.black,
            imageColor: Colors.white,
            titleStyle: Get.textTheme.bodyLarge?.copyWith(
              fontFamily: StringConst.INTER,
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w700,
              letterSpacing: 2,
            ),
            onTap: () => Functions.launchUrl(p.gitHubUrl),
          ),
      ],
    );
  }

  // ---------- DECISIONS ----------
  Widget _decisionsSection(ProjectItemData p, double width, double pad) {
    return VisibilityDetector(
      key: const Key('project-detail-decisions'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.20) _decisionsController.forward();
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: pad),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _sectionHeader(
              controller: _decisionsController,
              number: '/02',
              label: 'DECISIONS',
              heading: 'What I chose, and why',
              width: width,
            ),
            const SpaceH32(),
            ..._bulletList(p.decisions, _decisionsController, width),
          ],
        ),
      ),
    );
  }

  // ---------- LEARNINGS ----------
  Widget _learningsSection(ProjectItemData p, double width, double pad) {
    return VisibilityDetector(
      key: const Key('project-detail-learnings'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.20) _learningsController.forward();
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: pad),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _sectionHeader(
              controller: _learningsController,
              number: '/03',
              label: 'LEARNINGS',
              heading: 'What shipping it taught me',
              width: width,
            ),
            const SpaceH32(),
            ..._bulletList(p.learnings, _learningsController, width),
          ],
        ),
      ),
    );
  }

  List<Widget> _bulletList(
    List<String> items,
    AnimationController controller,
    double width,
  ) {
    final TextStyle? itemStyle = Get.textTheme.bodyLarge?.copyWith(
      fontFamily: StringConst.INTER,
      fontSize: responsiveSize(mobile: 15, desktop: 17),
      fontWeight: FontWeight.w300,
      color: CustomColors.grey800,
      height: 1.7,
    );
    final List<Widget> rows = <Widget>[];
    for (int i = 0; i < items.length; i++) {
      rows.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 12, right: 16),
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: CustomColors.black,
                  shape: BoxShape.circle,
                ),
              )
                  .animate(controller: controller, autoPlay: false)
                  .fadeIn(
                    duration: const Duration(milliseconds: 400),
                    delay: Duration(milliseconds: 400 + i * 200),
                    curve: Curves.easeOut,
                  ),
              Expanded(
                child: Text(items[i], style: itemStyle)
                    .animate(controller: controller, autoPlay: false)
                    .fadeIn(
                      duration: const Duration(milliseconds: 600),
                      delay: Duration(milliseconds: 600 + i * 200),
                      curve: Curves.easeOut,
                    )
                    .slideY(
                      begin: 0.2,
                      end: 0,
                      duration: const Duration(milliseconds: 600),
                      delay: Duration(milliseconds: 600 + i * 200),
                      curve: Curves.easeOut,
                    ),
              ),
            ],
          ),
        ),
      );
    }
    return rows;
  }

  // ---------- GALLERY ----------
  Widget _gallerySection(ProjectItemData p, double width, double pad) {
    return VisibilityDetector(
      key: const Key('project-detail-gallery'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.10) _galleryController.forward();
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: pad),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _sectionHeader(
              controller: _galleryController,
              number: '/04',
              label: 'SHOTS',
              heading: 'In the wild',
              width: width,
            ),
            const SpaceH40(),
            for (int i = 0; i < p.screenshots.length; i++)
              Padding(
                padding: EdgeInsets.only(bottom: i == p.screenshots.length - 1 ? 0 : 56),
                child: DeviceMockup(
                  imageAsset: p.screenshots[i],
                  type: p.mockupType,
                  tiltLeft: i.isOdd,
                  maxWidth: width * 0.9,
                  maxHeight: responsiveSize(mobile: 420, desktop: 640),
                )
                    .animate(controller: _galleryController, autoPlay: false)
                    .fadeIn(
                      duration: const Duration(milliseconds: 900),
                      delay: Duration(milliseconds: 200 + i * 250),
                      curve: Curves.easeOut,
                    )
                    .slideY(
                      begin: 0.15,
                      end: 0,
                      duration: const Duration(milliseconds: 900),
                      delay: Duration(milliseconds: 200 + i * 250),
                      curve: Curves.easeOutCubic,
                    ),
              ),
          ],
        ),
      ),
    );
  }

  // ---------- NEXT PROJECT ----------
  Widget _nextProjectSection(
    ProjectItemData next,
    int nextIndex,
    double width,
    double pad,
  ) {
    return VisibilityDetector(
      key: const Key('project-detail-next'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.20) _nextProjectController.forward();
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: pad),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AnimatedSlideBoxTransitionText(
              controller: _nextProjectController,
              text: 'NEXT PROJECT',
              textStyle: Get.textTheme.bodyLarge?.copyWith(
                fontFamily: StringConst.INTER,
                fontSize: 12,
                fontWeight: FontWeight.w600,
                letterSpacing: 2,
                color: CustomColors.grey700,
              ),
            ),
            const SpaceH24(),
            InkWell(
              onTap: () {
                Navigator.of(context).pushReplacementNamed(
                  ProjectDetailPage.projectDetailPageRoute,
                  arguments: ProjectDetailArguments(index: nextIndex),
                );
              },
              child: LayoutBuilder(builder: (context, constraints) {
                final bool wide = constraints.maxWidth > 800;
                final Widget title = AnimatedSlideBoxTransitionText(
                  controller: _nextProjectController,
                  text: next.title,
                  textStyle: Get.textTheme.displayMedium?.copyWith(
                    fontFamily: StringConst.VISUELT_PRO,
                    fontSize: responsiveSize(mobile: 32, desktop: 56),
                    fontWeight: FontWeight.w700,
                    color: CustomColors.black,
                  ),
                );
                final Widget cover = ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: AspectRatio(
                    aspectRatio: 16 / 10,
                    child: Image.asset(next.image, fit: BoxFit.cover),
                  ),
                )
                    .animate(controller: _nextProjectController, autoPlay: false)
                    .fadeIn(
                      duration: const Duration(milliseconds: 900),
                      delay: const Duration(milliseconds: 300),
                    )
                    .slideY(
                      begin: 0.15,
                      end: 0,
                      duration: const Duration(milliseconds: 900),
                      delay: const Duration(milliseconds: 300),
                      curve: Curves.easeOutCubic,
                    );
                if (wide) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(child: title),
                      const SpaceW40(),
                      Expanded(child: cover),
                    ],
                  );
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[title, const SpaceH24(), cover],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
