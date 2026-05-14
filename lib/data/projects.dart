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
    mockupType: 'laptop',
    decisions: <String>[
      'Hybrid retrieval (BM25 keyword + dense vector embeddings) was the only configuration that beat domain experts on the held-out patent set — pure semantic search alone missed too many exact-term matches that legal teams actually search for.',
      'A/B-tested every ranking-weight change against a fixed query bank instead of shipping by feel — a 25% precision lift only stuck after three losing rollouts.',
      'Modelled the full landscape in Enterprise Architect (UML/SysML) before writing code; the upfront diagram caught a missing security boundary that would have blocked the audit otherwise.',
    ],
    learnings: <String>[
      'Cognitive-load audits with the actual users (patent counsel) revealed that the bottleneck was \'reading dozens of false positives\', not query latency — re-prioritised the roadmap toward ranking quality over response time.',
      'Documenting infrastructure-to-code dependencies as a first-class artefact accelerated the DevSecOps handover; the diagram became a contract that survived three team rotations.',
    ],
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

    mockupType: 'terminal',
    screenshots: <String>[
      'assets/images/projects/k3s/cover.png',
    ],
    decisions: <String>[
      'Picked Hetzner Cloud + k3s over EKS/GKE: 10% the cost, full root, and no managed-control-plane tax for an HA workload.',
      'Three nodes with workload taints split control-plane storage (Postgres, MariaDB, Redis) from application pods so no app deploy can starve the databases.',
      'Hetzner Volumes hold the database tier (RWO, single replica, hot-detach); Longhorn handles application RWX where shared state actually wants replication.',
      'DNS-01 wildcard TLS via Cloudflare cert-manager so every subdomain across *.benotable.de gets the same cert, no HTTP-01 round-trips on each new service.',
      'Helm + a .env single source of truth for every service: WordPress, n8n, Outline, Homarr — same release ritual, no per-app drift.',
    ],
    learnings: <String>[
      'WordPress Multisite was bottlenecked by Longhorn NFS share-manager on RWX volumes; moving to a single-replica RWO ext4 block device cut TTFB from 110 ms to 65 ms.',
      'Longhorn RWX share-manager pods silently fail to schedule without an explicit taint-toleration entry — caught only by puzzling at Pending pods.',
      'Wiring everything through one `.env` makes the disaster-recovery story simple: scp the env file in, `terraform apply`, `helm install` — done.',
    ],
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

    mockupType: 'laptop',
    screenshots: <String>[
      'assets/images/projects/postflow/cover.png',
    ],
    decisions: <String>[
      'Strict TypeScript on the Next.js 15 frontend with no `any` escape hatches — the whole client surface is contractually typed against the FastAPI schema.',
      'Temporal as the workflow engine instead of cron + Redis locks: every multi-step posting flow gets retry, history and a UI for free.',
      'PostgreSQL 16 + pgvector for embeddings rather than a separate vector DB — one Postgres backup covers everything.',
      'GitLab CI/CD refuses to deploy without a fresh DB snapshot first; the `db-backup-first` job is a hard prerequisite.',
      'Self-hosted on a single Hetzner CX33 — the entire stack costs less than a managed Postgres SKU at the comparable scale.',
    ],
    learnings: <String>[
      'LangGraph-style agent graphs are easier to reason about than chains once you have more than two LLM steps with conditional routing.',
      'Putting GitHub Copilot Pro behind the LLM agents (instead of OpenAI direct) keeps cost predictable as the workload scales linearly with content volume.',
    ],
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

    mockupType: 'laptop',
    screenshots: <String>[
      'assets/images/projects/luminarep/cover.png',
    ],
    decisions: <String>[
      'NextAuth for email + password rather than rolling auth — small clinic + GDPR audit; less surface to defend.',
      'Stripe metered subscriptions with a 7-day trial; the free trial is the conversion funnel, not a marketing claim.',
      'Gemini for the content generation pass — it consistently produced the best clinic-friendly tone in side-by-side comparison.',
      'Full Docker Compose so a clinic that wants self-hosting can run it on its own server in the back office with one command.',
    ],
    learnings: <String>[
      'A luxury dark-mode UI (emerald + gold) matters more to clinic owners than the underlying tech — design effort paid back faster than feature work.',
      'Auto-extracting 5-star reviews is the right starting funnel; once it works there, the rest of the platform expansion is upsell.',
    ],
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

    mockupType: 'terminal',
    screenshots: <String>[
      'assets/images/projects/llm-mail/cover.png',
    ],
    decisions: <String>[
      'JSON-schema enforcement on the LLM reply (strict mode, retry on parse failure) lifted accuracy more than swapping models — bigger model with loose JSON still hallucinated tags.',
      'Pluggable provider via a single config field (`LLM_PROVIDER`) — Mistral, Claude, OpenAI, local OpenWebUI — so EU-residency requirements get a config change, not a refactor.',
      'Mock mode is the default when API keys are missing, so contributors can run the full stack without paying for tokens.',
    ],
    learnings: <String>[
      '11-category classification needs an iteratively-tuned gold set; the first 55-email set surfaced three categories the original taxonomy was missing.',
      'Human-in-the-loop is non-negotiable for outbound replies in a regulated industry. The throughput win comes from triage + drafting, not auto-send.',
    ],
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

    mockupType: 'phone',
    screenshots: <String>[
      'assets/images/projects/utopia/cover.png',
    ],
    decisions: <String>[
      'ERC-20 on Polygon, not Ethereum mainnet — gas costs would have killed any micro-donation use case.',
      'UUPS upgradeable proxy (OpenZeppelin) so token logic can evolve without forcing holders to migrate.',
      'Multi-signature for mint/burn/pause; no single private key can move supply.',
      'Cross-platform Flutter app for the wallet UI rather than a Web3 web frontend — mobile-first was the audience.',
    ],
    learnings: <String>[
      'Demoing at KUER.NRW Green Entrepreneurship Fair forced the team to articulate value to non-technical stakeholders within 30 seconds; that exercise rewrote half the documentation.',
      'Token economics design (vesting, governance thresholds) is more time-consuming than the smart contract itself.',
    ],
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

    mockupType: 'unreal-still',
    screenshots: <String>[
      'assets/images/projects/thesis-night/cover.png',
      'assets/images/projects/thesis-night/shot-01.png',
      'assets/images/projects/thesis-night/shot-02.png',
      'assets/images/projects/thesis-night/shot-03.png',
    ],
    decisions: <String>[
      'Synthetic Unreal Engine 5 city instead of collecting real night-driving footage — eliminated annotation cost entirely and made lighting parameters exact and reproducible.',
      'NVIDIA NDDS (Deep learning Dataset Synthesizer) plugin generated labels alongside frames; no separate annotation pipeline existed.',
      'Houdini for procedural city geometry so the 6,000-sample run was reproducible from a seed, not a one-off render.',
      'Variable lighting + weather + camera-noise parameters were exposed as the experimental axes — the paper formalised which ones move the network the most.',
    ],
    learnings: <String>[
      'Five environmental parameters disproportionately drove CNN feature extraction; everything else was noise. Future synthetic-data work should ablate on these first.',
      'Closing the sim-to-real gap is more about distribution matching than render fidelity. Lower-quality renders with the right distribution beat photoreal renders with the wrong one.',
      'Grade 1.3 on both the thesis and the companion paper — the thesis built the simulator, the paper formalised the analysis.',
    ],
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

    mockupType: 'unreal-still',
    screenshots: <String>[
      'assets/images/projects/vr-anxiety/cover.png',
    ],
    decisions: <String>[
      'Unreal Engine 5 instead of Unity — the team had Unreal expertise and the photoreal opera-house scene needed Lumen.',
      'Built the smallest believable scenario (walk to the stage of a virtual opera, deliver a short speech) instead of trying for breadth — depth read as polish to the judges.',
      'Coach script + breathing guidance in audio, not on a HUD — keeps the user looking at the audience.',
    ],
    learnings: <String>[
      'Winning the TU Dortmund Startup Weekend 2023 came down to demoable depth in 48 hours, not feature count. We rehearsed the demo more than we built features.',
      'Selection into the university\'s incubator pipeline was worth the weekend many times over.',
    ],
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

    mockupType: 'phone',
    screenshots: <String>[
      'assets/images/projects/durak/shot-01.png',
      'assets/images/projects/durak/shot-02.png',
      'assets/images/projects/durak/shot-03.png',
    ],
    decisions: <String>[
      'Generic `GameRules` interface + `GameRegistry` from Phase 13 so the same engine ships Hearts, Spades, Belote, Preferans, Uno without forking the game logic.',
      'Playwright E2E (32 tests) + server API tests (10) + exhaustive rule unit tests (57) — total >100 — added only after a 15-bug spike around the card-flip z-index taught us the cost of skipping E2E.',
      'WebSockets + Elo-based matchmaking with guest-token persistence so people can play without registering. Friction kills cards-app retention.',
      'GetX for state and a custom rendering layer hitting 60 FPS across Android, iOS, Web, Windows, macOS and Linux from one Flutter codebase.',
    ],
    learnings: <String>[
      'Rolling-update deadlocks bit us with required pod-anti-affinity + maxSurge>0; fix was `maxUnavailable: 1, maxSurge: 0` so a new pod can\'t starve a still-needed old one.',
      'Localisation in four languages (EN/RU/TR/DE) doubled organic downloads in the test markets at the cost of one engineering week.',
    ],
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

    mockupType: 'laptop',
    screenshots: <String>[
      'assets/images/projects/home-assistant/cover.png',
    ],
    decisions: <String>[
      'Proxmox VE virtualising HAOS + an MQTT broker + InfluxDB + Grafana in lightweight VMs instead of running everything on one bare-metal install — failure of any component doesn\'t take the rest down.',
      'OpenWRT in front for segmented VLANs (IoT vs trusted) — every camera, light and presence sensor sits behind a different network policy.',
      'Forty-plus room-level automations rather than chained-trigger global scenes; each room owns its rules and they compose.',
      'No cloud middleman for any sensor data — privacy was the whole point.',
    ],
    learnings: <String>[
      'Energy monitoring across 12+ devices in Grafana found two always-on devices that ate ~€200/year between them — the dashboard paid for the hardware in under a year.',
      'Segmenting IoT on its own VLAN early is much cheaper than retrofitting it after a CVE.',
    ],
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

    mockupType: 'terminal',
    screenshots: <String>[
      'assets/images/projects/voice-assistant/cover.png',
    ],
    decisions: <String>[
      'Custom wake-word from openWakeWord, not an off-the-shelf \'hey-XYZ\' — full control over which phrase wakes the mic.',
      'faster-whisper for STT instead of cloud Whisper — same model, end-to-end on-device, no audio leaves the LAN.',
      'Piper for TTS — small, fast, and indistinguishable from cloud TTS at headphone quality.',
      'MQTT into Home Assistant rather than the HA REST API — keeps the assistant in the same automation graph as any door sensor or doorbell.',
    ],
    learnings: <String>[
      'Sub-second round-trip is what makes the assistant feel \'real\' versus \'a smart speaker that works when it works\' — every component had a latency budget.',
      'Context persistence across sessions makes simple commands (\'turn that off\', \'and the other one\') feel natural — without it, every utterance has to be self-contained.',
    ],
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

    mockupType: 'terminal',
    screenshots: <String>[
      'assets/images/projects/whisper/cover.png',
    ],
    decisions: <String>[
      'faster-whisper, not the official OpenAI Whisper — int8 quantisation + four-thread CPU makes it run on resource-constrained boxes.',
      'Minimal Flask API on :10300; OpenAI-compatible enough that any client which talks to Whisper-style endpoints works against it.',
      'Multi-stage Python 3.11-slim Docker image with ffmpeg baked in — any codec the rest of the stack throws at it just works.',
      'Beam size 1 + VAD filter in production for predictable latency; quality loss vs. beam=5 is below the perception threshold for short utterances.',
    ],
    learnings: <String>[
      'Int8 quantisation cuts memory by ~3x with no audible accuracy loss on <30 s utterances; CPU inference is genuinely practical for normal commands.',
      'Treating STT as a generic sidecar (one container, fixed port, OpenAI-compatible shape) made it trivial to wire into both the voice-assistant and CaterSmart AI core later.',
    ],
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

    mockupType: 'laptop',
    screenshots: <String>[
      'assets/images/projects/shop-automation/cover.png',
    ],
    decisions: <String>[
      'FLUX.1 via a self-hosted ComfyUI graph instead of a SaaS image API — local GPU, predictable per-image cost, full control over the latent noise.',
      'Pandas-based reconciliation so every SKU on the shop is traceable back to the prompt + seed that generated it — debuggable forever.',
      'Printify for the print-on-demand backend; WooCommerce for the storefront — both have stable APIs, neither is a vendor lock-in.',
      'Three sub-services (Printify automation, image generation, property database) talking through a shared SQLite/Postgres layer rather than one monolithic CLI.',
    ],
    learnings: <String>[
      'Once the loop is fully automated, the design constraint becomes \'do the generated images sell?\' — that\'s a different (much harder) problem than building the pipeline.',
      'AI-generated product art needs consistent typography and palette rules to avoid the \'AI slop\' look; brand kits in ComfyUI were the unlock.',
    ],
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

    mockupType: 'laptop',
    screenshots: <String>[
      'assets/images/projects/immopilot/cover.png',
    ],
    decisions: <String>[
      'PostgreSQL 18.1 row-level security with `tenant_id` everywhere as defence-in-depth; SQLAlchemy-level filtering is the primary check, RLS catches the bugs.',
      'Email default is Draft in Outlook, not direct-send — every broker sees the AI draft before it goes out.',
      'Client-facing config sits in a NocoDB view, not a custom admin panel — brokers tune tonality, follow-up cadence and routing without a developer in the loop.',
      'ARQ scheduled polling against the onOffice API, not a webhook queue — onOffice doesn\'t emit webhooks and faking events out of polling is always wrong.',
      'Mistral (EU-hosted, GDPR-compliant) primary; OpenAI and Anthropic stay wired as fallbacks behind a feature flag so the provider can change in one config edit.',
    ],
    learnings: <String>[
      'onOffice\'s `qualifiedsuitors` endpoint converts free-form lead text into a 0-100% match score against the broker\'s active portfolio — once shipped, no client wanted to go back to manual matching.',
      'DSGVO + AVV documentation done before sales (DIN-5008-formatted, 50+ pages) shortens enterprise contract negotiation considerably; clients read it as a maturity signal.',
      'onPreo has no public API; architecting onOffice as the single source of truth (not a partnership integration) made the platform survive vendor uncertainty.',
    ],
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

    mockupType: 'laptop',
    screenshots: <String>[
      'assets/images/projects/catersmart/cover.png',
    ],
    decisions: <String>[
      'AI core is stateless — every request returns immediately, context is fetched on-demand from the CaterSmart REST API, single source of truth.',
      'Tenant isolation enforced on every API call with strict RAG embedding scoping per tenant — no chance of cross-tenant feedback leak.',
      'Mistral primary, Claude/OpenAI/local-OpenWebUI as drop-in fallbacks behind one env var.',
      'Service auto-enters mock mode when API keys are absent so contributors can run the full stack without paying for tokens.',
      'Strict-JSON-schema enforcement on every LLM reply lifted classification correctness more than swapping for a bigger model did.',
    ],
    learnings: <String>[
      'Phase-1 success target was \'60% perfect, 30% light-edit, 10% manual\' — naming acceptable failure modes up front kept the team from over-engineering for the long tail.',
      'Eleven email categories (NEW_INQUIRY, CHANGE_REQUEST, COMPLAINT, SPAM_NEWSLETTER, ...) took three rounds of refinement; the first taxonomy missed three real-world cases.',
      'Deferring pgvector + RAG storage out of Phase 1 was the right call — basic mock mode unblocked the API contract long before the embeddings layer was needed.',
    ],
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

    mockupType: 'phone',
    screenshots: <String>[
      'assets/images/projects/nestnode/cover.png',
    ],
    decisions: <String>[
      'Archived at concept stage: a Word doc, logos and a moodboard exist; no codebase ever materialised because the Home Assistant Edge stack absorbed the design language.',
    ],
    learnings: <String>[
      'Some projects are most useful as design exercises — the gesture-first nav and tactile energy view were rolled into the Home Assistant Edge UX work instead of shipped standalone.',
    ],
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

    mockupType: 'laptop',
    screenshots: <String>[
      'assets/images/projects/open-design/shot-01.png',
      'assets/images/projects/open-design/shot-02.png',
      'assets/images/projects/open-design/shot-03.png',
      'assets/images/projects/open-design/shot-04.png',
      'assets/images/projects/open-design/shot-05.png',
      'assets/images/projects/open-design/shot-06.png',
    ],
    decisions: <String>[
      'Auto-detect every coding-agent CLI on \$PATH (Claude Code, Cursor, Devin, Copilot, Gemini, Qwen + 6 more) instead of picking one — BYOK at every layer, no vendor lock-in.',
      'Thirty-one composable skills (27 prototype modes, 4 deck modes) grouped by scenario (design / marketing / engineering / finance / hr); the discovery form locks the brief before the agent writes a pixel.',
      'Seventy-two pre-curated brand-grade design systems (Linear, Stripe, Vercel, Notion, Anthropic, Apple) so the agent never starts from a blank page; freestyle = slop.',
      'Real `Read`/`Write`/`Bash` access against an on-disk project folder; Windows `ENAMETOOLONG` forces stdin/prompt-file fallbacks on every adapter.',
      'SQLite at `.od/app.sqlite` for project state — close the laptop, open it tomorrow, the todo card + open files are where you left them.',
      'Apache-2.0 license, runs locally or one-click to Vercel, OpenAI-compatible proxy as a universal fallback.',
    ],
    learnings: <String>[
      'Five curated visual directions (Monocle / Minimal / Utility / Brutalist / Soft) with deterministic OKLch palettes and font stacks beat \'let the LLM pick\' every time on real client work.',
      'A skill-driven workflow with locked briefs eliminates the \'agent rabbit-hole\' failure mode — the agent stops mid-iteration to ask, instead of barrelling forward.',
      'Streaming artifact preview in a sandboxed iframe gives the demo its emotional payoff. Without the streaming, the tool feels asynchronous and slow.',
    ],
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

    mockupType: 'laptop',
    screenshots: <String>[
      'assets/images/projects/freelance/cover.png',
    ],
    decisions: <String>[
      'Per-concern microservices (3D floor-plan, video, AI staging, geometry, image compression) so each can scale and fail independently.',
      'Direct stream from object storage in and out — memory pressure stays constant regardless of input size.',
      'Sandboxed Three.js viewer for live preview lets brokers see the processed asset before it leaves the platform.',
      'Mock LLM provider in development; Claude/GPT-4o swappable in production via a UI toggle.',
      'WSL2 + Podman + Makefile orchestration. Critical lesson the README enforces: the project MUST NOT live on OneDrive — active sync during build causes I/O locks.',
    ],
    learnings: <String>[
      'Health-check + disk-space check before every start catches stale dependencies or low-disk before they crash mid-run.',
      'A single `make` entry point (health-check / up / logs / db-check / seed) cuts cognitive load far more than raw docker-compose ever did.',
    ],
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

    mockupType: 'laptop',
    screenshots: <String>[
      'assets/images/projects/pscoat/cover.png',
    ],
    decisions: <String>[
      'Playwright over scraping — Upwork ships Cloudflare Turnstile + browser fingerprinting + fraud detection (Incognia, Forter); only an authenticated session bypasses the challenges.',
      'Manual login on first run; the cookie jar (`upwork_session.json`) gets reused across subsequent runs.',
      'Tone-matched reply drafting via Mistral in the company\'s voice — inbound classification (pricing / technical / callback) feeds a templating layer.',
      'Explicit TOS guardrails: documented as \'educational, personal job search\' use; commercial scraping is not the use case.',
    ],
    learnings: <String>[
      'Selector fragility against modern marketplaces is permanent — instrument the scraper so breakage is visible the day it happens, not the day a deal is lost.',
      'Session expiration cadence is undocumented; building re-auth retry in from day one is cheaper than discovering its absence at 11pm.',
    ],
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

    mockupType: 'laptop',
    screenshots: <String>[
      'assets/images/projects/theater/cover.png',
    ],
    decisions: <String>[
      'WordPress + Elementor Pro instead of bespoke — the artistic team needs a CMS they can touch, not a JAMstack repo.',
      'Versioning via timestamped backup archives (~2.8 GB across DB + uploads + plugins + themes) — Git would have been heavier and more brittle for an editorial workflow.',
      'Eventim integration for ticketing rather than a self-hosted shop — payments and refunds are someone else\'s problem.',
    ],
    learnings: <String>[
      'Backup-archive versioning works for editorial sites with one or two editors, but drift risk is real the moment a third hand touches the admin.',
    ],
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

    mockupType: 'terminal',
    screenshots: <String>[
      'assets/images/projects/widgets-pkg/cover.png',
    ],
    decisions: <String>[
      'Null-safety-first; tracks the current stable Flutter SDK and bumps in lockstep.',
      'Each widget ships with its own widget tests and dartdoc — no untested widget leaves the package.',
      'Maintained as a standalone package on pub.dev rather than vendored per-project — every Flutter app of mine starts by adding it as a dep.',
    ],
    learnings: <String>[
      'The split between portfolio app and reusable package has not always been clean; the discipline of \'if I copy-paste this widget twice, it goes into the package\' keeps it honest.',
    ],
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

    mockupType: 'terminal',
    screenshots: <String>[
      'assets/images/projects/python-recall/cover.png',
    ],
    decisions: <String>[
      'Wayland mouse-button daemon reads `/dev/input/eventN` via evdev directly — bypasses `zwp_keyboard_shortcuts_inhibitor_v1` in FreeRDP fullscreen VMs entirely.',
      'Race Gemini and Copilot on parallel threads; stream whichever responds first over SSE to a local overlay.',
      'User systemd service rather than a global daemon — runs in the user session, no root privileges needed.',
      'cosmic-screenshot on Wayland + Nvidia for frame capture; mss returns all-black frames there.',
    ],
    learnings: <String>[
      '`EVIOCGRAB` prevents others *grabbing* the device but NOT reading it — that one insight unlocked the entire daemon approach after `input-remapper` + inhibitor + compositor refused to cooperate.',
      'Systemd user services don\'t inherit group changes from `newgrp` or `usermod -aG` — a full relogin is required. Discovered the hard way.',
      'input-remapper v2 JSON expects arrays + `Super_L+F5` syntax, not `key(super+F5)`. Broken JSON fails silently.',
    ],
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

    mockupType: 'unreal-still',
    screenshots: <String>[
      'assets/images/projects/boxhead/shot-01.png',
      'assets/images/projects/boxhead/shot-02.png',
      'assets/images/projects/boxhead/shot-03.png',
      'assets/images/projects/boxhead/shot-04.png',
    ],
    decisions: <String>[
      'Unreal Engine 5 C++ for the weapon systems (spread, ricochet, projectile pooling) so the per-shot feel could be tuned to single-frame accuracy.',
      'High-res screenshot tooling baked into the build so every level-design iteration generates a marketing-grade still.',
      'Editor + shipping targets for both Linux and Windows out of the same project — no parallel platform tree.',
    ],
    learnings: <String>[
      'Maze-like claustrophobic arenas drive the wave-shooter feel more than enemy variety does; one ambient mood + tight corridors carries the game further than a roster of monsters.',
    ],
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

    mockupType: 'unreal-still',
    screenshots: <String>[
      'assets/images/projects/flappy-griffon/cover.png',
    ],
    decisions: <String>[
      'Ray-tracing for water reflections + global illumination — it\'s the visual hook in a genre that\'s usually 2D pixel art.',
      'Cross-platform from one project: Windows, Linux, Android, Mac — no parallel ports.',
      'itch.io for distribution instead of a storefront with gatekeeping — same-day publishing, no review queue.',
    ],
    learnings: <String>[
      'Reskinning a known mechanic (Flappy Bird) is a learning-vehicle accelerator; nobody has to figure out how to play, the surprise is purely visual.',
    ],
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

    mockupType: 'unreal-still',
    screenshots: <String>[
      'assets/images/projects/jumpnrun/cover.png',
    ],
    decisions: <String>[
      'Tight movement (jump buffering, coyote time, wall-slide detection) tuned up front — the level design started only after the feel was locked.',
      'Multiple project iterations (5.2, variant, ...) tracked as separate folders so old level files stayed playable as the engine updated.',
      'Checkpoints + a small replay system so the speedrun community has something to hold onto.',
    ],
    learnings: <String>[
      'Iterating on platformer feel is mostly about input latency and the curve of the jump arc; everything else (art, music, levels) is decoration on top.',
    ],
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

    mockupType: 'unreal-still',
    screenshots: <String>[
      'assets/images/projects/cv-plugin/shot-01.png',
      'assets/images/projects/cv-plugin/shot-02.png',
    ],
    decisions: <String>[
      'First-party Unreal plugin (C++) rather than an external pipeline — keeps the dataset generator on the same render thread as the scene.',
      'Writes both rendered frame and segmentation mask to disk in a YOLOv8-ready format so there\'s no intermediate conversion script.',
      'Extracted from the thesis work specifically so it can outlive the thesis as a reusable artifact.',
    ],
    learnings: <String>[
      'Plugin-as-deliverable made the research result reproducible by anyone else with UE5 — the contribution shifted from \'I trained a model\' to \'anyone can generate this dataset\'.',
    ],
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

    mockupType: 'fullbleed',
    screenshots: <String>[
      'assets/images/projects/unity-hackathon/cover.png',
    ],
    decisions: <String>[
      'MediaPipe hand-pose estimation feeding an LSTM trained on a custom captured set — off-the-shelf hand-tracking + small custom model beats one-shot models for niche gesture sets at this scale.',
      'Unity instead of a web frontend so the captured gesture set could remain on-device.',
      'Confidence bar + label overlay live on the webcam feed — visible decisions are easier to debug at a hackathon than logs.',
    ],
    learnings: <String>[
      'Computer-vision UX at a hackathon stands or falls on a working live demo; the LSTM beat the one-shot model purely because it was demoable.',
    ],
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

    mockupType: 'terminal',
    screenshots: <String>[
      'assets/images/projects/steam-market/cover.png',
    ],
    decisions: <String>[
      'Cookie-based authenticated session that respects Steam\'s rate limits — anonymous scraping gets banned within minutes.',
      'Steam\'s 15% market fee baked into every simulated trade — opportunities that ignore the fee look 10x bigger than they are.',
      'Local SQLite with a risk-score per opportunity so stale or thin-volume listings get filtered out before a human sees them.',
    ],
    learnings: <String>[
      'Most \'arbitrage\' opportunities on inefficient marketplaces are actually liquidity traps; ranking by risk-of-execution beats ranking by raw margin.',
    ],
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

    mockupType: 'terminal',
    screenshots: <String>[
      'assets/images/projects/image-upscaler/cover.png',
    ],
    decisions: <String>[
      'Real-ESRGAN `realesr-general-x4v3` (VGG-style) with an optional `wdn` (denoising) variant — configurable denoise control beats RRDB models for end-user content.',
      'GPU and tile size abstracted via `GPU_ID` and `TILE` environment variables so the inference server can route across hardware without code changes.',
      'Face-aware denoise as an env-flag (`FACE_DENOISE`) to preserve facial detail without forcing the latency cost when content has no faces.',
      'Suffix-based output dedup (`OUTPUT_SUFFIX`) with a remote file check, so re-running the watcher never re-upscales the same image.',
      'Bundled Real-ESRGAN clone vendored into the repo — avoids upstream dependency brittleness, with an active archival policy for training-only code in `tests/` and `scripts/`.',
    ],
    learnings: <String>[
      'Environment variables (not `.env` files) for SFTP keys are essential for workflow engines like n8n that don\'t read disk-side env files.',
      'Face detection adds real quality at real latency cost — making it env-optional, not always-on, lets the operator tune per use case.',
    ],
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

    mockupType: 'terminal',
    screenshots: <String>[
      'assets/images/projects/image-uploader/cover.png',
    ],
    decisions: <String>[
      'Selenium-driven Chromium via the remote-debugging protocol so sessions persist across runs and auth survives.',
      'Test harness (`test_selenium.py`) with optional debugger and profile parameters for local-iteration speed.',
      'One pipeline supports both Adobe Stock and ImmoWare — same auth/upload/tag primitives, different selectors.',
    ],
    learnings: <String>[
      'Browser automation against dynamic SPA content is more stable than parsing HTML once the auth/profile-reuse problem is solved.',
    ],
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

    mockupType: 'terminal',
    screenshots: <String>[
      'assets/images/projects/django-canva/cover.png',
    ],
    decisions: <String>[
      'Django 5.2.5 + PostgreSQL + python-decouple for config — boring stack, fast iteration.',
      'Templates expressed as JSON (text/color/image/gradient/icon) and composed with Pillow into pixel-perfect PNG/SVG.',
      'Docker + docker-compose shaped to match production so \'works on my machine\' actually does mean works in production.',
    ],
    learnings: <String>[
      'Declarative-template rendering server-side beats client-side canvas rendering when the asset has to land in an email or a CDN URL.',
    ],
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

    mockupType: 'terminal',
    screenshots: <String>[
      'assets/images/projects/binance-tax/cover.png',
    ],
    decisions: <String>[
      'WeasyPrint for the HTML-to-PDF step — pango + cairo handle German typography without typesetting drama.',
      'FIFO cost basis (not LIFO/HIFO) because that\'s what the Finanzbehörde wants; no opinion required.',
      'CLI rather than a UI: the tool is used once a year per portfolio, and headless fits CI / cron / one-off runs cleanly.',
    ],
    learnings: <String>[
      'Compliance documents look way more credible when they use the right typography — DIN-style margins and faces did more for trust than feature work would have.',
    ],
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

    mockupType: 'laptop',
    screenshots: <String>[
      'assets/images/projects/wp-plugins/cover.png',
    ],
    decisions: <String>[
      'Each plugin ships with PHPUnit tests and inline dartdoc-style docblocks; \'it boots on my server\' is not the bar.',
      'Tracks the WordPress LTS line for long-term compatibility — every plugin survives at least three WP major versions.',
      'Released under GPL so the client work can be re-used by other small teams without licensing friction.',
    ],
    learnings: <String>[
      'WordPress.org plugin review is more about coding-standards conformance than feature value — meeting the standards once made every subsequent release frictionless.',
    ],
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

    mockupType: 'fullbleed',
    screenshots: <String>[
      'assets/images/projects/turtlebot/cover.png',
    ],
    decisions: <String>[
      'ROS C++ as primary language — coursework-mandated, but it also turned out to be the right call for real-time control loops.',
      'Modular nodes with message-passing IPC (canonical ROS pattern) instead of a monolithic controller.',
      'Gazebo simulation as the first test harness; only after the SLAM + path planner passed simulation did we touch the physical robot.',
    ],
    learnings: <String>[
      'ROS\'s publish/subscribe decoupling enforces disciplined state management more than any code-review process I\'ve been part of.',
      'Hardware bugs feel different from software bugs — sensor jitter, motor torque variation, mechanical drift all show up as bizarre traces on the same wire you tested yesterday.',
    ],
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

    mockupType: 'fullbleed',
    screenshots: <String>[
      'assets/images/projects/paper-citysim/cover.png',
    ],
    decisions: <String>[
      'Companion paper to the thesis: thesis builds the simulator + dataset, the paper formalises the lighting/training-parameter analysis.',
      'Grade 1.3 result — same as the thesis. Treating the paper as a separate artifact (not a section of the thesis) made the analysis sharper.',
    ],
    learnings: <String>[
      'Writing the paper retroactively forced gaps in the experimental design to surface; the thesis could not have caught them on its own.',
    ],
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

    mockupType: 'laptop',
    screenshots: <String>[
      'assets/images/projects/this-site/cover.png',
    ],
    decisions: <String>[
      'Forked david-legend\'s upstream Cobbina template, then maintained via cherry-pick (not direct rebase) — heavy customisations stay clean of upstream churn.',
      '`useMaterial3: false` enforced to retain Material 2 ink ripples and elevation; M3 introduced visual drift in the top nav and footer that wasn\'t worth fighting.',
      'Flutter 3.41.9 inside `ghcr.io/cirruslabs/flutter:stable` Podman container — no host Flutter install, builds reproduce on any machine.',
      'Brand fonts: URW Gothic (Century Gothic substitute) + Carlito (Calibri, CanvasKit-compatible) + Inter — all OFL, no Microsoft DSIG blocker.',
      'Two-repo pattern: source repo `burak_basci_website` for code, `burak-basci.github.io` for the deployed static site — independent release cycle, no live-site risk during dev.',
    ],
    learnings: <String>[
      'Microsoft\'s DSIG-signed fonts break CanvasKit — discovered the hard way; OFL metric-compatible alternatives are non-negotiable for Flutter Web.',
      'Plugging in real per-section animation controllers + VisibilityDetector lifts the perceived premium of the site more than any individual font or layout decision.',
    ],
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
