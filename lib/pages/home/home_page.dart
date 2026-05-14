import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../utils/adaptive_layout.dart';
import '../../../utils/functions.dart';
import '../../../utils/values/values.dart';
import '../../data/projects.dart';
import '../../widgets/project_item/project_item.dart';
import '../../widgets/helper/custom_spacer.dart';
import '../../widgets/scaffolding/footer/full_footer.dart';
import '../../widgets/scaffolding/page_wrapper.dart';
import '../../widgets/text/slide_box_transitioning_text.dart';
import 'widgets/home_page_header.dart';
import 'widgets/initial_loading_page_animation.dart';

class HomePage extends StatefulWidget {
  static const String homePageRoute = StringConst.HOME_PAGE;

  const HomePage({
    super.key,
  });

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  // late AnimationController _viewProjectsController;
  late AnimationController _recentWorksController;
  late AnimationController _headerTextController;
  late AnimationController _headerCircleController;
  late AnimationController _footerController;
  late NavigationArguments _arguments;

  @override
  void initState() {
    _arguments = NavigationArguments();
    // _viewProjectsController = AnimationController(vsync: this);
    _headerTextController = AnimationController(vsync: this);
    _headerCircleController = AnimationController(vsync: this);
    _recentWorksController = AnimationController(vsync: this);
    _footerController = AnimationController(vsync: this);

    super.initState();
  }

  void getArguments() {
    final Object? args = ModalRoute.of(context)!.settings.arguments;
    // if page is being loaded for the first time, args will be null.
    // if args is null, I set boolean values to run the appropriate animation
    // In this case, if null run loading animation, if not null run the unveil animation
    if (args == null) {
      _arguments.showUnVeilPageAnimation = false;
    } else {
      _arguments = args as NavigationArguments;
    }
  }

  @override
  void dispose() {
    // _viewProjectsController.dispose();
    _headerTextController.dispose();
    _headerCircleController.dispose();
    _recentWorksController.dispose();
    _scrollController.dispose();
    _footerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    getArguments();
    // final double projectItemHeight = Get.height * 0.4;
    // final double subHeight = (3 / 4) * projectItemHeight;
    // final double extra = projectItemHeight - subHeight;
    // final TextTheme textTheme = Get.textTheme;
    // final TextStyle? textButtonStyle = textTheme.headlineMedium?.copyWith(
    //   color: AppColors.black,
    //   fontSize: responsiveSize(context, 30, 40, medium: 36, small: 32),
    //   height: 2.0,
    // );

    return PageWrapper(
      selectedRoute: HomePage.homePageRoute,
      selectedPageName: StringConst.HOME,
      navigationBarAnimationController: _headerTextController,
      hasSideTitle: false,
      hasStandardPageUnveilAnimation: _arguments.showUnVeilPageAnimation,
      onLoadingAnimationDone: () {
        _headerTextController.forward();
        _headerCircleController.forward();
      },
      customLoadingAnimation: LoadingHomePageAnimation(
        loadingText: StringConst.DEV_NAME,
        style: Get.textTheme.headlineMedium!.copyWith(color: CustomColors.white),
        onLoadingDone: () {
          _headerTextController.forward();
          _headerCircleController.forward();
        },
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        controller: _scrollController,
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: <Widget>[
          HomePageHeader(
            scrollController: _scrollController,
            textController: _headerTextController,
            circleController: _headerCircleController,
          ),
          const CustomSpacer(heightFactor: 0.1),
          VisibilityDetector(
            key: const Key('recent-projects'),
            onVisibilityChanged: (visibilityInfo) {
              if (visibilityInfo.visibleFraction > 0.25) {
                _recentWorksController.forward();
              }
            },
            child: LayoutBuilder(builder: (context, constraints) {
              final EdgeInsets margin = EdgeInsets.only(
                left: responsiveSize(
                  mobile: Get.width * 0.10,
                  tabletSmall: Get.width * 0.15,
                  desktop: Get.width * 0.15,
                ),
              );

              return Container(
                margin: margin,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AnimatedSlideBoxTransitionText(
                      controller: _recentWorksController,
                      text: StringConst.CRAFTED_WITH_LOVE,
                      width: Get.width * 0.70,
                      textStyle: Get.textTheme.headlineMedium?.copyWith(
                        color: CustomColors.black,
                        fontSize: responsiveSize(
                          mobile: 30,
                          tabletSmall: 36,
                          tabletNormal: 40,
                          desktop: 48,
                        ),
                        height: 2.0,
                      ),
                    ),
                    // const SpaceH16(),
                    // AnimatedPositionedText(
                    //   controller: CurvedAnimation(
                    //     parent: _recentWorksController,
                    //     curve: const Interval(0.6, 1.0, curve: Curves.fastOutSlowIn),
                    //   ),
                    //   text: StringConst.SELECTION,
                    //   textStyle: textTheme.bodyText1?.copyWith(
                    //     fontSize: responsiveSize(
                    //       context,
                    //       Sizes.TEXT_SIZE_16,
                    //       Sizes.TEXT_SIZE_18,
                    //     ),
                    //     height: 2,
                    //     fontWeight: FontWeight.w400,
                    //   ),
                    // ),
                  ],
                ),
              );
            }),
          ),
          const CustomSpacer(heightFactor: 0.05),
          LayoutBuilder(
            builder: (context, constraints) {
              final double itemH = responsiveSize(
                mobile: Get.height * 0.55,
                tabletSmall: Get.height * 0.6,
                tabletNormal: Get.height * 0.65,
                desktop: Get.height * 0.7,
              );
              final double subH = itemH * 0.75;
              final List<ProjectItemData> projects = recentWorksHighlights;
              final int n = projects.length;

              // Build cards top-down: card 0 added FIRST (bottom z),
              // card n-1 added LAST (top z). The later card's header overlaps
              // the previous card's image, both visually and for clicks —
              // each card's exclusive hit area is its own header row.
              final List<Widget> cascade = <Widget>[];
              for (int i = 0; i < n; i++) {
                final double topMargin = subH * i;
                cascade.add(
                  Container(
                    margin: EdgeInsets.only(top: topMargin),
                    child: ProjectItemLarge(
                      projectNumber:
                          (i + 1) > 9 ? "${i + 1}" : "0${i + 1}",
                      imageUrl: projects[i].image,
                      projectItemheight: itemH,
                      subheight: subH,
                      backgroundColor:
                          CustomColors.accentColor2.withValues(alpha: 0.35),
                      title: projects[i].title.toLowerCase(),
                      subtitle: projects[i].category,
                      containerColor: projects[i].primaryColor,
                      onTap: () {
                        final p = projects[i];
                        final String url = p.webUrl.isNotEmpty
                            ? p.webUrl
                            : (p.gitHubUrl.isNotEmpty ? p.gitHubUrl : '');
                        if (url.isNotEmpty) {
                          Functions.launchUrl(url);
                        }
                      },
                    ),
                  ),
                );
              }
              return SizedBox(
                width: double.infinity,
                height: subH * (n - 1) + itemH,
                child: Stack(children: cascade),
              );
            },
          ),
          const CustomSpacer(heightFactor: 0.05),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: responsiveSize(
                mobile: Get.width * 0.10,
                desktop: Get.width * 0.15,
              ),
            ),
            child: Text(
              "${recentWorks.length} projects total · tap any card to open the live link.",
              style: Get.textTheme.bodyLarge?.copyWith(
                fontSize: 14,
                color: CustomColors.grey700,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          // ResponsiveBuilder(
          //   builder: (context, sizingInformation) {
          //     double screenWidth = sizingInformation.screenSize.width;
          //
          //     if (screenWidth <= const RefinedBreakpoints().tabletSmall) {
          //       return Column(
          //         children: _buildProjectsForMobile(
          //           data: Data.recentWorks,
          //           projectHeight: projectItemHeight.toInt(),
          //           subHeight: subHeight.toInt(),
          //         ),
          //       );
          //     } else {
          //       return SizedBox(
          //         height: (subHeight * (Data.recentWorks.length)) + extra,
          //         child: Stack(
          //           children: _buildRecentProjects(
          //             data: Data.recentWorks,
          //             projectHeight: projectItemHeight.toInt(),
          //             subHeight: subHeight.toInt(),
          //           ),
          //         ),
          //       );
          //     }
          //   },
          // ),
          // const CustomSpacer(heightFactor: 0.05),
          // Container(
          //   margin: margin,
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: <Widget>[
          //       Text(
          //         StringConst.THERES_MORE.toUpperCase(),
          //         style: textTheme.bodyText1?.copyWith(
          //           fontSize: responsiveSize(context, 11, Sizes.TEXT_SIZE_12),
          //           letterSpacing: 2,
          //           fontWeight: FontWeight.w300,
          //         ),
          //       ),
          //       const SpaceH16(),
          //       MouseRegion(
          //         onEnter: (e) => _viewProjectsController.forward(),
          //         onExit: (e) => _viewProjectsController.reverse(),
          //         child: AnimatedSlideTransition(
          //           controller: _viewProjectsController,
          //           beginOffset: const Offset(0, 0),
          //           targetOffset: const Offset(0.05, 0),
          //           child: TextButton(
          //             onPressed: () {
          //               // TOD O: Reimplement when WorksPage is ready
          //               Navigator.pushNamed(context, AboutPage.aboutPageRoute);
          //             },
          //             child: Row(
          //               mainAxisSize: MainAxisSize.min,
          //               crossAxisAlignment: CrossAxisAlignment.center,
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               children: <Widget>[
          //                 Text(
          //                   StringConst.VIEW_ALL_PROJECTS.toLowerCase(),
          //                   style: textButtonStyle,
          //                 ),
          //                 const SpaceW12(),
          //                 Container(
          //                   margin: EdgeInsets.only(top: textButtonStyle!.fontSize! / 2),
          //                   child: Image.asset(
          //                     ImagePath.ARROW_RIGHT,
          //                     width: 25,
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          const CustomSpacer(heightFactor: 0.15),
          VisibilityDetector(
            key: const Key('animated-footer'),
            onVisibilityChanged: (visibilityInfo) {
              if (visibilityInfo.visibleFraction > 0.25) {
                _footerController.forward();
              }
            },
            child: FullFooter(
              controller: _footerController,
            ),
          ),
        ],
      ),
    );
  }

//   List<Widget> _buildRecentProjects({
//     required List<ProjectItemData> data,
//     required int projectHeight,
//     required int subHeight,
//   }) {
//     List<Widget> items = <Widget>[];
//     int margin = subHeight * (data.length - 1);
//     for (int index = data.length - 1; index >= 0; index--) {
//       items.add(
//         Container(
//           margin: EdgeInsets.only(top: margin.toDouble()),
//           child: ProjectItemLarge(
//             projectNumber: index + 1 > 9 ? "${index + 1}" : "0${index + 1}",
//             imageUrl: data[index].image,
//             projectItemheight: projectHeight.toDouble(),
//             subheight: subHeight.toDouble(),
//             backgroundColor: AppColors.accentColor2.withOpacity(0.35),
//             title: data[index].title.toLowerCase(),
//             subtitle: data[index].category,
//             containerColor: data[index].primaryColor,
//             onTap: () {
//               Functions.navigateToProject(
//                 context: context,
//                 dataSource: data,
//                 currentProject: data[index],
//                 currentProjectIndex: index,
//               );
//             },
//           ),
//         ),
//       );
//       margin -= subHeight;
//     }
//     return items;
//   }
//
//   List<Widget> _buildProjectsForMobile({
//     required List<ProjectItemData> data,
//     required int projectHeight,
//     required int subHeight,
//   }) {
//     List<Widget> items = <Widget>[];
//
//     for (int index = 0; index < data.length; index++) {
//       items.add(
//         ProjectItemSm(
//           projectNumber: index + 1 > 9 ? "${index + 1}" : "0${index + 1}",
//           imageUrl: data[index].image,
//           title: data[index].title.toLowerCase(),
//           subtitle: data[index].category,
//           containerColor: data[index].primaryColor,
//           onTap: () {
//             Functions.navigateToProject(
//               context: context,
//               dataSource: data,
//               currentProject: data[index],
//               currentProjectIndex: index,
//             );
//           },
//         ),
//       );
//       items.add(const CustomSpacer(
//         heightFactor: 0.10,
//       ));
//     }
//     return items;
//   }
}
