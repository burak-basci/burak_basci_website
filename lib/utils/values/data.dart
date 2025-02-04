// ignore_for_file: non_constant_identifier_names

part of 'values.dart';

// class CertificationData {
//   CertificationData({
//     required this.title,
//     required this.image,
//     required this.imageSize,
//     required this.url,
//     required this.awardedBy,
//   });
//
//   final String image;
//   final double imageSize;
//   final String url;
//   final String title;
//   final String awardedBy;
// }

class NoteWorthyProjectDetails {
  NoteWorthyProjectDetails({
    required this.projectName,
    required this.isOnPlayStore,
    required this.isPublic,
    required this.technologyUsed,
    required this.isWeb,
    required this.isLive,
    this.projectDescription,
    this.playStoreUrl,
    this.webUrl,
    this.hasBeenReleased,
    this.gitHubUrl,
  });

  final String projectName;
  final bool isPublic;
  final bool isOnPlayStore;
  final bool isWeb;
  final String? projectDescription;
  final bool isLive;
  final bool? hasBeenReleased;
  final String? playStoreUrl;
  final String? gitHubUrl;
  final String? webUrl;
  final String? technologyUsed;
}

class ExperienceData {
  ExperienceData({
    required this.duration,
    required this.company,
    required this.position,
    required this.roles,
    required this.location,
    this.companyUrl,
  });

  final String duration;
  final String company;
  final String position;
  final List<String> roles;
  final String? location;
  final String? companyUrl;
}

class PrivacyPolicyData {
  PrivacyPolicyData({
    this.title,
    required this.content,
  });

  final String? title;
  final String content;
}

class SkillData {
  SkillData({
    required this.skillName,
    required this.skillLevel,
  });

  final String skillName;
  final double skillLevel;
}

class SubMenuData {
  SubMenuData({
    required this.title,
    this.isSelected,
    this.content,
    this.skillData,
    this.isAnimation = false,
  });

  final String title;
  final String? content;
  final List<SkillData>? skillData;
  bool isAnimation;
  bool? isSelected;
}

class Data {
  static final List<TopNavigationItemData> menuItems = <TopNavigationItemData>[
    TopNavigationItemData(name: StringConst.HOME, route: StringConst.HOME_PAGE),
    TopNavigationItemData(name: StringConst.ABOUT, route: StringConst.ABOUT_PAGE),
    // TopNavigationItemData(name: StringConst.WORK, route: StringConst.WORK_PAGE),
    TopNavigationItemData(
      name: StringConst.EXPERIENCE,
      route: StringConst.EXPERIENCE_PAGE,
    ),
    // NavItemData(
    //   name: StringConst.CERTIFICATIONS,
    //   route: StringConst.CERTIFICATION_PAGE,
    // ),
    TopNavigationItemData(name: StringConst.CONTACT, route: StringConst.CONTACT_PAGE),
  ];

  static final List<SocialData> socialData = <SocialData>[
    SocialData(
      name: StringConst.GITHUB,
      iconData: FontAwesomeIcons.github,
      url: StringConst.GITHUB_URL,
    ),
    SocialData(
      name: StringConst.LINKED_IN,
      iconData: FontAwesomeIcons.linkedin,
      url: StringConst.LINKED_IN_URL,
    ),
    SocialData(
      name: StringConst.PINTEREST,
      iconData: FontAwesomeIcons.pinterest,
      url: StringConst.PINTEREST_URL,
    ),
  ];

  static const List<String> programmingLanguages = <String>[
    "Dart",
    "Flutter",
    "C/C++",
    "Python",
    "Solidity",
    "Matlab",
    "Java",
  ];

  static const List<String> applications = <String>[
    "Unreal Engine",
    "Android Studio",
    "Visual Studio Code",
    "Remix Ethereum IDE",
    "Matlab",
    "TwinCAT",
    "OBS Studio",
    "Adobe Photoshop",
    "Adobe Illustrator",
    "Microsoft Word",
    "Microsoft Excel",
    "Microsoft PowerPoint",
  ];

  static const List<String> otherSoftware = <String>[
    "Firebase",
    "Git",
    "Hardhat",
    "Auto GPT",
    "YOLOv8",
    "MidJourney",
    "Stable Diffusion",
    "Wordpress",
  ];

  // static List<ProjectItemData> recentWorks = <ProjectItemData>[
  //   Projects.DISNEY_PLUS,
  //   Projects.FLUTTER_CATALOG,
  //   Projects.DROP,
  //   Projects.ROAM,
  //   Projects.LOGIN_CATALOG,
  //   Projects.FOODY_BITE,
  //   Projects.NIMBUS,
  // ];
  //
  // static List<ProjectItemData> projects = <ProjectItemData>[
  //   Projects.DISNEY_PLUS,
  //   Projects.FLUTTER_CATALOG,
  //   Projects.DROP,
  //   Projects.ROAM,
  //   Projects.LOGIN_CATALOG,
  //   Projects.FOODY_BITE,
  //   Projects.NIMBUS,
  //   Projects.OTP_TEXT_FIELD,
  //   Projects.AERIUM,
  //   Projects.AERIUM_V2,
  //   Projects.OUTFITR,
  // ];
//
//   static List<NoteWorthyProjectDetails> noteworthyProjects = <NoteWorthyProjectDetails>[
//     NoteWorthyProjectDetails(
//       projectName: StringConst.UDAGRAM_IMAGE_FILTERING,
//       isPublic: true,
//       isOnPlayStore: false,
//       isWeb: false,
//       technologyUsed: StringConst.UDAGRAM_IMAGE_FILTERING_TECH,
//       projectDescription: StringConst.UDAGRAM_IMAGE_FILTERING_DETAIL,
//       gitHubUrl: StringConst.UDAGRAM_IMAGE_FILTERING_GITHUB_URL,
//       isLive: false,
//     ),
//     NoteWorthyProjectDetails(
//       projectName: StringConst.SERVERLESS_TODO,
//       isPublic: true,
//       isOnPlayStore: false,
//       isWeb: false,
//       technologyUsed: StringConst.SERVERLESS_TODO_TECH,
//       projectDescription: StringConst.SERVERLESS_TODO_DETAIL,
//       gitHubUrl: StringConst.SERVERLESS_TODO_GITHUB_URL,
//       isLive: false,
//     ),
//     NoteWorthyProjectDetails(
//       projectName: StringConst.PYTHON_ALGORITHMS,
//       isPublic: true,
//       isOnPlayStore: false,
//       isWeb: false,
//       technologyUsed: StringConst.PYTHON,
//       projectDescription: StringConst.PYTHON_ALGORITHMS_DETAIL,
//       gitHubUrl: StringConst.PYTHON_ALGORITHMS_GITHUB_URL,
//       isLive: false,
//     ),
//     NoteWorthyProjectDetails(
//       projectName: StringConst.PROGRAMMING_FOR_DATA_SCIENCE,
//       isPublic: true,
//       isOnPlayStore: false,
//       isWeb: false,
//       technologyUsed: StringConst.PYTHON,
//       projectDescription: StringConst.PROGRAMMING_FOR_DATA_SCIENCE_DETAIL,
//       gitHubUrl: StringConst.PROGRAMMING_FOR_DATA_SCIENCE_GITHUB_URL,
//       isLive: false,
//     ),
//     NoteWorthyProjectDetails(
//       projectName: StringConst.ONBOARDING_APP,
//       isPublic: true,
//       isOnPlayStore: false,
//       isWeb: false,
//       technologyUsed: StringConst.FLUTTER,
//       projectDescription: StringConst.ONBOARDING_APP_DETAIL,
//       gitHubUrl: StringConst.ONBOARDING_APP_GITHUB_URL,
//       isLive: false,
//     ),
//     NoteWorthyProjectDetails(
//       projectName: StringConst.FINOPP,
//       isPublic: true,
//       isOnPlayStore: false,
//       isWeb: false,
//       technologyUsed: StringConst.FLUTTER,
//       projectDescription: StringConst.FINOPP_DETAIL,
//       gitHubUrl: StringConst.FINOPP_GITHUB_URL,
//       isLive: false,
//     ),
//     NoteWorthyProjectDetails(
//       projectName: StringConst.AMOR_APP,
//       isPublic: true,
//       isOnPlayStore: false,
//       isWeb: true,
//       technologyUsed: StringConst.FLUTTER,
//       projectDescription: StringConst.AMOR_APP_DETAIL,
//       gitHubUrl: StringConst.AMOR_APP_GITHUB_URL,
//       webUrl: StringConst.AMOR_APP_WEB_URL,
//       isLive: true,
//     ),
//   ];
//
//   // static List<CertificationData> certificationData = [];
//
  static final List<ExperienceData> experienceData = <ExperienceData>[
    ExperienceData(
      company: StringConst.EXPERIENCE_3,
      position: StringConst.EXPERIENCE_3_POSITION,
      companyUrl: StringConst.EXPERIENCE_3_URL,
      roles: <String>[
        StringConst.EXPERIENCE_3_ROLE_1,
        StringConst.EXPERIENCE_3_ROLE_2,
        StringConst.EXPERIENCE_3_ROLE_3,
        StringConst.EXPERIENCE_3_ROLE_4,
        StringConst.EXPERIENCE_3_ROLE_5,
      ],
      location: StringConst.EXPERIENCE_3_LOCATION,
      duration: StringConst.EXPERIENCE_3_DURATION,
    ),
    ExperienceData(
      company: StringConst.EXPERIENCE_2,
      position: StringConst.EXPERIENCE_2_POSITION,
      companyUrl: StringConst.EXPERIENCE_2_URL,
      roles: <String>[
        StringConst.EXPERIENCE_2_ROLE_1,
        StringConst.EXPERIENCE_2_ROLE_2,
        StringConst.EXPERIENCE_2_ROLE_3,
      ],
      location: StringConst.EXPERIENCE_2_LOCATION,
      duration: StringConst.EXPERIENCE_2_DURATION,
    ),
    ExperienceData(
      company: StringConst.EXPERIENCE_CAPS,
      position: StringConst.EXPERIENCE_1_POSITION,
      companyUrl: StringConst.EXPERIENCE_1_URL,
      roles: <String>[
        StringConst.EXPERIENCE_1_ROLE_1,
        StringConst.EXPERIENCE_1_ROLE_2,
        StringConst.EXPERIENCE_1_ROLE_3,
      ],
      location: StringConst.EXPERIENCE_1_LOCATION,
      duration: StringConst.EXPERIENCE_1_DURATION,
    ),
  ];

  static final List<PrivacyPolicyData> privacyPolicyData = <PrivacyPolicyData>[
    PrivacyPolicyData(content: StringConst.PARAGRAPH1),
    PrivacyPolicyData(content: StringConst.PARAGRAPH2),
    PrivacyPolicyData(content: StringConst.PARAGRAPH3),
    PrivacyPolicyData(title: StringConst.HEADER1, content: StringConst.PARAGRAPH4),
    PrivacyPolicyData(title: StringConst.HEADER2, content: StringConst.PARAGRAPH5),
    PrivacyPolicyData(content: StringConst.PARAGRAPH6),
    PrivacyPolicyData(content: StringConst.PARAGRAPH7),
    PrivacyPolicyData(title: StringConst.HEADER3, content: StringConst.PARAGRAPH8),
    PrivacyPolicyData(content: StringConst.LIST1),
    PrivacyPolicyData(title: StringConst.HEADER4, content: StringConst.PARAGRAPH9),
    PrivacyPolicyData(title: StringConst.HEADER5, content: StringConst.PARAGRAPH10),
    PrivacyPolicyData(content: StringConst.PARAGRAPH11),
    PrivacyPolicyData(content: StringConst.PARAGRAPH12),
    PrivacyPolicyData(title: StringConst.HEADER6, content: StringConst.PARAGRAPH13),
    PrivacyPolicyData(content: StringConst.PARAGRAPH14),
    PrivacyPolicyData(title: StringConst.HEADER7, content: StringConst.PARAGRAPH15),
    PrivacyPolicyData(content: StringConst.LIST2),
    PrivacyPolicyData(title: StringConst.HEADER8, content: StringConst.PARAGRAPH16),
    PrivacyPolicyData(content: StringConst.LIST3),
    PrivacyPolicyData(title: StringConst.HEADER9, content: StringConst.PARAGRAPH17),
    PrivacyPolicyData(content: StringConst.PARAGRAPH18),
    PrivacyPolicyData(title: StringConst.HEADER10, content: StringConst.PARAGRAPH19),
    PrivacyPolicyData(content: StringConst.PARAGRAPH20),
    PrivacyPolicyData(title: StringConst.HEADER11, content: StringConst.PARAGRAPH21),
  ];

// }
//
// class Projects {
//   static ProjectItemData DISNEY_PLUS = ProjectItemData(
//     title: StringConst.DISNEY_PLUS,
//     subtitle: StringConst.DISNEY_PLUS,
//     platform: StringConst.DISNEY_PLUS_PLATFORM,
//     primaryColor: AppColors.disneyPlus,
//     image: ImagePath.DISNEY_PLUS_COVER,
//     coverUrl: ImagePath.DISNEY_PLUS_SCREENS,
//     navSelectedTitleColor: AppColors.flutterCatalogSelectedNavTitle,
//     appLogoColor: AppColors.flutterCatalogAppLogo,
//     projectAssets: <String>[
//       ImagePath.DISNEY_PLUS_1,
//       ImagePath.DISNEY_PLUS_2,
//       ImagePath.DISNEY_PLUS_3,
//       ImagePath.DISNEY_PLUS_4,
//       ImagePath.DISNEY_PLUS_5,
//       ImagePath.DISNEY_PLUS_6,
//       ImagePath.DISNEY_PLUS_7,
//       ImagePath.DISNEY_PLUS_8,
//       ImagePath.DISNEY_PLUS_9,
//       ImagePath.DISNEY_PLUS_10,
//       ImagePath.DISNEY_PLUS_11,
//       ImagePath.DISNEY_PLUS_12,
//       ImagePath.DISNEY_PLUS_13,
//     ],
//     category: StringConst.DISNEY_PLUS_CATEGORY,
//     portfolioDescription: StringConst.DISNEY_PLUS_DETAIL,
//     isPublic: true,
//     isOnPlayStore: false,
//     technologyUsed: StringConst.JETPACK_COMPOSE,
//     gitHubUrl: StringConst.DISNEY_PLUS_GITHUB_URL,
//     playStoreUrl: StringConst.DISNEY_PLUS_PLAYSTORE_URL,
//   );
//   static ProjectItemData FLUTTER_CATALOG = ProjectItemData(
//     title: StringConst.FLUTTER_CATALOG,
//     subtitle: StringConst.FLUTTER_CATALOG,
//     platform: StringConst.FLUTTER_CATALOG_PLATFORM,
//     primaryColor: AppColors.flutter_catalog,
//     image: ImagePath.FLUTTER_CATALOG_COVER,
//     coverUrl: ImagePath.FLUTTER_CATALOG_COVER,
//     navSelectedTitleColor: AppColors.flutterCatalogSelectedNavTitle,
//     appLogoColor: AppColors.flutterCatalogAppLogo,
//     projectAssets: <String>[
//       ImagePath.FLUTTER_CATALOG_SCREENS,
//       ImagePath.FLUTTER_CATALOG_1,
//       ImagePath.FLUTTER_CATALOG_2,
//       ImagePath.FLUTTER_CATALOG_3,
//       ImagePath.FLUTTER_CATALOG_4,
//       ImagePath.FLUTTER_CATALOG_5,
//     ],
//     category: StringConst.FLUTTER_CATALOG_CATEGORY,
//     portfolioDescription: StringConst.FLUTTER_CATALOG_DETAIL,
//     isPublic: true,
//     isOnPlayStore: true,
//     technologyUsed: StringConst.FLUTTER,
//     gitHubUrl: StringConst.FLUTTER_CATALOG_GITHUB_URL,
//     playStoreUrl: StringConst.FLUTTER_CATALOG_PLAYSTORE_URL,
//   );
//   static ProjectItemData DROP = ProjectItemData(
//     title: StringConst.DROP,
//     subtitle: StringConst.DROP,
//     platform: StringConst.DROP_PLATFORM,
//     primaryColor: AppColors.drop,
//     image: ImagePath.DROP_COVER,
//     category: StringConst.DROP_CATEGORY,
//     designer: StringConst.DROP_DESIGNER,
//     coverUrl: ImagePath.DROP_COVER,
//     navTitleColor: AppColors.dropNavTitle,
//     navSelectedTitleColor: AppColors.dropSelectedNavTitle,
//     appLogoColor: AppColors.dropAppLogo,
//     projectAssets: <String>[
//       ImagePath.DROP_DESC,
//       ImagePath.DROP_FLOW_CHART,
//       ImagePath.DROP_WIREFRAMES,
//       ImagePath.DROP_MINIMAL_DESIGN,
//       ImagePath.DROP_EASY_ACCESS,
//       ImagePath.DROP_SIMPLE,
//       ImagePath.DROP_THANKS,
//     ],
//     portfolioDescription: StringConst.DROP_DETAIL,
//     isPublic: true,
//     isOnPlayStore: true,
//     technologyUsed: StringConst.FLUTTER,
//     gitHubUrl: StringConst.DROP_GITHUB_URL,
//     playStoreUrl: StringConst.DROP_PLAYSTORE_URL,
//   );
//   static ProjectItemData ROAM = ProjectItemData(
//     title: StringConst.ROAM,
//     subtitle: StringConst.ROAM,
//     primaryColor: AppColors.roam,
//     category: StringConst.ROAM_CATEGORY,
//     designer: StringConst.ROAM_DESIGNER,
//     platform: StringConst.ROAM_PLATFORM,
//     image: ImagePath.ROAM_COVER,
//     coverUrl: ImagePath.ROAM_COVER,
//     navTitleColor: AppColors.roamNavTitle,
//     navSelectedTitleColor: AppColors.roamSelectedNavTitle,
//     appLogoColor: AppColors.roamAppLogo,
//     projectAssets: <String>[
//       ImagePath.ROAM_OVERALL,
//       ImagePath.ROAM_ONBOARDING,
//       ImagePath.ROAM_HOME,
//       ImagePath.ROAM_EXPLORE,
//       ImagePath.ROAM_PROFILE,
//       ImagePath.ROAM_FLOW_CHART,
//       ImagePath.ROAM_WIREFRAMES_1,
//       ImagePath.ROAM_WIREFRAMES_2,
//       ImagePath.ROAM_WIREFRAMES_3,
//     ],
//     portfolioDescription: StringConst.ROAM_DETAIL,
//     isPublic: true,
//     isOnPlayStore: true,
//     technologyUsed: StringConst.FLUTTER,
//     gitHubUrl: StringConst.ROAM_GITHUB_URL,
//     playStoreUrl: StringConst.ROAM_PLAYSTORE_URL,
//   );
//   static ProjectItemData LOGIN_CATALOG = ProjectItemData(
//     title: StringConst.LOGIN_CATALOG,
//     primaryColor: AppColors.login_catalog,
//     subtitle: StringConst.LOGIN_CATALOG,
//     category: StringConst.LOGIN_CATALOG_CATEGORY,
//     platform: StringConst.LOGIN_CATALOG_PLATFORM,
//     image: ImagePath.LOGIN_CATALOG_COVER,
//     coverUrl: ImagePath.LOGIN_CATALOG_COVER,
//     portfolioDescription: StringConst.LOGIN_CATALOG_DETAIL,
//     navTitleColor: AppColors.loginCatalogNavTitle,
//     navSelectedTitleColor: AppColors.loginCatalogSelectedNavTitle,
//     appLogoColor: AppColors.loginCatalogAppLogo,
//     projectAssets: <String>[
//       ImagePath.LOGIN_DESIGN_4,
//       ImagePath.LOGIN_DESIGN_5,
//       ImagePath.LOGIN_DESIGN_7,
//       ImagePath.LOGIN_DESIGN_8,
//       ImagePath.LOGIN_DESIGN_9,
//     ],
//     isPublic: true,
//     isOnPlayStore: true,
//     technologyUsed: StringConst.FLUTTER,
//     gitHubUrl: StringConst.LOGIN_CATALOG_GITHUB_URL,
//     playStoreUrl: StringConst.LOGIN_CATALOG_PLAYSTORE_URL,
//   );
//   static ProjectItemData FOODY_BITE = ProjectItemData(
//     title: StringConst.FOODY_BITE,
//     subtitle: StringConst.FOODY_BITE_SUBTITLE,
//     category: StringConst.FOODY_BITE_CATEGORY,
//     designer: StringConst.FOODY_BITE_DESIGNER,
//     primaryColor: AppColors.foodybite,
//     platform: StringConst.FOODY_BITE_PLATFORM,
//     image: ImagePath.FOODY_BITE_COVER,
//     coverUrl: ImagePath.FOODY_BITE_COVER,
//     navTitleColor: AppColors.foodybiteNavTitle,
//     navSelectedTitleColor: AppColors.foodybiteSelectedNavTitle,
//     appLogoColor: AppColors.foodybiteAppLogo,
//     projectAssets: <String>[
//       ImagePath.FOODY_BITE_HOME,
//       ImagePath.FOODY_BITE_STARTING_FLOW,
//       ImagePath.FOODY_BITE_HOME_FLOW,
//       ImagePath.FOODY_BITE_REVIEW_FLOW,
//       ImagePath.FOODY_BITE_TYPOGRAPHY,
//     ],
//     portfolioDescription: StringConst.FOODY_BITE_DETAIL,
//     isPublic: true,
//     isOnPlayStore: true,
//     technologyUsed: StringConst.FLUTTER,
//     gitHubUrl: StringConst.FOODY_BITE_GITHUB_URL,
//     playStoreUrl: StringConst.FOODY_BITE_PLAYSTORE_URL,
//   );
//   static ProjectItemData NIMBUS = ProjectItemData(
//     title: StringConst.NIMBUS,
//     subtitle: StringConst.NIMBUS,
//     primaryColor: AppColors.nimbus,
//     platform: StringConst.NIMBUS_PLATFORM,
//     category: StringConst.NIMBUS_CATEGORY,
//     designer: StringConst.NIMBUS_DESIGNER,
//     image: ImagePath.NIMBUS_COVER,
//     coverUrl: ImagePath.NIMBUS_COVER,
//     navTitleColor: AppColors.nimbusNavTitle,
//     navSelectedTitleColor: AppColors.nimbusSelectedNavTitle,
//     projectAssets: <String>[
//       ImagePath.NIMBUS,
//     ],
//     portfolioDescription: StringConst.NIMBUS_DETAIL,
//     isPublic: true,
//     isOnPlayStore: false,
//     isLive: true,
//     technologyUsed: StringConst.FLUTTER,
//     gitHubUrl: StringConst.NIMBUS_GITHUB_URL,
//     webUrl: StringConst.NIMBUS_WEB_URL,
//   );
//   static ProjectItemData OTP_TEXT_FIELD = ProjectItemData(
//     title: StringConst.OTP_TEXT_FIELD,
//     subtitle: StringConst.OTP_TEXT_FIELD_SUBTITLE,
//     category: StringConst.OTP_TEXT_FIELD_CATEGORY,
//     primaryColor: AppColors.otp_package,
//     platform: StringConst.OTP_TEXT_FIELD_PLATFORM,
//     image: ImagePath.OTP_TEXTFIELD_COVER,
//     coverUrl: ImagePath.OTP_TEXTFIELD_COVER,
//     portfolioDescription: StringConst.OTP_TEXT_FIELD_DETAIL,
//     navTitleColor: AppColors.otpPackageNavTitle,
//     navSelectedTitleColor: AppColors.otpPackageSelectedNavTitle,
//     appLogoColor: AppColors.otpPackageAppLogo,
//     isPublic: true,
//     isLive: true,
//     technologyUsed: StringConst.FLUTTER,
//     gitHubUrl: StringConst.OTP_TEXT_FIELD_GITHUB_URL,
//     webUrl: StringConst.OTP_TEXT_FIELD_WEB_URL,
//   );
//   static ProjectItemData AERIUM = ProjectItemData(
//     title: StringConst.AERIUM,
//     subtitle: StringConst.AERIUM_SUBTITLE,
//     primaryColor: AppColors.aerium_v1,
//     platform: StringConst.AERIUM_PLATFORM,
//     category: StringConst.AERIUM_CATEGORY,
//     designer: StringConst.AERIUM_DESIGNER,
//     image: ImagePath.AERIUM_COVER,
//     coverUrl: ImagePath.AERIUM_COVER,
//     navTitleColor: AppColors.aeriumV1NavTitle,
//     projectAssets: <String>[
//       ImagePath.AERIUM_COVER,
//       ImagePath.AERIUM_DESIGN_2,
//       ImagePath.AERIUM_DESIGN_3,
//     ],
//     portfolioDescription: StringConst.AERIUM_DETAIL,
//     isPublic: true,
//     isLive: true,
//     technologyUsed: StringConst.FLUTTER,
//     gitHubUrl: StringConst.AERIUM_GITHUB_URL,
//     webUrl: StringConst.AERIUM_WEB_URL,
//   );
//   static ProjectItemData AERIUM_V2 = ProjectItemData(
//     title: StringConst.AERIUM_V2,
//     subtitle: StringConst.AERIUM_V2_SUBTITLE,
//     category: StringConst.AERIUM_V2_CATEGORY,
//     designer: StringConst.AERIUM_V2_DESIGNER,
//     primaryColor: AppColors.aerium_v1,
//     platform: StringConst.AERIUM_V2_PLATFORM,
//     image: ImagePath.AERIUM_V2_LAST,
//     coverUrl: ImagePath.AERIUM_V2_LAST,
//     portfolioDescription: StringConst.AERIUM_V2_DETAIL,
//     projectAssets: <String>[
//       ImagePath.AERIUM_V2_OVERALL,
//       ImagePath.AERIUM_V2_FIRST,
//       ImagePath.AERIUM_V2_TYPOGRAPHY,
//       ImagePath.AERIUM_V2_LAST,
//     ],
//     isPublic: true,
//     isLive: true,
//     technologyUsed: StringConst.FLUTTER,
//     gitHubUrl: StringConst.AERIUM_V2_GITHUB_URL,
//     webUrl: StringConst.AERIUM_V2_WEB_URL,
//   );
//   static ProjectItemData OUTFITR = ProjectItemData(
//     title: StringConst.OUTFITR,
//     subtitle: StringConst.OUTFITR_SUBTITLE,
//     category: StringConst.OUTFITR_CATEGORY,
//     primaryColor: AppColors.outfitr,
//     platform: StringConst.OUTFITR_PLATFORM,
//     image: ImagePath.OUTFITR_COVER,
//     coverUrl: ImagePath.OUTFITR_1,
//     portfolioDescription: StringConst.OUTFITR_DETAIL,
//     navTitleColor: AppColors.outfitrNavTitle,
//     navSelectedTitleColor: AppColors.outfitrSelectedNavTitle,
//     appLogoColor: AppColors.outfitrAppLogo,
//     projectAssets: <String>[
//       ImagePath.OUTFITR_2,
//       ImagePath.OUTFITR_4,
//       ImagePath.OUTFITR_5,
//       ImagePath.OUTFITR_6,
//     ],
//     isPublic: true,
//     technologyUsed: StringConst.FLUTTER,
//     gitHubUrl: StringConst.OUTFITR_GITHUB_URL,
//     webUrl: StringConst.OUTFITR_WEB_URL,
//   );
}
