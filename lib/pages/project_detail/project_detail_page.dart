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
import '../../widgets/device_mockup.dart';
import '../../widgets/helper/custom_spacer.dart';
import '../../widgets/project_item/project_item.dart';
import '../../widgets/scaffolding/footer/full_footer.dart';
import '../../widgets/scaffolding/page_wrapper.dart';
import '../../widgets/text/self_positioning_text.dart';
import '../../widgets/text/slide_box_transitioning_text.dart';

/// Pill CTA. Visible at rest — solid color background with white text —
/// and lifts on hover. Replaces the AnimatedBubbleButton on the detail page
/// because the bubble's small-at-rest pattern only works on dark backgrounds.
class _PillButton extends StatefulWidget {
  const _PillButton({
    required this.label,
    required this.color,
    required this.onTap,
  });

  final String label;
  final Color color;
  final VoidCallback onTap;

  @override
  State<_PillButton> createState() => _PillButtonState();
}

class _PillButtonState extends State<_PillButton> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOut,
          padding: EdgeInsets.symmetric(
            horizontal: _hover ? 36 : 32,
            vertical: 18,
          ),
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(60),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: widget.color.withValues(alpha: _hover ? 0.32 : 0.16),
                blurRadius: _hover ? 24 : 12,
                offset: Offset(0, _hover ? 10 : 6),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                widget.label,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: StringConst.INTER,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(width: 12),
              Icon(
                Icons.arrow_forward,
                color: Colors.white,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Navigator argument shape.
class ProjectDetailArguments {
  ProjectDetailArguments({required this.index});
  final int index;
}

class ProjectDetailPage extends StatefulWidget {
  const ProjectDetailPage({super.key, this.slug});

  /// Optional URL slug (set by the per-project route
  /// `^/projects/([\w-]+)\$` in `RouteConfiguration`). When non-null,
  /// the page looks up the project in `recentWorks` by [ProjectItemData.slug].
  /// When null we fall back to the legacy `ProjectDetailArguments` route.
  final String? slug;

  static const String projectDetailPageRoute = StringConst.PROJECT_DETAIL_PAGE;

  @override
  ProjectDetailPageState createState() => ProjectDetailPageState();
}

class ProjectDetailPageState extends State<ProjectDetailPage>
    with TickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();

  // One controller per logical section, all gated by VisibilityDetector
  // except _heroController (forwarded on page-load complete),
  // _heroBreathController + _waveController (both loop forever).
  late AnimationController _navController;
  late AnimationController _heroController;
  late AnimationController _heroBreathController;
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
    // Continuous Ken-Burns "breathing" on the hero cover — slow zoom
    // + Y-drift, reverses on completion so it never sits still.
    _heroBreathController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 9000),
    )..repeat(reverse: true);
    _waveController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
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
    _heroBreathController.dispose();
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
    // Find the project either by slug (per-project URL) or by index
    // (legacy `ProjectDetailArguments`).
    int idx;
    if (widget.slug != null) {
      final int found = recentWorks.indexWhere((p) => p.slug == widget.slug);
      idx = found == -1 ? 0 : found;
    } else {
      final ProjectDetailArguments args =
          ModalRoute.of(context)!.settings.arguments
                  as ProjectDetailArguments? ??
              ProjectDetailArguments(index: 0);
      idx = args.index.clamp(0, recentWorks.length - 1);
    }
    final ProjectItemData project = recentWorks[idx];
    final ProjectItemData? nextProject = recentWorks.length > 1
        ? recentWorks[(idx + 1) % recentWorks.length]
        : null;
    final int nextIdx = (idx + 1) % recentWorks.length;

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
            _nextProjectSection(nextProject, nextIdx,
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
          // Cover image — slow continuous Ken-Burns breathing (scale +
          // Y-drift) on _heroBreathController which loops forever; never
          // sits still, no "waiting" beat.
          Positioned.fill(
            child: AnimatedBuilder(
              animation: _heroBreathController,
              builder: (context, child) {
                final double t = Curves.easeInOut
                    .transform(_heroBreathController.value);
                final double scale = 1.0 + t * 0.06; // 1.00 -> 1.06
                final double dy = -t * 24; // drift up by 24px over the cycle
                return Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..translate(0.0, dy)
                    ..scale(scale, scale),
                  child: child,
                );
              },
              child: Image.asset(project.image, fit: BoxFit.cover),
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
      fontSize: 13,
      fontWeight: FontWeight.w700,
      letterSpacing: 3,
      color: CustomColors.black,
    );
    final TextStyle? labelStyle = Get.textTheme.bodyLarge?.copyWith(
      fontFamily: StringConst.INTER,
      fontSize: 13,
      fontWeight: FontWeight.w500,
      letterSpacing: 3,
      color: CustomColors.grey700,
    );
    final TextStyle? headingStyle = Get.textTheme.headlineMedium?.copyWith(
      fontFamily: StringConst.VISUELT_PRO,
      fontSize: responsiveSize(mobile: 32, desktop: 44),
      fontWeight: FontWeight.w700,
      height: 1.2,
      color: CustomColors.black,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AnimatedSlideBoxTransitionText(
              controller: controller,
              text: number,
              textStyle: numberStyle,
            ),
            const SizedBox(width: 14),
            // small accent rule
            Container(width: 28, height: 2, color: CustomColors.black),
            const SizedBox(width: 14),
            AnimatedSlideBoxTransitionText(
              controller: controller,
              text: label,
              textStyle: labelStyle,
            ),
          ],
        ),
        const SpaceH40(),
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
            duration: const Duration(milliseconds: 1100),
            delay: const Duration(milliseconds: 400),
            curve: Curves.easeOut,
          )
          .slideY(
            begin: 0.35,
            end: 0,
            duration: const Duration(milliseconds: 1100),
            delay: const Duration(milliseconds: 400),
            curve: Curves.easeOutCubic,
          )
          .slideX(
            begin: 0.04,
            end: 0,
            duration: const Duration(milliseconds: 1100),
            delay: const Duration(milliseconds: 400),
            curve: Curves.easeOutCubic,
          ),
    );
  }

  Widget _ctaRow(ProjectItemData p) {
    if (p.webUrl.isEmpty && p.gitHubUrl.isEmpty) return const SizedBox.shrink();
    return Wrap(
      spacing: 20,
      runSpacing: 16,
      children: <Widget>[
        if (p.webUrl.isNotEmpty)
          _PillButton(
            label: 'OPEN LIVE',
            color: p.primaryColor,
            onTap: () => Functions.launchUrl(p.webUrl),
          ),
        if (p.gitHubUrl.isNotEmpty)
          _PillButton(
            label: 'VIEW SOURCE',
            color: CustomColors.black,
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
                padding: EdgeInsets.only(bottom: i == p.screenshots.length - 1 ? 0 : 80),
                child: DeviceMockup(
                  imageAsset: p.screenshots[i],
                  type: p.mockupType,
                  tiltLeft: i.isOdd,
                  maxWidth: width * 0.9,
                  maxHeight: responsiveSize(mobile: 420, desktop: 640),
                  scrollController: _scrollController,
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
            const SizedBox(height: 80),
            AnimatedSlideBoxTransitionText(
              controller: _nextProjectController,
              text: 'NEXT PROJECT',
              textStyle: Get.textTheme.bodyLarge?.copyWith(
                fontFamily: StringConst.INTER,
                fontSize: 13,
                fontWeight: FontWeight.w700,
                letterSpacing: 3,
                color: CustomColors.grey700,
              ),
            ),
            const SizedBox(height: 24),
            Container(width: 56, height: 2, color: CustomColors.black),
            const SizedBox(height: 72),
            InkWell(
              onTap: () {
                Navigator.of(context).pushReplacementNamed(
                  '/projects/${next.slug}',
                );
              },
              child: LayoutBuilder(builder: (context, constraints) {
                final bool wide = constraints.maxWidth > 800;
                final double titleWidth = wide
                    ? (constraints.maxWidth - 40) * 0.55
                    : constraints.maxWidth;
                final Widget title = AnimatedSlideBoxTransitionText(
                  controller: _nextProjectController,
                  text: next.title,
                  width: titleWidth,
                  textStyle: Get.textTheme.displayMedium?.copyWith(
                    fontFamily: StringConst.VISUELT_PRO,
                    fontSize: responsiveSize(mobile: 28, desktop: 48),
                    fontWeight: FontWeight.w700,
                    height: 1.15,
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
