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
        'ranking. 25% precision lift, 40% faster time-to-discovery. Authored '
        'the full UML/SysML system landscape, mapping 100% of '
        'infrastructure-to-code dependencies.',
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
    technologyUsed:
        'k3s · Terraform · ArgoCD · Traefik · Helm · Longhorn · PostgreSQL · MariaDB · Prometheus · Grafana',
    portfolioDescription:
        'Enterprise-grade Kubernetes platform on Hetzner Cloud: HA '
        'PostgreSQL/MariaDB, Longhorn distributed storage, automatic '
        'Let\'s Encrypt TLS, Helm-deployed services (WordPress, n8n, '
        'Outline, ...). GitOps with ArgoCD; Terraform-as-Code provisioning. '
        'Migrated 15+ legacy services to self-hosted alternatives, cut '
        'provisioning lead time from 4 days to 45 minutes (95% improvement) '
        'and OPEX by €20k/year for a 700+ unit real-estate portfolio.',
    isPublic: false,
    isLive: true,
  ),
  ProjectItemData(
    title: 'Postflow / beNotable',
    subtitle: 'Social-media SaaS for SMBs',
    category: 'SAAS / AI',
    platform: 'Web',
    primaryColor: const Color(0xFF0F766E),
    image: '$_d/postflow/cover.png',
    coverUrl: '$_d/postflow/cover.png',
    technologyUsed:
        'Next.js 15 · FastAPI · PostgreSQL 16 + pgvector · MinIO · Temporal · LangGraph · GitHub Copilot Pro',
    portfolioDescription:
        'Enterprise social-media-management SaaS that lets small businesses '
        'consistently post to 9 social networks in <15 minutes a day. '
        'Strict-TypeScript Next.js 15 frontend with shadcn/ui + TanStack '
        'Query; async FastAPI + SQLAlchemy 2 + Alembic backend; Temporal '
        'workflow engine; PostgreSQL 16 + pgvector + MinIO storage; AI '
        'content generation via LangGraph agents on GitHub Copilot Pro. '
        'Self-hosted on Hetzner with full GitLab CI/CD pipeline.',
    isPublic: false,
    isLive: true,
    webUrl: 'https://app.benotable.de',
  ),
  ProjectItemData(
    title: 'LuminaRep',
    subtitle: 'AI social-proof SaaS for clinics',
    category: 'SAAS / AI',
    platform: 'Web',
    primaryColor: const Color(0xFF047857),
    image: '$_d/luminarep/cover.png',
    coverUrl: '$_d/luminarep/cover.png',
    technologyUsed:
        'Next.js 15 · TypeScript · PostgreSQL · NextAuth · Google Gemini · Stripe · Tailwind',
    portfolioDescription:
        'Premium SaaS for medical-aesthetics and cosmetic-surgery clinics: '
        'auto-extracts 5-star Google Reviews and turns them into three '
        'Instagram caption variations + a TikTok script + Midjourney/DALL-E '
        'prompts using Gemini. Email/password auth, Stripe subscriptions '
        'with a 7-day trial, luxury dark mode UI (emerald + gold). Fully '
        'Dockerized, production deployment guide, self-hosted infrastructure.',
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
    technologyUsed:
        'Python · FastAPI · RAG · Vector DB · Pluggable Mistral/Claude/OpenAI',
    portfolioDescription:
        'Multi-provider LLM email-automation service. FastAPI microservice '
        'that classifies incoming mail into 11 categories, extracts '
        'structured data and drafts replies — with a human-in-the-loop '
        'control flow. EU-residency aware (GDPR), pluggable LLM backends '
        '(Mistral, Claude, OpenAI, local OpenWebUI) via a single config. '
        'Lifted throughput by 80%, kept 95% accuracy, freed ~8 '
        'engineering-hours/week from manual triage.',
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
    technologyUsed:
        'Flutter · Solidity 0.8 · OpenZeppelin · UUPS Proxy · Polygon · Firebase',
    portfolioDescription:
        'Cross-platform Flutter app + Polygon-backed upgradeable ERC-20 '
        '(UWCT) for environmental and charitable causes. Technical Lead on '
        'a remote agile team of two; shipped a feature-complete MVP in 12 '
        'months and demoed at the KUER.NRW Green Entrepreneurship Fair to '
        '20+ stakeholders. UUPS-style proxy pattern, burnable + pausable '
        'token.',
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
    technologyUsed:
        'Unreal Engine 5 (C++) · NVIDIA NDDS · Houdini · YOLOv8 · Python',
    portfolioDescription:
        'B.Sc. thesis (graded 1.3) and accompanying paper (1.3) on '
        'CNN-based night-time object detection. Built a high-fidelity '
        'Unreal Engine 5 city simulation with an automated labelling '
        'pipeline that eliminated 100% of manual annotation effort across '
        '6,000+ training samples. NVIDIA NDDS for synthetic-data generation; '
        'Houdini for procedural city; 5 critical lighting/environmental '
        'parameters identified.',
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
    technologyUsed: 'Unreal Engine 5 · Blueprints · OpenXR',
    portfolioDescription:
        'VR exposure-therapy prototype for social-anxiety treatment, set '
        'in a virtual opera house. Won 1st place at TU Dortmund Startup '
        'Weekend 2023, outperforming 9 competing teams on technical '
        'execution and market validation. Engineered the full Unreal Engine '
        ' 5 scene + interaction model in a weekend.',
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
    technologyUsed:
        'Flutter · Dart · GetX · WebSockets · PostgreSQL · Audioplayers',
    portfolioDescription:
        'Polished Flutter implementation of the classic Russian Durak: '
        'three AI difficulty levels (offline) and prepared online '
        'multiplayer via WebSockets. Custom rendering for 60 FPS across '
        'Android, iOS, Web, Windows, macOS and Linux. Dark/light themes, '
        'sound, drag-and-drop, four locales (EN/RU/TR/DE), 31 passing unit '
        'tests, Playwright E2E. Live at durak.burakbasci.de.',
    isPublic: false,
    isLive: true,
    webUrl: 'https://durak.burakbasci.de',
  ),
  ProjectItemData(
    title: 'Home Assistant Edge',
    subtitle: 'Self-sovereign edge stack',
    category: 'EDGE / SELF-HOSTED',
    platform: 'Proxmox · HAOS',
    primaryColor: const Color(0xFF18BCF2),
    image: '$_d/home-assistant/cover.png',
    coverUrl: '$_d/home-assistant/cover.png',
    technologyUsed:
        'Proxmox VE · OpenWRT · openSUSE · Home Assistant OS · MQTT',
    portfolioDescription:
        'Self-sovereign edge infrastructure: Proxmox host, OpenWRT '
        'networking, openSUSE workloads, Home Assistant OS, MQTT-based '
        'integrations. All physical-world state stays inside the LAN — no '
        'cloud middleman.',
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
    technologyUsed:
        'faster-whisper · Piper TTS · openWakeWord · local LLM · Flask',
    portfolioDescription:
        'Privacy-first voice assistant running entirely on-device: custom '
        'wake-word detection, offline speech-to-text (faster-whisper '
        'service on :10300), local LLM inference and on-device Piper voice '
        'synthesis. No round-trip to the cloud — full sentence latency '
        'under a second on commodity hardware.',
    isPublic: false,
    isLive: false,
  ),
  ProjectItemData(
    title: 'Whisper STT Service',
    subtitle: 'Containerized faster-whisper API',
    category: 'AI / INFRASTRUCTURE',
    platform: 'Container',
    primaryColor: const Color(0xFF0284C7),
    image: '$_d/whisper/cover.png',
    coverUrl: '$_d/whisper/cover.png',
    technologyUsed: 'Python 3.11 · Flask · faster-whisper · FFmpeg · Podman',
    portfolioDescription:
        'Lightweight Python service that wraps OpenAI Whisper via '
        'faster-whisper and exposes a REST endpoint on port 10300. Used '
        'by the voice-assistant stack and the catersmart-ai-core '
        'pipeline for any audio that needs to be transcribed inside the '
        'sovereign cluster.',
    isPublic: false,
    isLive: true,
  ),
  ProjectItemData(
    title: 'Shop Automation Pipeline',
    subtitle: 'AI-driven print-on-demand',
    category: 'AUTOMATION / E-COMMERCE',
    platform: 'Web',
    primaryColor: const Color(0xFFF59E0B),
    image: '$_d/shop-automation/cover.png',
    coverUrl: '$_d/shop-automation/cover.png',
    technologyUsed:
        'Python · Printify API · ComfyUI · FLUX.1 · Pandas · WooCommerce',
    portfolioDescription:
        'End-to-end content + product pipeline: FLUX.1 generates designs '
        'via ComfyUI, the Printify API places them on print-on-demand '
        'products and pushes them to the storefront, and a Pandas/CSV '
        'workflow keeps everything reconciled. Walks away, products show '
        'up. Sits on top of a property/asset database that doubles as a '
        'social-media automation hub.',
    isPublic: true,
    isLive: true,
    webUrl: 'https://shop.burakbasci.de',
  ),
  ProjectItemData(
    title: 'ImmoPilot',
    subtitle: 'Real-estate operations SaaS',
    category: 'B2B / SAAS',
    platform: 'Web · iOS · Android',
    primaryColor: const Color(0xFF334155),
    image: '$_d/immopilot/cover.png',
    coverUrl: '$_d/immopilot/cover.png',
    technologyUsed:
        'FastAPI · PostgreSQL 18 + RLS · Redis · n8n · ARQ · NocoDB · Mistral/OpenAI/Anthropic · Podman Compose · Prometheus + Grafana',
    portfolioDescription:
        'Multi-tenant SaaS for German real-estate brokers: connects '
        'CRM and email systems with AI-powered lead automation, multi-'
        'tenant Postgres with row-level security, AI email classification '
        'and reply generation, n8n-orchestrated CRM sync. Deployed on the '
        'sovereign k3s platform with full Prometheus/Grafana observability.',
    isPublic: false,
    isLive: true,
  ),
  ProjectItemData(
    title: 'CaterSmart',
    subtitle: 'Catering operations + AI core',
    category: 'B2B / OPERATIONS',
    platform: 'Web · API',
    primaryColor: const Color(0xFF65A30D),
    image: '$_d/catersmart/cover.png',
    coverUrl: '$_d/catersmart/cover.png',
    technologyUsed:
        'FastAPI · SQLAlchemy 2 async · PostgreSQL · Redis · Mistral/Claude/OpenAI · Supabase pgvector',
    portfolioDescription:
        'Full-stack catering platform: an async FastAPI + SQLAlchemy 2 '
        'backend on PostgreSQL/Redis, plus an "AI core" microservice that '
        'classifies inquiry emails into 11 categories, extracts structured '
        'data and drafts replies. Pluggable LLM providers, RAG via '
        'Supabase, mock mode for tests, human-in-the-loop flow. Live at '
        'catersmart.de.',
    isPublic: false,
    isLive: true,
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
        'Mobile front-end concept for a self-hosted Home Assistant '
        'deployment: lights, climate, energy and security in a tactile, '
        'fast-responding UI talking MQTT directly from the device.',
    isPublic: false,
    isLive: false,
  ),
  ProjectItemData(
    title: 'Open Design',
    subtitle: 'OSS AI design platform',
    category: 'OPEN SOURCE / DESIGN',
    platform: 'Web · Desktop',
    primaryColor: const Color(0xFFD946EF),
    image: '$_d/open-design/cover.png',
    coverUrl: '$_d/open-design/cover.png',
    technologyUsed:
        'Next.js · TypeScript · React 18 · Vite · Tailwind · pnpm · Electron',
    portfolioDescription:
        'Open-source, local-first alternative to closed AI design tools. '
        'Detects any coding-agent CLI on \$PATH (Claude Code, Cursor, '
        'Devin, Copilot, Gemini, Qwen, ...) and wires it into a '
        'skill-driven workflow. 31 composable design skills, 72+ '
        'brand-grade design systems, interactive discovery forms, live '
        'streaming-artifacts panel, sandboxed iframe preview. Runs '
        'locally or deploys to Vercel — BYOK at every layer.',
    isPublic: true,
    isLive: true,
    webUrl: 'https://github.com/nexu-io/open-design',
    gitHubUrl: 'https://github.com/nexu-io/open-design',
  ),
  ProjectItemData(
    title: 'Custom Client Platform',
    subtitle: 'Real-estate media + 3D processing',
    category: 'CLIENT / FULL-STACK',
    platform: 'Web · Cloud',
    primaryColor: const Color(0xFF475569),
    image: '$_d/freelance/cover.png',
    coverUrl: '$_d/freelance/cover.png',
    technologyUsed:
        'FastAPI · Node + TypeScript · PostgreSQL · Three.js · Sharp · FFmpeg · Docker · Kubernetes',
    portfolioDescription:
        'Multi-tier platform for real-estate operations with specialised '
        'services per concern: 3D floorplan generation, video processing, '
        'AI staging, geometry optimisation and image compression. Direct '
        'cloud-storage integration and live preview of processed assets '
        'in a sandboxed Three.js viewer.',
    isPublic: false,
    isLive: false,
  ),
  ProjectItemData(
    title: 'PSCoat',
    subtitle: 'Coatings business ops',
    category: 'CLIENT / AUTOMATION',
    platform: 'Web · Python',
    primaryColor: const Color(0xFF0F172A),
    image: '$_d/pscoat/cover.png',
    coverUrl: '$_d/pscoat/cover.png',
    technologyUsed: 'Python 3.12 · Playwright · async/await · Web scraping',
    portfolioDescription:
        'Operations + automation toolkit for an industrial coatings '
        'business. Playwright-driven job-board integration, automated '
        'lead discovery, and a marketing-asset pipeline (banners, hero '
        'shots). Built with TOS-aware throttling and auth-aware sessions.',
    isPublic: false,
    isLive: false,
  ),
  ProjectItemData(
    title: 'Theater Website',
    subtitle: 'Local German theater',
    category: 'CLIENT / WEB',
    platform: 'Web',
    primaryColor: const Color(0xFF7E22CE),
    image: '$_d/theater/cover.png',
    coverUrl: '$_d/theater/cover.png',
    technologyUsed: 'WordPress · Elementor Pro · PHP · MySQL',
    portfolioDescription:
        'Public-facing website for a German theater organisation: '
        'programme listings, season-pass purchases, accessibility-first '
        'styling and a low-friction CMS for the artistic team.',
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
        'Reusable widget library on pub.dev: animation, layout and UI '
        'primitives extracted from real production projects. Used as the '
        'baseline kit for new Flutter apps.',
    isPublic: true,
    isLive: true,
    webUrl: 'https://pub.dev/packages/burakbasci_widgets',
  ),
  ProjectItemData(
    title: 'Python Recall',
    subtitle: 'AI screenshot analysis',
    category: 'AI / TOOL',
    platform: 'Linux · Desktop',
    primaryColor: const Color(0xFF1D4ED8),
    image: '$_d/python-recall/cover.png',
    coverUrl: '$_d/python-recall/cover.png',
    technologyUsed:
        'Python · Google Gemini · Copilot · OpenCV · aiohttp · SSE',
    portfolioDescription:
        'A "Recall"-style desktop helper: captures screenshots, races '
        'Gemini and Copilot side-by-side via parallel threads, streams '
        'whichever responds first over Server-Sent Events to a local '
        'overlay. Mouse-triggered with configurable keyboard shortcuts '
        'and timeouts.',
    isPublic: false,
    isLive: false,
  ),
  ProjectItemData(
    title: 'BoxHead',
    subtitle: 'Unreal Engine 5 FPS',
    category: 'GAME / UNREAL',
    platform: 'Windows · Linux',
    primaryColor: const Color(0xFF1F2937),
    image: '$_d/boxhead/cover.png',
    coverUrl: '$_d/boxhead/cover.png',
    technologyUsed: 'Unreal Engine 5 · C++ · Blueprints',
    portfolioDescription:
        'Fast-paced first-person shooter built in Unreal Engine 5: maze-'
        'like levels, scripted enemy waves, ranged/melee weapons. Built '
        'editor for both Linux and Windows with high-resolution screenshot '
        'tooling for level-design iteration.',
    isPublic: false,
    isLive: false,
  ),
  ProjectItemData(
    title: 'Flappy Griffon',
    subtitle: '3D ray-traced Flappy Bird',
    category: 'GAME / UNREAL',
    platform: 'Windows · Android',
    primaryColor: const Color(0xFFF59E0B),
    image: '$_d/flappy-griffon/cover.png',
    coverUrl: '$_d/flappy-griffon/cover.png',
    technologyUsed: 'Unreal Engine 5 · C++ · Blueprints · Water plugin',
    portfolioDescription:
        '3D ray-traced re-imagining of Flappy Bird with a griffon '
        'character navigating obstacle courses. Cross-platform Windows / '
        'Linux / Android / Mac targets. Shipped on itch.io.',
    isPublic: true,
    isLive: true,
    webUrl: 'https://burakbasci.itch.io/flappygriffon',
  ),
  ProjectItemData(
    title: 'MyJumpNRun',
    subtitle: 'Unreal Engine platformer series',
    category: 'GAME / UNREAL',
    platform: 'Windows',
    primaryColor: const Color(0xFF65A30D),
    image: '$_d/jumpnrun/cover.png',
    coverUrl: '$_d/jumpnrun/cover.png',
    technologyUsed: 'Unreal Engine 5 · C++ · Blueprints',
    portfolioDescription:
        'Iterative platformer in Unreal Engine 5 — multiple versions '
        '(5.2 + variants) tracking improvements to level design, '
        'character physics and Blueprint scripting.',
    isPublic: false,
    isLive: false,
  ),
  ProjectItemData(
    title: 'CV Plugin for Unreal',
    subtitle: 'Custom segmentation & datasets',
    category: 'ML / RESEARCH',
    platform: 'Unreal',
    primaryColor: const Color(0xFF0E7490),
    image: '$_d/cv-plugin/cover.png',
    coverUrl: '$_d/cv-plugin/cover.png',
    technologyUsed:
        'Unreal Engine 5 · C++ · NVIDIA NDDS · Semantic Segmentation',
    portfolioDescription:
        'Custom Unreal Engine plugin for real-time semantic segmentation, '
        'object detection and labelled training-data export. Built '
        'alongside the night-detection thesis to automate dataset '
        'generation from synthetic scenes.',
    isPublic: false,
    isLive: false,
  ),
  ProjectItemData(
    title: 'ALSignal Hackathon',
    subtitle: 'ASL detection in Unity',
    category: 'HACKATHON / CV',
    platform: 'Windows · Unity',
    primaryColor: const Color(0xFF1F2937),
    image: '$_d/unity-hackathon/cover.png',
    coverUrl: '$_d/unity-hackathon/cover.png',
    technologyUsed: 'Unity · C# · MediaPipe · Computer Vision',
    portfolioDescription:
        'Hackathon-built American Sign Language detector in Unity. '
        'Real-time gesture recognition with raycasting against a '
        'spherical gesture-space, pen input, smile detection. Concept, '
        'art pipeline, scripting and build — all from scratch in a '
        'weekend.',
    isPublic: false,
    isLive: false,
  ),
  ProjectItemData(
    title: 'Steam Market Arbitrage',
    subtitle: 'Trading-card economy bot',
    category: 'AUTOMATION / FINANCE',
    platform: 'Linux',
    primaryColor: const Color(0xFF1B2838),
    image: '$_d/steam-market/cover.png',
    coverUrl: '$_d/steam-market/cover.png',
    technologyUsed: 'Python · BeautifulSoup · Requests · SQLite',
    portfolioDescription:
        'Research toolkit for the Steam Community Market: detects '
        'arbitrage opportunities (gem → booster crafting, card → gem '
        'conversion, foil-card trading, badge economics). Cookie-based '
        'session that respects rate-limits, with disciplined risk rules.',
    isPublic: false,
    isLive: false,
  ),
  ProjectItemData(
    title: 'Image Upscaler',
    subtitle: 'Real-ESRGAN over SFTP',
    category: 'TOOL / ML',
    platform: 'Linux · GPU',
    primaryColor: const Color(0xFF9333EA),
    image: '$_d/image-upscaler/cover.png',
    coverUrl: '$_d/image-upscaler/cover.png',
    technologyUsed: 'Python · PyTorch · Real-ESRGAN · OpenCV · SFTP',
    portfolioDescription:
        'GPU-accelerated batch image upscaler that watches an SFTP '
        'folder, runs Real-ESRGAN (face-aware, configurable denoise) and '
        'puts the upscaled file back. Plugged into the n8n workflow stack '
        'as a background job.',
    isPublic: false,
    isLive: false,
  ),
  ProjectItemData(
    title: 'Image Uploader',
    subtitle: 'Selenium helpers',
    category: 'TOOL / UTILITY',
    platform: 'Linux',
    primaryColor: const Color(0xFF0EA5E9),
    image: '$_d/image-uploader/cover.png',
    coverUrl: '$_d/image-uploader/cover.png',
    technologyUsed: 'Python · Selenium · WebDriver Manager',
    portfolioDescription:
        'Browser-automation helpers for Adobe Stock and ImmoWare '
        'workflows. Supports both Snap and system Chrome/Chromium with '
        'remote debugging and persistent sessions.',
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
    technologyUsed: 'Django · Pillow · PostgreSQL · Docker',
    portfolioDescription:
        'Django service that renders branded social cards and product '
        'images from JSON payloads. Used internally to feed the shop '
        'pipeline at scale.',
    isPublic: false,
    isLive: false,
  ),
  ProjectItemData(
    title: 'Binance Tax Report',
    subtitle: 'CSV → German PDF',
    category: 'TOOL / UTILITY',
    platform: 'Linux',
    primaryColor: const Color(0xFFB45309),
    image: '$_d/binance-tax/cover.png',
    coverUrl: '$_d/binance-tax/cover.png',
    technologyUsed: 'Python · WeasyPrint · pango · cairo',
    portfolioDescription:
        'CLI tool that ingests Binance transaction-history CSVs and '
        'generates DEUTSCHER_STEUERBERICHT PDFs via WeasyPrint. Clean '
        'typography, German tax-office formatting.',
    isPublic: false,
    isLive: false,
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
        'Coursework at TU Dortmund: programming a TurtleBot with ROS '
        'in C++. SLAM exercises, motion control and signal handling on '
        'a real differential-drive robot.',
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
        'Scientific paper (graded 1.3) on the application and '
        'optimisation of deep-learning object detection in a simulated '
        'urban environment from the perspective of a moving car.',
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
        'The site you are reading. Flutter Web, deployed to GitHub '
        'Pages with a custom domain. Source heavily restructured from '
        "David Cobbina's portfolio template.",
    isPublic: true,
    isLive: true,
    webUrl: 'https://www.burakbasci.de',
    gitHubUrl: 'https://github.com/burak-basci/burak_basci_website',
  ),
];

/// Subset shown on the home page "selection of recent work" — flagship picks.
final List<ProjectItemData> recentWorksHighlights = <ProjectItemData>[
  recentWorks[0], // Patent AI Search
  recentWorks[1], // Sovereign Cloud
  recentWorks[2], // Postflow
  recentWorks[3], // LuminaRep
  recentWorks[7], // VR Anxiety
  recentWorks[8], // Durak
];
