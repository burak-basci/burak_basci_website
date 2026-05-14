import 'package:flutter/material.dart';

import '../widgets/project_item/project_item.dart';

const String _d = 'assets/images/projects';

final List<ProjectItemData> recentWorks = <ProjectItemData>[
  ProjectItemData(
    title: 'Patent AI Search',
    subtitle: 'Hybrid semantic search engine',
    category: 'AI / SEARCH',
    platform: 'Web',
    primaryColor: const Color(0xFF1E3A8A),
    image: '$_d/patent-search/cover.png',
    coverUrl: '$_d/patent-search/cover.png',
    technologyUsed: 'Flutter Web · Django · ElasticSearch · Vector Embeddings',
    portfolioDescription:
        'Production AI patent search tool currently scaled across 3 '
        'departments and serving 50+ internal engineers. Hybrid semantic + '
        'keyword retrieval over a tuned ElasticSearch index with A/B-tested '
        'ranking. 25% precision lift, 40% faster time-to-discovery.',
    isPublic: false,
    isLive: true,
  ),
  ProjectItemData(
    title: 'Sovereign Cloud Platform',
    subtitle: 'Production k3s on Hetzner',
    category: 'DEVSECOPS / CLOUD',
    platform: 'Hetzner Cloud',
    primaryColor: const Color(0xFFEA580C),
    image: '$_d/k3s/cover.png',
    coverUrl: '$_d/k3s/cover.png',
    technologyUsed: 'k3s · Terraform · ArgoCD · Traefik · Prometheus · Grafana',
    portfolioDescription:
        'Sovereign Kubernetes platform on Hetzner Cloud running 15+ '
        'self-hosted services for a 700+ unit real-estate portfolio. '
        'Terraform-as-Code provisioning, ArgoCD-driven GitOps, '
        'Prometheus/Grafana observability. Cut provisioning lead time from '
        '4 days to 45 minutes and OPEX by €20k/year.',
    isPublic: false,
    isLive: true,
  ),
  ProjectItemData(
    title: 'LLM Email Automation',
    subtitle: 'Intent-based triage service',
    category: 'AI / AUTOMATION',
    platform: 'Backend',
    primaryColor: const Color(0xFF7C3AED),
    image: '$_d/llm-mail/cover.png',
    coverUrl: '$_d/llm-mail/cover.png',
    technologyUsed: 'FastAPI · RAG · Vector Search · Hardened Podman',
    portfolioDescription:
        'LLM-powered automation service built on FastAPI with a RAG '
        'pipeline for intent classification on inbound mail. Lifted '
        'throughput by 80%, kept 95% accuracy, and freed roughly 8 '
        'engineering-hours per week from manual triage.',
    isPublic: false,
    isLive: true,
  ),
  ProjectItemData(
    title: 'Utopia Community',
    subtitle: 'Environmental Web3 platform',
    category: 'WEB3 / CHARITY',
    platform: 'iOS · Android · Web',
    primaryColor: const Color(0xFF16A34A),
    image: '$_d/utopia/cover.png',
    coverUrl: '$_d/utopia/cover.png',
    technologyUsed: 'Flutter · Solidity · Polygon · Firebase',
    portfolioDescription:
        'Cross-platform app + Polygon-backed ERC-20 token for environmental '
        'and charitable causes. Technical Lead on a remote agile team of '
        'two; shipped a feature-complete MVP in 12 months and demoed at the '
        'KUER.NRW Green Entrepreneurship Fair to 20+ stakeholders.',
    isPublic: false,
    isLive: true,
  ),
  ProjectItemData(
    title: 'Night-Detection Thesis',
    subtitle: 'Synthetic data for YOLOv8',
    category: 'ML / RESEARCH',
    platform: 'Unreal · Python',
    primaryColor: const Color(0xFF1E1B4B),
    image: '$_d/thesis-night/cover.png',
    coverUrl: '$_d/thesis-night/cover.png',
    technologyUsed: 'Unreal Engine (C++) · NVIDIA NDDS · YOLOv8 · Python',
    portfolioDescription:
        'B.Sc. thesis (1.3) and research paper on CNN-based night-time '
        'object detection. Built a high-fidelity Unreal Engine simulation '
        'with an automated labelling pipeline that eliminated 100% of '
        'manual annotation effort across 6,000+ training samples.',
    isPublic: false,
    isLive: false,
  ),
  ProjectItemData(
    title: 'VR Anxiety Trainer',
    subtitle: '1st place — TU Startup Weekend',
    category: 'VR / HEALTHCARE',
    platform: 'Meta Quest',
    primaryColor: const Color(0xFF6D28D9),
    image: '$_d/vr-anxiety/cover.png',
    coverUrl: '$_d/vr-anxiety/cover.png',
    technologyUsed: 'Unreal Engine · Blueprints · VR',
    portfolioDescription:
        'VR exposure-therapy prototype for social anxiety treatment. Won '
        '1st place at the TU Dortmund Startup Weekend 2023, outperforming '
        '9 competing teams in technical execution and market validation.',
    isPublic: false,
    isLive: false,
  ),
  ProjectItemData(
    title: 'Durak Multiplayer',
    subtitle: 'Cross-platform card game',
    category: 'GAME / MOBILE',
    platform: 'iOS · Android · Web · Desktop',
    primaryColor: const Color(0xFFDC2626),
    image: '$_d/durak/cover.png',
    coverUrl: '$_d/durak/cover.png',
    technologyUsed: 'Flutter · Firebase · Cloud Functions',
    portfolioDescription:
        'High-performance multiplayer Durak card game shipped to six '
        'platforms from a single Flutter codebase at 60 FPS with custom '
        'rendering logic. Realtime game state and persistence on Firebase '
        'Cloud Functions + Firestore.',
    isPublic: false,
    isLive: false,
  ),
  ProjectItemData(
    title: 'Home Assistant Edge',
    subtitle: 'Self-sovereign edge stack',
    category: 'EDGE / SELF-HOSTED',
    platform: 'Proxmox · HAOS',
    primaryColor: const Color(0xFF18BCF2),
    image: '$_d/home-assistant/cover.png',
    coverUrl: '$_d/home-assistant/cover.png',
    technologyUsed: 'Proxmox · OpenWRT · openSUSE · Home Assistant OS',
    portfolioDescription:
        'Self-sovereign edge infrastructure: Proxmox host, OpenWRT '
        'networking, openSUSE workloads, Home Assistant OS, and a local AI '
        'voice assistant with a custom wake word and offline LLM inference. '
        'Everything runs on-device.',
    isPublic: false,
    isLive: false,
  ),
  ProjectItemData(
    title: 'Local AI Voice Assistant',
    subtitle: 'Offline LLM + custom wake word',
    category: 'AI / EDGE',
    platform: 'Linux',
    primaryColor: const Color(0xFF14B8A6),
    image: '$_d/voice-assistant/cover.png',
    coverUrl: '$_d/voice-assistant/cover.png',
    technologyUsed: 'Whisper · Local LLM · Piper TTS · openWakeWord',
    portfolioDescription:
        'Privacy-first voice assistant running entirely on-device: custom '
        'wake-word detection, offline speech-to-text, local LLM inference '
        'and on-device voice synthesis. No round-trip to the cloud.',
    isPublic: false,
    isLive: false,
  ),
  ProjectItemData(
    title: 'Shop Automation Pipeline',
    subtitle: 'shop.burakbasci.de',
    category: 'AUTOMATION / E-COMMERCE',
    platform: 'Web',
    primaryColor: const Color(0xFFF59E0B),
    image: '$_d/shop-automation/cover.png',
    coverUrl: '$_d/shop-automation/cover.png',
    technologyUsed: 'Python · Stable Diffusion · MidJourney · Printify · WooCommerce',
    portfolioDescription:
        'Fully automated product generation and upload pipeline. AI-'
        'generated designs are placed on print-on-demand products and '
        'pushed to the storefront, end-to-end, without manual touch.',
    isPublic: true,
    isLive: true,
    webUrl: 'https://shop.burakbasci.de',
  ),
  ProjectItemData(
    title: 'ImmoPilot',
    subtitle: 'Real-estate SaaS suite',
    category: 'B2B / SAAS',
    platform: 'Web · iOS · Android',
    primaryColor: const Color(0xFF334155),
    image: '$_d/immopilot/cover.png',
    coverUrl: '$_d/immopilot/cover.png',
    technologyUsed: 'Flutter · Django · Postgres · k3s',
    portfolioDescription:
        'Closed-source SaaS platform for property managers: tenant '
        'communication, document handling, accounting integrations, and '
        'workflow automation. Deployed on the sovereign k3s platform.',
    isPublic: false,
    isLive: true,
  ),
  ProjectItemData(
    title: 'CaterSmart',
    subtitle: 'Catering operations app',
    category: 'B2B / OPERATIONS',
    platform: 'iOS · Android · Web',
    primaryColor: const Color(0xFF65A30D),
    image: '$_d/catersmart/cover.png',
    coverUrl: '$_d/catersmart/cover.png',
    technologyUsed: 'Flutter · Firebase · Cloud Functions',
    portfolioDescription:
        'Operations app for a catering business: order intake, stock and '
        'staff scheduling, on-the-day delivery routing. Shipped to three '
        'platforms from a single Flutter codebase.',
    isPublic: false,
    isLive: false,
  ),
  ProjectItemData(
    title: 'NestNode',
    subtitle: 'Smart-home control app',
    category: 'IOT / MOBILE',
    platform: 'iOS · Android',
    primaryColor: const Color(0xFF0891B2),
    image: '$_d/nestnode/cover.png',
    coverUrl: '$_d/nestnode/cover.png',
    technologyUsed: 'Flutter · MQTT · Home Assistant',
    portfolioDescription:
        'Mobile front-end for a self-hosted Home Assistant deployment: '
        'lights, climate, energy and security controls in a tactile, '
        'fast-responding UI. Talks to MQTT directly from the device.',
    isPublic: false,
    isLive: false,
  ),
  ProjectItemData(
    title: 'Open Design',
    subtitle: 'Freelance design service',
    category: 'CLIENT / DESIGN',
    platform: 'Web',
    primaryColor: const Color(0xFFD946EF),
    image: '$_d/open-design/cover.png',
    coverUrl: '$_d/open-design/cover.png',
    technologyUsed: 'Figma · Flutter Web · Branding',
    portfolioDescription:
        'Identity and Flutter-Web frontend for an independent design '
        'practice — landing page, portfolio gallery and contact flow built '
        'from a single brand system.',
    isPublic: false,
    isLive: false,
  ),
  ProjectItemData(
    title: 'Custom Client Platform',
    subtitle: 'Freelance backend + admin',
    category: 'CLIENT / FULL-STACK',
    platform: 'Web',
    primaryColor: const Color(0xFF475569),
    image: '$_d/freelance/cover.png',
    coverUrl: '$_d/freelance/cover.png',
    technologyUsed: 'Django · Postgres · Docker · Flutter Web',
    portfolioDescription:
        'Full-stack freelance build for a private client: domain-specific '
        'admin dashboard, role-based access, and a customer-facing portal '
        'wired to a Django backend.',
    isPublic: false,
    isLive: false,
  ),
  ProjectItemData(
    title: 'PSCoat',
    subtitle: 'Coatings business front-end',
    category: 'CLIENT / WEB',
    platform: 'Web',
    primaryColor: const Color(0xFF0F172A),
    image: '$_d/pscoat/cover.png',
    coverUrl: '$_d/pscoat/cover.png',
    technologyUsed: 'Next.js · Tailwind · WordPress headless',
    portfolioDescription:
        'Marketing site and lead-gen funnel for a coatings/refinishing '
        'business. Headless WordPress for content, Next.js for the public '
        'site, simple analytics piped into the dashboard.',
    isPublic: false,
    isLive: false,
  ),
  ProjectItemData(
    title: 'Theater Website',
    subtitle: 'Programme & ticketing',
    category: 'CLIENT / WEB',
    platform: 'Web',
    primaryColor: const Color(0xFF7E22CE),
    image: '$_d/theater/cover.png',
    coverUrl: '$_d/theater/cover.png',
    technologyUsed: 'Next.js · CMS · Tailwind',
    portfolioDescription:
        'Public website for a local theater: programme listings, '
        'season-pass tickets, accessibility-first design and a low-friction '
        'CMS for the artistic team.',
    isPublic: false,
    isLive: false,
  ),
  ProjectItemData(
    title: 'burakbasci_widgets',
    subtitle: 'Flutter package on pub.dev',
    category: 'OPEN SOURCE / PACKAGE',
    platform: 'Flutter',
    primaryColor: const Color(0xFF02569B),
    image: '$_d/widgets-pkg/cover.png',
    coverUrl: '$_d/widgets-pkg/cover.png',
    technologyUsed: 'Dart · Flutter',
    portfolioDescription:
        'Reusable widget library published on pub.dev: animation, layout '
        'and UI primitives extracted from real production projects.',
    isPublic: true,
    isLive: true,
    webUrl: 'https://pub.dev/packages/burakbasci_widgets',
  ),
  ProjectItemData(
    title: 'WordPress Plugins',
    subtitle: 'Open-source utilities',
    category: 'OPEN SOURCE / PHP',
    platform: 'WordPress',
    primaryColor: const Color(0xFF21759B),
    image: '$_d/wp-plugins/cover.png',
    coverUrl: '$_d/wp-plugins/cover.png',
    technologyUsed: 'PHP · WordPress · MySQL',
    portfolioDescription:
        'A handful of small open-source WordPress plugins written for '
        'freelance clients and released back to the community.',
    isPublic: true,
    isLive: false,
  ),
  ProjectItemData(
    title: 'Turtlebot Programming',
    subtitle: 'B.Sc. coursework',
    category: 'ROBOTICS / ROS',
    platform: 'Linux',
    primaryColor: const Color(0xFFB91C1C),
    image: '$_d/turtlebot/cover.png',
    coverUrl: '$_d/turtlebot/cover.png',
    technologyUsed: 'ROS · C++ · Linux',
    portfolioDescription:
        'Coursework at TU Dortmund: programming a TurtleBot with ROS in '
        'C++. SLAM exercises, motion control and signal handling on a '
        'real differential-drive robot.',
    isPublic: false,
    isLive: false,
  ),
  ProjectItemData(
    title: 'Object-Detection Paper',
    subtitle: 'Deep learning in simulated city',
    category: 'ML / RESEARCH',
    platform: 'Python',
    primaryColor: const Color(0xFF0E7490),
    image: '$_d/paper-citysim/cover.png',
    coverUrl: '$_d/paper-citysim/cover.png',
    technologyUsed: 'YOLOv8 · Unreal Engine · Python',
    portfolioDescription:
        'Scientific paper (graded 1.3) on the application and optimization '
        'of deep-learning object detection in a simulated urban environment '
        'from the perspective of a moving car.',
    isPublic: false,
    isLive: false,
  ),
  ProjectItemData(
    title: 'Flappy Griffon',
    subtitle: '3D ray-traced Flappy Bird',
    category: 'GAME / UNREAL',
    platform: 'Windows',
    primaryColor: const Color(0xFFF59E0B),
    image: '$_d/flappy-griffon/cover.png',
    coverUrl: '$_d/flappy-griffon/cover.png',
    technologyUsed: 'Unreal Engine · Blueprints · Ray Tracing',
    portfolioDescription:
        'Indie game: a 3D ray-traced re-imagining of Flappy Bird, shipped '
        'on itch.io.',
    isPublic: true,
    isLive: true,
    webUrl: 'https://burakbasci.itch.io/flappygriffon',
  ),
  ProjectItemData(
    title: 'MyJumpNRun',
    subtitle: 'Unreal Engine platformer',
    category: 'GAME / UNREAL',
    platform: 'Windows',
    primaryColor: const Color(0xFF65A30D),
    image: '$_d/jumpnrun/cover.png',
    coverUrl: '$_d/jumpnrun/cover.png',
    technologyUsed: 'Unreal Engine · Blueprints',
    portfolioDescription:
        'Personal Unreal Engine platformer built across multiple iterations '
        'to learn level design, character physics and Blueprint scripting.',
    isPublic: false,
    isLive: false,
  ),
  ProjectItemData(
    title: 'Unity Hackathon',
    subtitle: 'Game-jam prototype',
    category: 'GAME / UNITY',
    platform: 'Windows · Web',
    primaryColor: const Color(0xFF1F2937),
    image: '$_d/unity-hackathon/cover.png',
    coverUrl: '$_d/unity-hackathon/cover.png',
    technologyUsed: 'Unity · C# · Blender',
    portfolioDescription:
        'Small Unity prototype built under a weekend deadline at a game '
        'jam — concept, art pipeline, scripting and build, all from '
        'scratch.',
    isPublic: false,
    isLive: false,
  ),
  ProjectItemData(
    title: 'Steam Market Arbitrage',
    subtitle: 'Trading automation',
    category: 'AUTOMATION / FINANCE',
    platform: 'Linux',
    primaryColor: const Color(0xFF1B2838),
    image: '$_d/steam-market/cover.png',
    coverUrl: '$_d/steam-market/cover.png',
    technologyUsed: 'Python · Selenium · SQLite',
    portfolioDescription:
        'Personal-research bot that scrapes Steam Community Market listings '
        'and surfaces price discrepancies. Disciplined risk rules, '
        'rate-limited, sandboxed.',
    isPublic: false,
    isLive: false,
  ),
  ProjectItemData(
    title: 'CSFloat Sniper',
    subtitle: 'Marketplace scanner',
    category: 'AUTOMATION / RESEARCH',
    platform: 'Linux',
    primaryColor: const Color(0xFFEAB308),
    image: '$_d/csfloat/cover.png',
    coverUrl: '$_d/csfloat/cover.png',
    technologyUsed: 'Python · Playwright · Webhooks',
    portfolioDescription:
        'Marketplace scanner that watches new listings for price/condition '
        'mismatches and notifies a private channel. Built to learn '
        'browser-automation and event-driven Python.',
    isPublic: false,
    isLive: false,
  ),
  ProjectItemData(
    title: 'Image Upscaler',
    subtitle: 'GPU-accelerated batch tool',
    category: 'TOOL / ML',
    platform: 'Linux',
    primaryColor: const Color(0xFF9333EA),
    image: '$_d/image-upscaler/cover.png',
    coverUrl: '$_d/image-upscaler/cover.png',
    technologyUsed: 'Python · Real-ESRGAN · CUDA',
    portfolioDescription:
        'GPU-accelerated batch image-upscaling tool wired to a watch '
        'folder. Drop files, walk away, find them upscaled minutes later.',
    isPublic: false,
    isLive: false,
  ),
  ProjectItemData(
    title: 'Image Uploader',
    subtitle: 'Bulk-upload utility',
    category: 'TOOL / UTILITY',
    platform: 'Linux',
    primaryColor: const Color(0xFF0EA5E9),
    image: '$_d/image-uploader/cover.png',
    coverUrl: '$_d/image-uploader/cover.png',
    technologyUsed: 'Python · CDN APIs',
    portfolioDescription:
        'Small CLI utility for bulk-uploading and renaming images to a '
        'CDN with consistent slug rules. Built to keep the design pipeline '
        'fast.',
    isPublic: false,
    isLive: false,
  ),
  ProjectItemData(
    title: 'Django Canvas',
    subtitle: 'Programmatic image generator',
    category: 'TOOL / WEB',
    platform: 'Web',
    primaryColor: const Color(0xFF064E3B),
    image: '$_d/django-canva/cover.png',
    coverUrl: '$_d/django-canva/cover.png',
    technologyUsed: 'Django · Pillow · PostgreSQL',
    portfolioDescription:
        'Django service that renders branded social cards and product '
        'images from JSON. Used internally to produce the shop pipeline '
        'art at scale.',
    isPublic: false,
    isLive: false,
  ),
  ProjectItemData(
    title: 'burakbasci.de',
    subtitle: 'This portfolio site',
    category: 'WEB / PERSONAL',
    platform: 'Flutter Web',
    primaryColor: const Color(0xFF363636),
    image: '$_d/this-site/cover.png',
    coverUrl: '$_d/this-site/cover.png',
    technologyUsed: 'Flutter Web · GitHub Pages',
    portfolioDescription:
        'The site you are reading. Flutter Web, deployed to GitHub Pages '
        'with a custom domain. Source heavily restructured from David '
        "Cobbina's portfolio template.",
    isPublic: true,
    isLive: true,
    webUrl: 'https://www.burakbasci.de',
    gitHubUrl: 'https://github.com/burak-basci/burak_basci_website',
  ),
];

/// Subset shown on the home page "selection of recent work" — top picks only.
final List<ProjectItemData> recentWorksHighlights = <ProjectItemData>[
  recentWorks[0], // Patent AI Search
  recentWorks[1], // Sovereign Cloud
  recentWorks[2], // LLM Email Automation
  recentWorks[3], // Utopia
  recentWorks[6], // Durak
  recentWorks[4], // Night-Detection Thesis
];
