import 'package:flutter/material.dart';

import '../widgets/project_item/project_item.dart';

const String _d = 'assets/images/projects';

final List<ProjectItemData> recentWorks = <ProjectItemData>[
  ProjectItemData(
    title: 'Patent AI Search',
    subtitle: 'Hybrid semantic search engine',
    category: 'AI / SEARCH',
    platform: 'Web · Internal',
    primaryColor: const Color(0xFF1E3A8A),
    image: '$_d/patent-search/cover.png',
    coverUrl: '$_d/patent-search/cover.png',
    technologyUsed:
        'Flutter Web · Django · ElasticSearch · Vector Embeddings · UML/SysML',
    portfolioDescription:
        'Production AI patent-search tool built for a major German '
        'automotive infotainment subsidiary, scaled across 3 departments '
        'and 50+ internal engineers. Hybrid retrieval over a tuned '
        'ElasticSearch index combines keyword scoring with vector '
        'embeddings; an A/B-tested ranking layer lifted precision by '
        '25% and cut researcher time-to-discovery by 40%. The full '
        'system landscape was modelled in Enterprise Architect '
        '(UML/SysML), mapping 100% of infrastructure-to-code '
        'dependencies for seamless DevSecOps handovers. Shipped under '
        'NDA — closed source.',
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
        'k3s · Terraform · ArgoCD · Traefik · Helm · Longhorn · CloudNativePG · Prometheus · Grafana',
    portfolioDescription:
        'A sovereign Kubernetes platform on Hetzner Cloud running a '
        'production HA k3s cluster with CloudNativePG, MariaDB Galera, '
        'Longhorn distributed storage and a Traefik ingress that '
        'auto-rotates Let\'s Encrypt certs. Everything provisions from a '
        'single `terraform apply`; ArgoCD then GitOps-syncs the 15+ '
        'self-hosted services that replaced the 700+ unit real-estate '
        'portfolio\'s legacy SaaS stack. Provisioning lead time fell '
        'from 4 days to 45 minutes (95% improvement), annual licensing '
        'spend dropped €20k, and Prometheus + Grafana cut Mean Time to '
        'Detection by 40%. A cross-functional team of 9 engineering '
        'students ships against this platform under Scrum — sprint '
        'velocity climbed 25% in the first two quarters.',
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
        'Next.js 15 · FastAPI · SQLAlchemy 2 async · Alembic · PostgreSQL 16 + pgvector · MinIO · Temporal · LangGraph · GitHub Copilot Pro',
    portfolioDescription:
        'A social-media operations SaaS that lets small businesses post '
        'to nine networks in under 15 minutes a day. Strict-TypeScript '
        'Next.js 15 frontend with shadcn/ui and TanStack Query talks to '
        'an async FastAPI + SQLAlchemy 2 backend; Temporal orchestrates '
        'every long-running job, LangGraph agents (via GitHub Copilot '
        'Pro) generate captions and post variants, and PostgreSQL 16 + '
        'pgvector + MinIO handle structured data and media. Self-hosted '
        'on a Hetzner CX33 in Falkenstein with a database-backup-first '
        'GitLab CI/CD pipeline that refuses to deploy without a fresh '
        'snapshot. Live at app.benotable.de.',
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
        'Next.js 15 · TypeScript · PostgreSQL · NextAuth · Google Gemini · Stripe · Tailwind · Docker Compose',
    portfolioDescription:
        'A premium SaaS aimed at medical-aesthetics and cosmetic-surgery '
        'practices. It auto-extracts the clinic\'s 5-star Google reviews '
        'and runs each through Gemini to produce three Instagram '
        'captions, a TikTok script, and Midjourney/DALL-E image prompts '
        'in the practice\'s tone. Auth via email + password (NextAuth), '
        'metered Stripe subscriptions with a 7-day trial, and a luxury '
        'dark-mode UI in emerald + gold. Fully containerised; ships '
        'with a production deploy guide and self-hosted infrastructure '
        'so a clinic can run it on-prem if they prefer.',
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
        'Python · FastAPI · RAG · Vector DB · Pluggable Mistral / Claude / OpenAI / local OpenWebUI',
    portfolioDescription:
        'A multi-provider LLM service that turns a noisy inbox into '
        'structured tickets. A three-stage pipeline classifies each '
        'incoming mail into one of eleven categories, extracts the '
        'sender, intent and any structured fields, then drafts a '
        'reply — strictly behind a human-in-the-loop gate. Provider '
        'is pluggable via a single config (Mistral, Claude, OpenAI, '
        'local OpenWebUI), so EU-residency requirements can be met by '
        'simply swapping endpoints. Throughput climbed 80%, accuracy '
        'holds at 95%, and the service saves about 8 engineering-hours '
        'a week on a real customer mailbox.',
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
        'Cross-platform Flutter app paired with an upgradeable ERC-20 '
        '(UWCT) on Polygon, channelling token-aligned donations into '
        'environmental and charitable causes. Built and shipped a '
        'feature-complete MVP in 12 months as Technical Lead of a '
        'remote agile team of two: owned the full technical roadmap '
        'from token economics through requirements engineering to UI. '
        'The token contract uses a UUPS proxy pattern (OpenZeppelin) '
        'so logic upgrades stay possible without forcing holders to '
        'migrate; mint, burn and pause are all governed by '
        'multi-signature. Demoed at the KUER.NRW Green Entrepreneurship '
        'Fair to 20+ stakeholders and investors.',
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
        'Unreal Engine 5 (C++) · NVIDIA NDDS · Houdini · YOLOv8 · Python · PyTorch',
    portfolioDescription:
        'B.Sc. thesis at the TU Dortmund Institute of Robotics (graded '
        '1.3 — top decile in the German system) on CNN-based '
        'night-time object detection. Built a high-fidelity Unreal '
        'Engine 5 city simulation with a Houdini procedural pipeline '
        'and an NVIDIA NDDS labelling layer; the resulting automated '
        'annotator eliminated 100% of manual labelling effort across '
        '6,000+ training samples. The accompanying study identified '
        'five lighting and environmental parameters that disproportionately '
        'drive the network\'s feature extraction in low-light scenes, '
        'and provided a foundation for closing the sim-to-real gap on '
        'synthetic driving datasets.',
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
        'A VR exposure-therapy prototype for social anxiety, set on '
        'the stage of a virtual opera house. Built in a single weekend '
        'in Unreal Engine 5 — own the room, walk to the centre, deliver '
        'a short speech to a virtual audience while a coach script '
        'guides the breathing. Won 1st place at the TU Dortmund Startup '
        'Weekend 2023, outperforming nine competing teams on technical '
        'execution and market validation, and selected to advance into '
        'the university\'s startup incubator pipeline.',
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
        'Flutter · Dart · GetX · WebSockets · PostgreSQL · Playwright E2E',
    portfolioDescription:
        'A polished Flutter implementation of the classic Russian Durak '
        'card game, shipped to six platforms (Android, iOS, Web, '
        'Windows, macOS, Linux) from a single codebase. Three AI '
        'difficulty levels run fully offline; the move generator scores '
        'every legal attack/defend pair against a heuristic that '
        'mirrors how strong human players think about trump leverage '
        'and hand-reduction. Custom rendering pushes 60 FPS on '
        'commodity hardware, GetX drives a reactive state graph, and '
        'a 31-test unit suite + Playwright E2E protect the core rules. '
        'Localised in English, Russian, Turkish and German; the socket '
        'layer is staged for online multiplayer. Live at '
        'durak.burakbasci.de.',
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
        'Proxmox VE · OpenWRT · openSUSE · Home Assistant OS · MQTT · InfluxDB · Grafana',
    portfolioDescription:
        'A self-hosted edge hub that keeps every physical-world signal '
        'inside the LAN — no cloud middleman, no telemetry leak. '
        'Proxmox VE virtualises Home Assistant OS, an MQTT broker, '
        'InfluxDB and Grafana in lightweight VMs; OpenWRT handles '
        'segmented VLANs for IoT vs. trusted devices; openSUSE runs '
        'background workloads. Forty-plus room-level automations tie '
        'climate, lighting, presence and security together through '
        'sensor-fusion rules with conditional logic, and the Grafana '
        'dashboard turns the same data into a live energy view across '
        '12+ devices.',
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
        'faster-whisper · Piper TTS · openWakeWord · local LLM · Flask · MQTT',
    portfolioDescription:
        'A privacy-first voice assistant that runs end-to-end on '
        'commodity hardware: a custom wake-word model from '
        'openWakeWord, on-device speech-to-text via faster-whisper, '
        'a local LLM for intent resolution, and Piper TTS for the '
        'reply. No round-trip to the cloud, no third-party API. The '
        'service speaks MQTT directly into Home Assistant, so '
        '"turn on the kitchen lights" routes through the same '
        'automation graph as any other event in the house. Conversation '
        'context persists across sessions and the whole pipeline runs '
        'in well under a second on a single GPU.',
    isPublic: false,
    isLive: false,
  ),
  ProjectItemData(
    title: 'Whisper STT Service',
    subtitle: 'Containerised faster-whisper API',
    category: 'AI / INFRASTRUCTURE',
    platform: 'Container',
    primaryColor: const Color(0xFF0284C7),
    image: '$_d/whisper/cover.png',
    coverUrl: '$_d/whisper/cover.png',
    technologyUsed:
        'Python 3.11 · Flask · faster-whisper · FFmpeg · Podman',
    portfolioDescription:
        'A lightweight transcription microservice that wraps OpenAI '
        'Whisper via faster-whisper and exposes a REST endpoint on '
        'port 10300. FFmpeg handles every audio codec the rest of the '
        'stack throws at it, and the service ships in a rootless Podman '
        'image with health and readiness probes for load-balancer '
        'integration. It backs both the voice-assistant pipeline and '
        'the CaterSmart AI core whenever a piece of audio needs to '
        'become text inside the sovereign cluster — language detection, '
        'confidence scores and timing metadata included.',
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
        'Python · ComfyUI · FLUX.1 · Printify API · Pandas · WooCommerce',
    portfolioDescription:
        'An end-to-end content and product pipeline. FLUX.1 (running '
        'through a self-hosted ComfyUI graph) generates designs on a '
        'cron schedule; a Python orchestrator places each design on '
        'the right Printify product, generates the SKU metadata in '
        'multiple languages, and pushes the listing live on the '
        'WooCommerce storefront. A Pandas reconciliation step then '
        'matches every order back to the original generation prompt, '
        'so every product on the shop is traceable to the seed that '
        'made it. The same pipeline doubles as a social-media '
        'automation hub.',
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
        'FastAPI · PostgreSQL 18 + RLS · Redis · ARQ · n8n · NocoDB · Mistral / OpenAI / Anthropic · Podman Compose · Prometheus + Grafana',
    portfolioDescription:
        'A multi-tenant SaaS for German real-estate brokerages that '
        'plugs into onOffice, onPreo and Outlook and automates the '
        'busy-work between lead and contract. PostgreSQL 18 with '
        'row-level security keeps every tenant\'s data isolated; ARQ '
        'workers poll the onOffice API for new leads while LLM '
        'classifiers (Mistral, OpenAI or Claude — chosen per tenant) '
        'draft replies and match leads against the broker\'s active '
        'portfolio. The "qualified-suitors" matcher converts the '
        'free-form lead text into a structured 0–100% match score; '
        'n8n then formats and dispatches the result as a DIN-5008 '
        'compliant DOCX/PDF "Angebot". Runs on the sovereign k3s '
        'platform with full Prometheus + Grafana observability.',
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
        'FastAPI · SQLAlchemy 2 async · Alembic · PostgreSQL · Redis · Mistral / Claude / OpenAI · Supabase pgvector',
    portfolioDescription:
        'A full-stack catering operations platform: an async FastAPI + '
        'SQLAlchemy 2 backend on PostgreSQL and Redis, plus an "AI '
        'core" microservice that turns inbound inquiry mails into '
        'structured tickets. The classifier sorts every message into '
        'one of eleven catering categories (inquiry, supplier request, '
        'cancellation, complaint, ...) against a 55-email gold set; '
        'strict JSON schema enforcement keeps the LLM output parseable. '
        'Pluggable provider (Mistral / Claude / OpenAI / OpenWebUI), '
        'RAG over a Supabase pgvector store for prior decisions, a mock '
        'mode for tests, JSONL audit logs of every decision, plus 88 '
        'unit tests in CI. Shipped at catersmart.de.',
    isPublic: false,
    isLive: true,
  ),
  ProjectItemData(
    title: 'NestNode',
    subtitle: 'Smart-home control concept',
    category: 'IOT / MOBILE',
    platform: 'iOS · Android',
    primaryColor: const Color(0xFF0891B2),
    image: '$_d/nestnode/cover.png',
    coverUrl: '$_d/nestnode/cover.png',
    technologyUsed: 'Flutter · MQTT · Home Assistant',
    portfolioDescription:
        'A mobile concept for a self-hosted Home Assistant deployment: '
        'lights, climate, energy and security in a tactile, '
        'fast-responding UI that talks MQTT directly from the device '
        'rather than through a cloud bridge. The exploration covered '
        'gesture-first navigation, scene curation and an energy view '
        'that surfaces deviations as actionable cards. Currently '
        'archived — the design language was rolled into the Home '
        'Assistant Edge stack.',
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
        'An open-source, local-first alternative to closed AI design '
        'tools. The platform auto-detects whichever coding-agent CLI '
        'is on \$PATH — Claude Code, Cursor, Devin, GitHub Copilot, '
        'Gemini, Qwen, and nine others — and wires it into a '
        'skill-driven design workflow. Thirty-one composable design '
        'skills (decks, mobile, dashboards, branding, ...) and 72+ '
        'brand-grade design systems (Linear, Stripe, Notion, Figma, '
        'Apple, ...) sit behind an interactive discovery form, with a '
        'streaming live-artifacts panel and a sandboxed iframe '
        'preview. Runs entirely on the developer\'s machine or deploys '
        'one-click to Vercel; BYOK at every layer. Apache-2.0 on '
        'GitHub.',
    isPublic: true,
    isLive: true,
    webUrl: 'https://github.com/nexu-io/open-design',
    gitHubUrl: 'https://github.com/nexu-io/open-design',
  ),
  ProjectItemData(
    title: 'Custom Client Platform',
    subtitle: 'Real-estate media & 3D processing',
    category: 'CLIENT / FULL-STACK',
    platform: 'Web · Cloud',
    primaryColor: const Color(0xFF475569),
    image: '$_d/freelance/cover.png',
    coverUrl: '$_d/freelance/cover.png',
    technologyUsed:
        'FastAPI · Node + TypeScript · PostgreSQL · Three.js · Sharp · FFmpeg · Docker · Kubernetes',
    portfolioDescription:
        'A multi-tier platform for premium real-estate marketing, '
        'broken out into per-concern microservices: a 3D floor-plan '
        'generator, a video processor (FFmpeg), an AI staging '
        'service, a geometry optimiser and an image-compression '
        'pipeline (Sharp). The Node + TypeScript orchestrator '
        'streams assets directly to and from object storage to keep '
        'memory pressure constant regardless of input size, while a '
        'sandboxed Three.js viewer renders the processed outputs in '
        'real time for the broker to review. Deployed on Kubernetes '
        'with horizontal autoscaling per service.',
    isPublic: false,
    isLive: false,
  ),
  ProjectItemData(
    title: 'PSCoat',
    subtitle: 'Industrial coatings ops',
    category: 'CLIENT / AUTOMATION',
    platform: 'Web · Python',
    primaryColor: const Color(0xFF0F172A),
    image: '$_d/pscoat/cover.png',
    coverUrl: '$_d/pscoat/cover.png',
    technologyUsed: 'Python 3.12 · Playwright · async/await · Mistral · WordPress',
    portfolioDescription:
        'Operations and lead-automation toolkit for an industrial '
        'coatings business. A Playwright-driven job-board crawler '
        '(with TOS-aware throttling and authenticated sessions) '
        'pulls qualified projects from Upwork and verticals, while a '
        'small LLM classifier sorts inbound inquiries into pricing, '
        'technical or callback buckets and drafts a tone-matched '
        'response in the company\'s voice. The same stack feeds a '
        'marketing-asset pipeline that produces banners and hero '
        'shots for the public site.',
    isPublic: false,
    isLive: false,
  ),
  ProjectItemData(
    title: 'Theater Website',
    subtitle: 'German regional theater',
    category: 'CLIENT / WEB',
    platform: 'Web',
    primaryColor: const Color(0xFF7E22CE),
    image: '$_d/theater/cover.png',
    coverUrl: '$_d/theater/cover.png',
    technologyUsed: 'WordPress · Elementor Pro · PHP · MySQL · Eventim',
    portfolioDescription:
        'Public-facing site for a German regional theater: programme '
        'listings, season-pass purchasing through an Eventim ticketing '
        'integration, accessibility-first styling and a low-friction '
        'Elementor-based CMS so the artistic team can update copy '
        'without the developer being in the loop. Hosted with '
        'GDPR-compliant audience data handling and role-scoped admin; '
        'automated nightly snapshots back up content, plugins and the '
        'media library.',
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
    technologyUsed: 'Dart · Flutter · null-safety · pub.dev',
    portfolioDescription:
        'A reusable Flutter widget library on pub.dev: animation '
        'primitives, layout helpers and UI components extracted from '
        'real production projects. Each widget ships with its own '
        'tests and dartdoc; the package is null-safety-first and '
        'tracks the current stable Flutter SDK. Used as the baseline '
        'kit for new Flutter apps.',
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
        'Python · Google Gemini · GitHub Copilot · OpenCV · aiohttp · Server-Sent Events',
    portfolioDescription:
        'A "recall"-style desktop helper that captures the current '
        'screen, then races Gemini and Copilot against each other on '
        'parallel threads and streams whichever responds first to a '
        'local SSE overlay. Mouse-triggered with configurable '
        'shortcuts, per-provider timeouts and a small Wayland-native '
        'input layer that bypasses the inhibitor by reading evdev '
        'directly. The result is sub-second insight into whatever is '
        'on screen without having to alt-tab into a chatbot.',
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
        'A fast-paced 3D shooter built in Unreal Engine 5 — claustrophobic '
        'maze-like arenas, wave-based AI, ranged and melee weapons '
        'with their own ammo and feel. C++ handles the weapon systems '
        '(spread, ricochet, projectile pooling), particle effects '
        'sell the impacts, and the same project builds editor and '
        'shipping targets for both Linux and Windows with high-res '
        'screenshot tooling for level-design iteration.',
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
        'A 3D, ray-traced reimagining of Flappy Bird. A griffon '
        'navigates a continuously generated obstacle course; the '
        'Water plugin handles the cinematic lake reflections, ray-'
        'tracing carries the lighting, and the same project builds '
        'across Windows, Linux, Android and Mac. Shipped on itch.io.',
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
        'A personal Unreal Engine platformer rebuilt across multiple '
        'iterations (5.2, 5.2 + variant, ...) to keep pushing on '
        'level design, character physics and Blueprint scripting. '
        'Tight movement (jump buffering, coyote time, wall-slide '
        'detection), checkpoints and a small replay system make the '
        'core mechanics feel responsive enough that the levels stand '
        'on their own.',
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
        'Unreal Engine 5 · C++ · NVIDIA NDDS · ONNX Runtime · Semantic Segmentation',
    portfolioDescription:
        'A first-party Unreal Engine 5 plugin extracted from the '
        'night-detection thesis work. It exposes real-time semantic '
        'segmentation (road, vehicle, person, sky, building, ...) to '
        'gameplay code through a thin C++ API, and writes both the '
        'rendered frame and its labelled mask to disk in a format the '
        'downstream YOLOv8 training pipeline can ingest. The same '
        'plugin powers an automated dataset generator that '
        'eliminated 100% of manual annotation effort on a 6,000-frame '
        'training set.',
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
    technologyUsed: 'Unity · C# · MediaPipe · LSTM · Webcam',
    portfolioDescription:
        'A weekend hackathon build: real-time American Sign Language '
        'detection inside Unity. MediaPipe estimates the hand pose at '
        '30 FPS; a small LSTM trained on a captured gesture set '
        'classifies each window of frames into the right sign. The '
        'demo overlays the recognised label and a confidence bar live '
        'on the camera feed.',
    isPublic: false,
    isLive: false,
  ),
  ProjectItemData(
    title: 'Steam Market Arbitrage',
    subtitle: 'Trading-card economy analyser',
    category: 'AUTOMATION / FINANCE',
    platform: 'Linux',
    primaryColor: const Color(0xFF1B2838),
    image: '$_d/steam-market/cover.png',
    coverUrl: '$_d/steam-market/cover.png',
    technologyUsed: 'Python · BeautifulSoup · Requests · SQLite',
    portfolioDescription:
        'A research toolkit for the Steam Community Market: it scans '
        'thousands of listings a day and detects arbitrage loops — '
        'gem → booster pack crafting spreads, card → gem conversions, '
        'foil-card price gaps, and badge → component economics. Uses '
        'a cookie-based authenticated session that respects Steam\'s '
        'rate limits, factors in Steam\'s 15% market fee on every '
        'simulated trade, and writes opportunities to a local SQLite '
        'with a risk score so the obviously-stale ones get filtered '
        'out before a human even sees them.',
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
    technologyUsed: 'Python · PyTorch · Real-ESRGAN · OpenCV · SFTP · n8n',
    portfolioDescription:
        'A GPU-accelerated batch image upscaler that watches a remote '
        'SFTP folder, runs Real-ESRGAN (with face-aware enhancement '
        'and a configurable denoise pass), and uploads the upscaled '
        'result back to the same path. Tile-based inference keeps '
        '10k+ megapixel inputs from OOM-ing the GPU, and the watcher '
        'skips anything already processed via a filename-suffix '
        'check. Plugged into the n8n workflow stack as a background '
        'job for the shop pipeline.',
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
    technologyUsed: 'Python · Selenium · WebDriver Manager · Chromium DevTools',
    portfolioDescription:
        'Browser-automation helpers for Adobe Stock and ImmoWare '
        'workflows. Drives a real Chrome/Chromium (snap or system) '
        'over the remote-debugging protocol so sessions persist '
        'across runs, filling forms, uploading batches and tagging '
        'metadata extracted from the filename. The same primitives '
        'are reused across the freelance asset-management '
        'pipelines whenever a vendor doesn\'t expose an API.',
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
        'A Django service that renders branded social cards and '
        'product hero images from JSON payloads. Templates are '
        'expressed declaratively (text, color, image, gradient, '
        'icon) and the renderer composes them with Pillow into '
        'pixel-perfect PNG or SVG, ready to be fed back into the '
        'shop pipeline at scale.',
    isPublic: false,
    isLive: false,
  ),
  ProjectItemData(
    title: 'Binance Tax Report',
    subtitle: 'CSV to German PDF',
    category: 'TOOL / UTILITY',
    platform: 'Linux',
    primaryColor: const Color(0xFFB45309),
    image: '$_d/binance-tax/cover.png',
    coverUrl: '$_d/binance-tax/cover.png',
    technologyUsed: 'Python · WeasyPrint · pango · cairo',
    portfolioDescription:
        'A CLI tool that turns a Binance transaction-history export '
        'into a formal `DEUTSCHER STEUERBERICHT` PDF: parses every '
        'trade, computes the FIFO cost basis per asset, walks the '
        'realised gains and losses by year, and renders it through '
        'WeasyPrint with the typography the German tax office expects.',
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
    technologyUsed: 'PHP · WordPress · MySQL · PHPUnit',
    portfolioDescription:
        'A small collection of open-source WordPress plugins originally '
        'written for freelance clients (ImmoWare-style listing pages, '
        'custom taxonomy management, a few small SEO helpers) and '
        'released back to the WordPress community under GPL. Each '
        'plugin follows the WordPress coding standards, ships with '
        'PHPUnit tests, and tracks the WordPress LTS line for '
        'long-term compatibility.',
    isPublic: true,
    isLive: false,
  ),
  ProjectItemData(
    title: 'Turtlebot Programming',
    subtitle: 'B.Sc. coursework — ROS in C++',
    category: 'ROBOTICS / ROS',
    platform: 'Linux',
    primaryColor: const Color(0xFFB91C1C),
    image: '$_d/turtlebot/cover.png',
    coverUrl: '$_d/turtlebot/cover.png',
    technologyUsed: 'ROS · C++ · Gazebo · SLAM · Linux',
    portfolioDescription:
        'TU Dortmund coursework: programming a TurtleBot 3 in C++ on '
        'ROS. Built a small navigation state machine on top of SLAM + '
        'path planning, custom perception nodes for LiDAR processing '
        'and AprilTag detection, and a Gazebo test harness so the '
        'whole stack could be replayed in simulation before going to '
        'real hardware. Project ended with a successful fetch-and-'
        'deliver task on the physical robot.',
    isPublic: false,
    isLive: false,
  ),
  ProjectItemData(
    title: 'Object-Detection Paper',
    subtitle: 'Companion to the night-detection thesis',
    category: 'ML / RESEARCH',
    platform: 'Python',
    primaryColor: const Color(0xFF0E7490),
    image: '$_d/paper-citysim/cover.png',
    coverUrl: '$_d/paper-citysim/cover.png',
    technologyUsed: 'YOLOv8 · Unreal Engine · Python · PyTorch',
    portfolioDescription:
        'A peer-reviewed scientific paper (graded 1.3 — top decile in '
        'the German system) on the application and optimisation of '
        'deep-learning object detection in a simulated urban '
        'environment, viewed from the perspective of a moving car. '
        'Companion piece to the B.Sc. thesis: the thesis built the '
        'simulator and the dataset, the paper formalises the lighting '
        'and training-parameter analysis and quantifies how each one '
        'shifts the detector\'s behaviour.',
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
    technologyUsed: 'Flutter Web · CanvasKit · GitHub Pages',
    portfolioDescription:
        'The site you are reading. Flutter Web on the CanvasKit '
        'renderer, deployed to GitHub Pages with a custom domain. '
        'Source heavily restructured from David Cobbina\'s '
        'open-source portfolio template into a new widget tree '
        '(header / footer / page-wrapper / animation primitives), '
        'rebuilt against current stable Flutter, and rewired so '
        'every animation, font, route and project page is content-'
        'driven by `lib/data/projects.dart`.',
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
