import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../utils/adaptive_layout.dart';
import '../../../utils/functions.dart';
import '../../../utils/values/values.dart';
import '../../utils/values/spaces.dart';
import '../../data/projects.dart';
import '../../widgets/helper/custom_spacer.dart';
import '../../widgets/project_item/project_item.dart';
import '../../widgets/scaffolding/footer/full_footer.dart';
import '../../widgets/scaffolding/page_wrapper.dart';
import '../../widgets/text/slide_box_transitioning_text.dart';

/// Arguments passed via Navigator.pushNamed.
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
  late AnimationController _headerController;
  late AnimationController _bodyController;
  late AnimationController _footerController;

  @override
  void initState() {
    _headerController = AnimationController(vsync: this);
    _bodyController = AnimationController(vsync: this);
    _footerController = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _headerController.dispose();
    _bodyController.dispose();
    _footerController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ProjectDetailArguments args =
        ModalRoute.of(context)!.settings.arguments as ProjectDetailArguments? ??
            ProjectDetailArguments(index: 0);
    final ProjectItemData project =
        recentWorks[args.index.clamp(0, recentWorks.length - 1)];
    final int projectIndex = args.index;

    final double horizontalPadding = responsiveSize(
      mobile: Get.width * 0.10,
      desktop: Get.width * 0.15,
    );

    return PageWrapper(
      selectedRoute: ProjectDetailPage.projectDetailPageRoute,
      selectedPageName: project.title,
      navigationBarAnimationController: _headerController,
      hasSideTitle: false,
      onLoadingAnimationDone: () => _headerController.forward(),
      child: ListView(
        controller: _scrollController,
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: <Widget>[
          // Hero: cover + title
          SizedBox(
            width: Get.width,
            height: Get.height * 0.7,
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Image.asset(project.coverUrl, fit: BoxFit.cover),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                        Colors.black.withValues(alpha: 0.0),
                        Colors.black.withValues(alpha: 0.55),
                        Colors.black.withValues(alpha: 0.85),
                      ],
                      stops: const <double>[0.4, 0.75, 1.0],
                    ),
                  ),
                ),
                Positioned(
                  left: horizontalPadding,
                  right: horizontalPadding,
                  bottom: 48,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '/${(projectIndex + 1).toString().padLeft(2, '0')}  ${project.category}',
                        style: Get.textTheme.bodyLarge?.copyWith(
                          fontFamily: StringConst.INTER,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 2,
                          color: Colors.white.withValues(alpha: 0.8),
                        ),
                      ),
                      const SpaceH16(),
                      AnimatedSlideBoxTransitionText(
                        controller: _headerController,
                        text: project.title,
                        width: Get.width,
                        textStyle: Get.textTheme.displayMedium?.copyWith(
                          fontFamily: StringConst.VISUELT_PRO,
                          color: Colors.white,
                          fontSize: responsiveSize(
                            mobile: 40,
                            desktop: 72,
                          ),
                        ),
                      ),
                      const SpaceH8(),
                      Text(
                        project.subtitle,
                        style: Get.textTheme.bodyLarge?.copyWith(
                          fontFamily: StringConst.INTER,
                          fontSize: responsiveSize(
                            mobile: 16,
                            desktop: 22,
                          ),
                          fontWeight: FontWeight.w300,
                          color: Colors.white.withValues(alpha: 0.85),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Body
          const CustomSpacer(heightFactor: 0.08),
          VisibilityDetector(
            key: const Key('project-detail-body'),
            onVisibilityChanged: (info) {
              if (info.visibleFraction > 0.1) _bodyController.forward();
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Description
                  Text(
                    project.portfolioDescription,
                    style: Get.textTheme.bodyLarge?.copyWith(
                      fontFamily: StringConst.INTER,
                      fontSize: responsiveSize(mobile: 16, desktop: 20),
                      fontWeight: FontWeight.w300,
                      height: 1.8,
                      color: CustomColors.grey800,
                    ),
                  ),
                  const SpaceH40(),

                  // Meta grid
                  LayoutBuilder(builder: (context, constraints) {
                    final bool isWide = constraints.maxWidth > 800;
                    final List<Widget> rows = <Widget>[
                      _MetaRow(
                        label: 'Platform',
                        value: project.platform,
                      ),
                      _MetaRow(
                        label: 'Category',
                        value: project.category,
                      ),
                      if ((project.technologyUsed ?? '').isNotEmpty)
                        _MetaRow(
                          label: 'Technology',
                          value: project.technologyUsed!,
                        ),
                      _MetaRow(
                        label: 'Status',
                        value: project.isLive ? 'Live' : 'Archived / WIP',
                      ),
                      if (project.webUrl.isNotEmpty)
                        _MetaRow(
                          label: 'Live',
                          value: project.webUrl,
                          isLink: true,
                          onTap: () => Functions.launchUrl(project.webUrl),
                        ),
                      if (project.gitHubUrl.isNotEmpty)
                        _MetaRow(
                          label: 'Source',
                          value: project.gitHubUrl,
                          isLink: true,
                          onTap: () => Functions.launchUrl(project.gitHubUrl),
                        ),
                    ];
                    if (!isWide) return Column(children: rows);
                    return Wrap(
                      runSpacing: 16,
                      children: rows
                          .map((w) =>
                              SizedBox(width: constraints.maxWidth / 2, child: w))
                          .toList(),
                    );
                  }),

                  const SpaceH40(),

                  // CTA
                  if (project.webUrl.isNotEmpty || project.gitHubUrl.isNotEmpty)
                    Wrap(
                      spacing: 24,
                      runSpacing: 16,
                      children: <Widget>[
                        if (project.webUrl.isNotEmpty)
                          _DetailButton(
                            label: 'OPEN LIVE',
                            color: project.primaryColor,
                            onTap: () => Functions.launchUrl(project.webUrl),
                          ),
                        if (project.gitHubUrl.isNotEmpty)
                          _DetailButton(
                            label: 'VIEW SOURCE',
                            color: CustomColors.black,
                            onTap: () =>
                                Functions.launchUrl(project.gitHubUrl),
                          ),
                      ],
                    ),

                  const SpaceH60(),
                ],
              ),
            ),
          ),

          // Footer
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
}

class _MetaRow extends StatelessWidget {
  const _MetaRow({
    required this.label,
    required this.value,
    this.isLink = false,
    this.onTap,
  });

  final String label;
  final String value;
  final bool isLink;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final TextStyle? labelStyle = Get.textTheme.bodyLarge?.copyWith(
      fontFamily: StringConst.INTER,
      fontSize: 13,
      fontWeight: FontWeight.w500,
      letterSpacing: 2,
      color: CustomColors.grey600,
    );
    final TextStyle? valueStyle = Get.textTheme.bodyLarge?.copyWith(
      fontFamily: StringConst.INTER,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: isLink ? CustomColors.accentColor : CustomColors.black,
      decoration: isLink ? TextDecoration.underline : null,
    );
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: 140,
            child: Text(label.toUpperCase(), style: labelStyle),
          ),
          Expanded(
            child: isLink
                ? InkWell(
                    onTap: onTap,
                    child: Text(value, style: valueStyle),
                  )
                : Text(value, style: valueStyle),
          ),
        ],
      ),
    );
  }
}

class _DetailButton extends StatelessWidget {
  const _DetailButton({
    required this.label,
    required this.color,
    required this.onTap,
  });

  final String label;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Text(
          label,
          style: Get.textTheme.bodyLarge?.copyWith(
            fontFamily: StringConst.INTER,
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w700,
            letterSpacing: 2,
          ),
        ),
      ),
    );
  }
}
