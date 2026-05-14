import 'package:flutter/material.dart';

import '../widgets/project_item/project_item.dart';

const String _d = 'assets/images/projects';

/// Ordered MOST → LEAST prestigious. The home-page cascade renders the full
/// list; the per-entry `screenshots` + `decisions` + `learnings` lists drive
/// the detail page.
final List<ProjectItemData> recentWorks = <ProjectItemData>[
  // 01 ----------------------------------------------------------------------
  ProjectItemData(
    title: 'Volkswagen AI Patent Search',
    subtitle: 'Hybrid semantic search engine — VW Infotainment',
    category: 'AI / SEARCH',
    platform: 'Web · Internal',
    primaryColor: const Color(0xFF1E3A8A),
    image: '$_d/patent-search/cover.png',
    coverUrl: '$_d/patent-search/cover.png',
    technologyUsed:
        'Flutter Web · Django · ElasticSearch · Vector Embeddings · Django Canvas (PDF/image gen) · UML/SysML',
    portfolioDescription:
        'Production AI patent-search tool I built end-to-end at Volkswagen '
        'Infotainment, scaled across three departments and 50+ internal '
        'engineers. Hybrid retrieval over a tuned ElasticSearch index '
        'combines BM25 keyword scoring with dense vector embeddings; an '
        'A/B-tested ranking layer lifted precision by 25% and cut '
        'researcher time-to-discovery by 40%. A small Django service '
        '("Django Canvas") renders branded export PDFs and result-page '
        'images on demand. The full landscape was modelled in Enterprise '
        'Architect (UML/SysML), mapping 100% of infra-to-code '
        'dependencies for the DevSecOps handover.',
    isPublic: false,
    isLive: true,
    mockupType: 'laptop',
    screenshots: <String>['$_d/patent-search/cover.png'],
    decisions: <String>[
      'Picked **hybrid BM25 + dense-vector retrieval** instead of pure semantic search — pure embeddings consistently missed the exact-term matches that legal teams actually search for (Patent IDs, claim numbers, named entities), and that gap was a non-starter for the audience.',
      'Ran every ranking-weight change through an **A/B-test against a fixed query bank** rather than shipping by feel — only three configurations cleared the bar; the rest looked good in demos and lost on real searches.',
      'Embedded **PDF + image rendering inside the same Django backend** ("Django Canvas") rather than calling a third-party export service, because every export contained patent text under NDA and could not leave the boundary.',
      'Modelled the full system in **Enterprise Architect (UML/SysML) before writing code** — the upfront diagram surfaced a missing security boundary that would have failed the security audit if discovered later.',
    ],
    learnings: <String>[
      'Cognitive-load audits with patent counsel showed the real bottleneck was *reading dozens of false positives*, not query latency — I rebalanced the roadmap toward ranking quality, away from response-time wins that wouldn\'t have moved the needle.',
      'Treating the infra-to-code dependency graph as a first-class deliverable — not a side-effect — survived three team rotations as the operational contract.',
    ],
  ),

  // 02 ----------------------------------------------------------------------
  ProjectItemData(
    title: 'Hetzner k3s Infrastructure',
    subtitle: 'Sovereign GitOps cluster for a 700-unit real-estate portfolio',
    category: 'DEVSECOPS / CLOUD',
    platform: 'Hetzner Cloud',
    primaryColor: const Color(0xFFEA580C),
    image: '$_d/k3s/cover.png',
    coverUrl: '$_d/k3s/cover.png',
    technologyUsed:
        'k3s · Terraform · ArgoCD · Traefik · Helm · Longhorn · CloudNativePG · Prometheus · Grafana',
    portfolioDescription:
        'A production-grade sovereign Kubernetes platform on Hetzner Cloud '
        'running 15+ self-hosted services for a 700+ unit real-estate '
        'portfolio. Three-node HA k3s with CloudNativePG + MariaDB '
        'Galera; Longhorn for application RWX, Hetzner Volumes for the '
        'database tier. Provisioning is a single `terraform apply`; '
        'ArgoCD then GitOps-syncs every service. Lead time fell from '
        '4 days to 45 minutes (95% improvement), annual licensing spend '
        'dropped €20k, and Prometheus + Grafana cut MTTD by 40%.',
    isPublic: false,
    isLive: true,
    mockupType: 'terminal',
    screenshots: <String>['$_d/k3s/cover.png'],
    decisions: <String>[
      'Chose **Hetzner Cloud + k3s** over managed Kubernetes (EKS/GKE/AKS) because the workload is HA-stable and predictable — managed control planes would have cost roughly 10× more for zero functional gain.',
      'Split the cluster into **control-plane storage nodes vs. application nodes via taints/tolerations** — without that separation an app deploy could starve the databases of CPU/IO; learned that the hard way on an early test cluster.',
      'Used **Hetzner Volumes (RWO) for databases** but **Longhorn (RWX) for application state** — single-replica block devices are dramatically faster for Postgres, and Longhorn\'s replication only earns its keep where multiple pods actually need shared state.',
      'Opted for **DNS-01 wildcard TLS via Cloudflare cert-manager** over HTTP-01 — every new subdomain across `*.benotable.de` inherits the wildcard, avoiding a per-service ACME round-trip on first request.',
      'Single **.env file as the source of truth** for every Helm release — disaster recovery is now "scp the env, terraform apply, helm install", not a treasure hunt across YAML files.',
    ],
    learnings: <String>[
      'WordPress Multisite was bottlenecked on Longhorn NFS share-manager (RWX); moving to a single-replica RWO ext4 block device cut TTFB from 110 ms to 65 ms — picked the wrong storage tier for the workload the first time around.',
      'Longhorn RWX share-manager pods silently fail to schedule without explicit taint-toleration entries; the only signal is "Pending forever" — instrument scheduler logs early.',
      'A GitOps reproducible cluster pays back the most on its second incarnation: I rebuilt the whole platform in a fork during a major change and the round-trip was an afternoon.',
    ],
  ),

  // 03 ----------------------------------------------------------------------
  ProjectItemData(
    title: 'PostPilot — Social-Media Automation',
    subtitle: 'AI-driven multi-platform content SaaS for SMBs',
    category: 'SAAS / AI',
    platform: 'Web',
    primaryColor: const Color(0xFF0F766E),
    image: '$_d/postflow/cover.png',
    coverUrl: '$_d/postflow/cover.png',
    technologyUsed:
        'Next.js 15 · FastAPI · SQLAlchemy 2 async · Alembic · PostgreSQL 16 + pgvector · MinIO · Temporal · LangGraph',
    portfolioDescription:
        'PostPilot is a social-media automation SaaS that lets small '
        'businesses post to nine networks in under 15 minutes a day. '
        'Strict-TypeScript Next.js 15 frontend with shadcn/ui and '
        'TanStack Query talks to an async FastAPI + SQLAlchemy 2 '
        'backend. Temporal orchestrates the long-running posting flows; '
        'LangGraph agents (on GitHub Copilot Pro) draft captions and '
        'platform-specific variants; PostgreSQL 16 + pgvector + MinIO '
        'hold structured data and media. Currently live at '
        'app.benotable.de while the PostPilot domain is provisioned.',
    isPublic: false,
    isLive: true,
    webUrl: 'https://app.benotable.de',
    mockupType: 'laptop',
    screenshots: <String>['$_d/postflow/cover.png'],
    decisions: <String>[
      'Picked **Temporal over cron + Redis locks** for the workflow engine — a multi-step "draft → moderate → schedule → post → confirm" flow gets retry, deterministic replay and an inspectable history for free; rebuilding that on plain queues is months of work.',
      'Chose **PostgreSQL 16 + pgvector** instead of a separate vector DB — one backup, one wire protocol, one access-control surface. Operational simplicity beats best-of-breed when the team is one person.',
      'Used **strict TypeScript with no `any` escape hatches** end-to-end against the FastAPI schema; the discipline catches contract drift between client and server in the editor, before any deploy.',
      'Made the GitLab CI **db-backup-first** — the deploy job refuses to run without a fresh snapshot. Adding it cost ten minutes; not adding it would have cost a customer at some point.',
      'Self-hosted on **a single Hetzner CX33** — the entire stack costs less than the comparable managed Postgres SKU alone, and the platform stays portable.',
    ],
    learnings: <String>[
      'LangGraph-style agent graphs are easier to reason about than chains once you have more than two LLM steps with conditional routing; chains turn spaghetti, graphs stay legible.',
      'Routing GitHub Copilot Pro behind the agents (instead of OpenAI direct) made costs scale linearly with content volume, not exponentially with re-prompts.',
    ],
  ),

  // 04 ----------------------------------------------------------------------
  ProjectItemData(
    title: 'LuminaRep — Clinic Review SaaS',
    subtitle: 'AI social-proof platform for medical-aesthetics practices',
    category: 'SAAS / AI',
    platform: 'Web',
    primaryColor: const Color(0xFF047857),
    image: '$_d/luminarep/cover.png',
    coverUrl: '$_d/luminarep/cover.png',
    technologyUsed:
        'Next.js 15 · TypeScript · PostgreSQL · NextAuth · Google Gemini · Stripe · Tailwind · Docker Compose',
    portfolioDescription:
        'LuminaRep is a premium SaaS for medical-aesthetics and '
        'cosmetic-surgery clinics. It auto-extracts each clinic\'s '
        '5-star Google reviews and turns every one into three Instagram '
        'captions, a TikTok script and Midjourney/DALL-E image prompts '
        'in the practice\'s tone of voice. Email-and-password auth via '
        'NextAuth, Stripe metered subscriptions with a 7-day trial, '
        'and a luxury dark-mode UI in emerald + gold. Fully '
        'containerised — a clinic that wants self-hosting can run the '
        'whole platform on its own server.',
    isPublic: false,
    isLive: true,
    mockupType: 'laptop',
    screenshots: <String>['$_d/luminarep/cover.png'],
    decisions: <String>[
      'Picked **Gemini for the content-generation pass** over GPT-4 and Claude — in side-by-side testing on real clinic reviews, Gemini consistently produced the most clinic-friendly tone with the fewest hallucinated medical claims (which would have been a regulatory risk).',
      'Chose **NextAuth for email + password** instead of a third-party identity provider — clinics are GDPR-sensitive and a small attack surface I fully control beat outsourcing to a vendor I\'d have to audit anyway.',
      'Designed the **5-star-only review-extraction funnel** rather than letting clinics cherry-pick — auto-extraction removes the cognitive load that kills retention, and the constraint is a feature ("we only ever amplify your real wins").',
      'Bundled the whole stack into **Docker Compose with a production deploy guide** — clinics can keep patient-adjacent data on premises if they need to, without me having to support a second deployment path.',
    ],
    learnings: <String>[
      'A luxury dark-mode UI (emerald + gold) actually mattered more to clinic owners than the underlying tech — design investment paid back faster than feature work in early sales conversations.',
    ],
  ),

  // 05 ----------------------------------------------------------------------
  ProjectItemData(
    title: 'LLM Mail Triage — Intent Engine',
    subtitle: 'Pluggable-provider email classification + drafting service',
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
        'incoming mail into one of eleven categories, extracts sender + '
        'intent + structured fields, and drafts a reply — strictly '
        'behind a human-in-the-loop gate. Provider is pluggable via a '
        'single config (Mistral / Claude / OpenAI / local OpenWebUI), '
        'so EU-residency requirements get a config change instead of a '
        'refactor. Throughput climbed 80%, accuracy holds at 95%, and '
        'the service saves about 8 engineering-hours/week on a real '
        'customer mailbox.',
    isPublic: false,
    isLive: true,
    mockupType: 'terminal',
    screenshots: <String>['$_d/llm-mail/cover.png'],
    decisions: <String>[
      'Enforced **strict JSON-schema mode on every LLM reply** with retry-on-parse-failure — the accuracy lift from that constraint alone was bigger than from swapping for a bigger model. Larger model with loose JSON still hallucinated tags.',
      'Designed an **LLM_PROVIDER abstraction over a single env var** so EU-residency clients can switch from OpenAI to Mistral or to a self-hosted OpenWebUI without code changes; the alternative — per-tenant builds — would have multiplied the deployment matrix.',
      'Kept the service **stateless** with a **mock mode default when keys are missing** — contributors can run and test the full stack without consuming tokens, and CI can run the end-to-end suite without a budget line.',
      'Made the **human-in-the-loop a hard gate** rather than an opt-in — auto-send in a regulated industry has unbounded downside, and the throughput win comes from triage + drafting, not from sending.',
    ],
    learnings: <String>[
      'Eleven-category classification needed three rounds of taxonomy refinement; the first gold set was missing three categories I only discovered by reading the long-tail of real mail.',
      'JSON-schema enforcement is the highest-leverage knob in LLM serving today — it bought more correctness than two model-size jumps would have.',
    ],
  ),

  // 06 ----------------------------------------------------------------------
  ProjectItemData(
    title: 'Utopia Community',
    subtitle: 'Environmental Web3 platform — Technical Lead',
    category: 'WEB3 / CHARITY',
    platform: 'iOS · Android · Web',
    primaryColor: const Color(0xFF16A34A),
    image: '$_d/utopia/cover.png',
    coverUrl: '$_d/utopia/cover.png',
    technologyUsed:
        'Flutter · Solidity 0.8 · OpenZeppelin · UUPS Proxy · Polygon · Firebase',
    portfolioDescription:
        'A cross-platform Flutter app paired with an upgradeable ERC-20 '
        '(UWCT) on Polygon, channelling token-aligned donations into '
        'environmental and charitable causes. As Technical Lead of a '
        'remote agile team of two I owned the full roadmap from token '
        'economics through requirements engineering to UI, and shipped '
        'a feature-complete MVP in 12 months. Demoed at the KUER.NRW '
        'Green Entrepreneurship Fair to 20+ stakeholders and investors.',
    isPublic: false,
    isLive: true,
    mockupType: 'phone',
    screenshots: <String>['$_d/utopia/cover.png'],
    decisions: <String>[
      'Picked **Polygon over Ethereum mainnet** for the token contract — gas costs on L1 would have killed any micro-donation use case before the first transaction settled.',
      'Used a **UUPS upgradeable proxy (OpenZeppelin)** rather than a non-upgradeable token because the protocol logic was certain to evolve, and forcing token holders to migrate is a one-way trip to abandonment.',
      'Made **every supply-mutating operation (mint, burn, pause) multi-signature** — a single key on a charity token is a single point of failure for the entire mission.',
      'Chose **Flutter cross-platform** for the wallet UI over a Web3 web frontend — donors are on phones, not desktops; meeting them where they are dropped onboarding friction.',
    ],
    learnings: <String>[
      'Demoing at KUER.NRW forced the team to articulate value to non-technical stakeholders in 30 seconds. That single exercise rewrote half the project documentation.',
      'Token-economics design (vesting, governance thresholds, burn mechanics) consumed more time than the smart-contract code itself — model the incentives before the code.',
    ],
  ),

  // 07 ----------------------------------------------------------------------
  ProjectItemData(
    title: 'Night-Drive Object Detection',
    subtitle: 'TU Dortmund Institute of Robotics — thesis + paper + Unreal plugin + Turtlebot',
    category: 'ML / ROBOTICS RESEARCH',
    platform: 'Unreal · Python · ROS',
    primaryColor: const Color(0xFF1E1B4B),
    image: '$_d/thesis-night/cover.png',
    coverUrl: '$_d/thesis-night/cover.png',
    technologyUsed:
        'Unreal Engine 5 (C++) · NVIDIA NDDS · Houdini · YOLOv8 · Python · PyTorch · ROS · C++',
    portfolioDescription:
        'My full body of work at the TU Dortmund Institute of Robotics: a '
        'B.Sc. thesis on CNN-based night-time object detection, the '
        'companion paper formalising the lighting/training-parameter '
        'analysis (both graded 1.3 — top decile), a first-party Unreal '
        'Engine 5 plugin that exposes semantic segmentation to gameplay '
        'and writes YOLOv8-ready datasets, and earlier coursework '
        'programming a TurtleBot with ROS in C++. The Unreal city '
        'simulation with a Houdini procedural pipeline and NVIDIA NDDS '
        'labelling eliminated 100% of manual annotation across 6,000+ '
        'training samples.',
    isPublic: false,
    isLive: false,
    mockupType: 'unreal-still',
    screenshots: <String>[
      '$_d/thesis-night/shot-01.png',
      '$_d/thesis-night/shot-02.png',
      '$_d/thesis-night/shot-03.png',
      '$_d/cv-plugin/shot-01.png',
      '$_d/cv-plugin/shot-02.png',
    ],
    decisions: <String>[
      'Generated the entire training set from a **synthetic Unreal Engine 5 city** instead of collecting real night-driving footage — annotation cost dropped to zero and every lighting parameter became exact, reproducible and ablatable. Real-world footage would have required either an army of annotators or a sketchy active-learning loop.',
      'Used **NVIDIA NDDS (Deep-learning Dataset Synthesizer)** to generate labels alongside frames so the labelling pipeline was strictly bundled with the renderer — no separate annotation infrastructure to drift out of sync with the simulator.',
      'Procedurally generated city geometry with **Houdini** so the 6,000-sample run was reproducible from a seed, not a hand-curated one-off render — re-running an experiment with different lighting took minutes, not days.',
      'Built the segmentation logic as a **first-party Unreal C++ plugin** rather than an external Python pipeline so the dataset generator stayed on the same render thread as the scene — no copy-out-to-disk-and-back per frame.',
      'Started the Robotics minor with **ROS C++ Turtlebot coursework** before touching deep learning — message-passing IPC discipline carried straight into how I structured the synthetic-data pipeline.',
    ],
    learnings: <String>[
      'Five environmental parameters disproportionately drove CNN feature extraction; everything else was noise. Future synthetic-data work should ablate on these five before touching architecture.',
      'Closing the sim-to-real gap is more about distribution matching than render fidelity — lower-quality renders with the right distribution beat photoreal renders with the wrong one.',
      'Treating the plugin as a deliverable in its own right (not buried in a thesis appendix) made the work reusable: anyone with UE5 can regenerate the dataset.',
      'Hardware bugs feel different from software bugs — sensor jitter, motor torque variation, and mechanical drift on the Turtlebot taught me to instrument the wire, not just the code.',
    ],
  ),

  // 08 ----------------------------------------------------------------------
  ProjectItemData(
    title: 'VR Anxiety Trainer',
    subtitle: '1st place — TU Dortmund Startup Weekend 2023',
    category: 'VR / HEALTHCARE',
    platform: 'Meta Quest',
    primaryColor: const Color(0xFF6D28D9),
    image: '$_d/vr-anxiety/cover.png',
    coverUrl: '$_d/vr-anxiety/cover.png',
    technologyUsed: 'Unreal Engine 5 · Blueprints · OpenXR',
    portfolioDescription:
        'A VR exposure-therapy prototype for social anxiety, set on the '
        'stage of a virtual opera house. Own the room, walk to the '
        'centre, deliver a short speech to a virtual audience while a '
        'coach script guides the breathing. Won 1st place at TU '
        'Dortmund Startup Weekend 2023, outperforming nine competing '
        'teams on technical execution and market validation; selected '
        'to advance into the university\'s incubator pipeline.',
    isPublic: false,
    isLive: false,
    mockupType: 'unreal-still',
    screenshots: <String>['$_d/vr-anxiety/cover.png'],
    decisions: <String>[
      'Picked **Unreal Engine 5** over Unity for the build because the team had Unreal expertise and the photoreal opera scene needed Lumen — Unity\'s URP at the time wouldn\'t have hit the same visual bar in a single weekend.',
      'Built the **smallest believable scenario** (walk to the stage, deliver a short speech) instead of trying for breadth across multiple anxiety triggers — depth reads as polish to judges; breadth at a hackathon reads as half-finished.',
      'Put the coach script + breathing guidance in **audio, not a HUD** — a heads-up display in VR breaks immersion the moment the user looks at it, and immersion is the entire therapeutic mechanism.',
    ],
    learnings: <String>[
      'Winning a hackathon comes down to demoable depth in 48 hours, not feature count — we rehearsed the demo more than we built features in the last twelve hours.',
      'Selection into the university\'s incubator pipeline turned out to be worth the weekend many times over.',
    ],
  ),

  // 09 ----------------------------------------------------------------------
  ProjectItemData(
    title: 'Durak — Cross-Platform Card Game',
    subtitle: 'Six-platform Flutter game, live at durak.burakbasci.de',
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
        'every legal attack/defend pair against a heuristic that mirrors '
        'how strong human players think about trump leverage and '
        'hand-reduction. Custom rendering pushes 60 FPS on commodity '
        'hardware, GetX drives a reactive state graph, 31 unit tests + '
        'Playwright E2E protect the core rules, and the socket layer is '
        'staged for online multiplayer. Live at durak.burakbasci.de.',
    isPublic: false,
    isLive: true,
    webUrl: 'https://durak.burakbasci.de',
    mockupType: 'phone',
    screenshots: <String>[
      '$_d/durak/shot-01.png',
      '$_d/durak/shot-02.png',
      '$_d/durak/shot-03.png',
    ],
    decisions: <String>[
      'Extracted a **`GameRules` interface + `GameRegistry`** in Phase 13 so the engine could ship Hearts, Spades, Belote, Preferans and Uno without forking the game logic — previously every new variant was a copy-paste, which was bound to drift.',
      'Adopted **Playwright E2E (32 tests) + server API tests (10) + exhaustive rule unit tests (57)** only after a 15-bug spike around the card-flip z-index — total >100 tests now block every release. Skipping E2E once cost a full week of regressions.',
      'Used **WebSockets + Elo-based matchmaking with guest-token persistence** so people can play without registering. Required registration on a cards app destroys retention; the cost of supporting guests is rounding error.',
      'Picked **GetX over Bloc/Riverpod** for state — at the time it had the lowest boilerplate-per-feature for a small team, and the reactive bindings fit a turn-based game cleanly.',
    ],
    learnings: <String>[
      'A rolling-update deadlock bit us with required pod-anti-affinity + maxSurge>0 on the deployment; fix was `maxUnavailable: 1, maxSurge: 0` so a new pod can\'t starve a still-needed old one.',
      'Localising in four languages (EN/RU/TR/DE) roughly doubled organic downloads in the test markets at the cost of one engineering week — best ROI of the year.',
    ],
  ),

  // 10 ----------------------------------------------------------------------
  ProjectItemData(
    title: 'Sovereign Smart Home',
    subtitle: 'Edge-only Proxmox + HAOS + MQTT stack',
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
        'Proxmox virtualises Home Assistant OS, an MQTT broker, '
        'InfluxDB and Grafana in lightweight VMs; OpenWRT handles '
        'segmented VLANs for IoT vs. trusted devices; openSUSE runs '
        'background workloads. Forty-plus room-level automations tie '
        'climate, lighting, presence and security together through '
        'sensor-fusion rules.',
    isPublic: false,
    isLive: false,
    mockupType: 'laptop',
    screenshots: <String>['$_d/home-assistant/cover.png'],
    decisions: <String>[
      'Virtualised every component on **Proxmox in lightweight VMs** instead of running them on one bare-metal install, because a single bad upgrade on the smart-home host shouldn\'t take the broker and the database down with it. Isolation is the whole point.',
      'Put **OpenWRT in front for segmented VLANs** — every camera, light and presence sensor sits behind its own network policy. Retrofitting that segmentation after a CVE is much more expensive than starting with it.',
      'Wrote **room-owned automations** rather than chained-trigger global scenes — each room\'s rules compose with the next without inheriting global side-effects, and a misbehaving rule blast-radius stays in that room.',
      'Refused **every cloud middleman** — privacy was the entire reason for the project; trading it for convenience would have defeated the point.',
    ],
    learnings: <String>[
      'Energy monitoring across 12+ devices in Grafana found two always-on appliances eating ~€200/year between them — the dashboard paid for the hardware in under a year.',
      'IoT segmentation on its own VLAN from day one is dramatically cheaper than adding it after a smart bulb gets a CVE.',
    ],
  ),

  // 11 ----------------------------------------------------------------------
  ProjectItemData(
    title: 'Local AI Voice Assistant',
    subtitle: 'On-device wake-word + Whisper STT + local LLM + Piper TTS',
    category: 'AI / EDGE',
    platform: 'Linux',
    primaryColor: const Color(0xFF14B8A6),
    image: '$_d/voice-assistant/cover.png',
    coverUrl: '$_d/voice-assistant/cover.png',
    technologyUsed:
        'faster-whisper · Piper TTS · openWakeWord · local LLM · Flask · MQTT',
    portfolioDescription:
        'A privacy-first voice assistant that runs end-to-end on '
        'commodity hardware. A custom wake-word from openWakeWord '
        'triggers a self-hosted faster-whisper service (Flask on '
        ':10300, int8 quantised) for speech-to-text; a local LLM '
        'resolves intent; Piper TTS speaks the reply. The Whisper '
        'sidecar is generic enough that it also feeds the CaterSmart '
        'AI core whenever audio needs transcription inside the '
        'sovereign cluster. The whole pipeline returns under a second '
        'on a single GPU, no audio ever leaves the LAN, and commands '
        'route through MQTT into the same Home Assistant automation '
        'graph as every other event in the house.',
    isPublic: false,
    isLive: false,
    mockupType: 'terminal',
    screenshots: <String>['$_d/voice-assistant/cover.png'],
    decisions: <String>[
      'Used **faster-whisper (int8 quantised) instead of cloud Whisper** because the project\'s entire premise was that no audio leaves the LAN — same model accuracy, ~3× smaller memory footprint, runs on a CPU box.',
      'Picked a **custom openWakeWord model** rather than a generic "hey-XYZ" wake phrase — full control over which sound wakes the mic, and no licence on the trigger word.',
      'Chose **Piper TTS over a cloud voice API** — at headphone quality it\'s indistinguishable, free, and offline. The cloud version was a worse trade on every axis except setup time.',
      'Speaks **MQTT into Home Assistant** rather than calling the HA REST API — keeps the assistant in the same automation graph as any door sensor or doorbell. REST would have created a second event bus.',
      'Wrapped Whisper as a **generic OpenAI-compatible sidecar on :10300** so it can also serve the CaterSmart AI core — one sidecar, two consumers, no code duplication.',
    ],
    learnings: <String>[
      'Sub-second round-trip is what makes the assistant feel real versus "a smart speaker that works when it works" — every component (wake-word, STT, LLM, TTS) had to live inside its own latency budget.',
      'Context persistence across utterances makes commands like "turn that off" or "and the other one" feel natural — without it, every utterance has to be self-contained, and adoption falls off a cliff.',
      'Int8 quantisation cuts memory ~3× with no audible accuracy loss on short utterances — CPU inference is genuinely practical once the latency budget is respected.',
    ],
  ),

  // 12 ----------------------------------------------------------------------
  ProjectItemData(
    title: 'AI-Driven Print-on-Demand Shop',
    subtitle: 'shop.burakbasci.de — generative pipeline, upscaler, bulk uploader',
    category: 'AUTOMATION / E-COMMERCE',
    platform: 'Web',
    primaryColor: const Color(0xFFF59E0B),
    image: '$_d/shop-automation/cover.png',
    coverUrl: '$_d/shop-automation/cover.png',
    technologyUsed:
        'Python · ComfyUI · FLUX.1 · Real-ESRGAN · Selenium · Printify API · WooCommerce · Pandas',
    portfolioDescription:
        'An end-to-end content and product pipeline: FLUX.1 (via a '
        'self-hosted ComfyUI graph) generates designs on a cron '
        'schedule; a Real-ESRGAN upscaler with face-aware denoise '
        'pushes each design to 4× resolution over SFTP; a Selenium '
        'uploader pushes the resulting product to the Adobe Stock + '
        'ImmoWare side-listings; the Printify API places designs on '
        'print-on-demand products and ships them to the WooCommerce '
        'storefront. A Pandas reconciliation step matches every order '
        'back to the original prompt + seed, so every product on the '
        'shop is traceable to the latent that made it.',
    isPublic: true,
    isLive: true,
    webUrl: 'https://shop.burakbasci.de',
    mockupType: 'laptop',
    screenshots: <String>['$_d/shop-automation/cover.png'],
    decisions: <String>[
      'Picked **self-hosted ComfyUI + FLUX.1 on local GPU** over a SaaS image API — predictable per-image cost, no rate limit, full control over the latent and the brand-kit prompt graph; SaaS would have priced the whole funnel out of viability.',
      'Built the **Real-ESRGAN upscaler as an SFTP-watcher sidecar** with `realesr-general-x4v3` (VGG-style) instead of the heavier RRDB models — configurable denoise control mattered more for print quality than peak benchmark numbers.',
      'Used **Selenium with the Chromium remote-debugging protocol** for the Adobe Stock + ImmoWare uploads because neither has a workable API for batch posting — automation against the actual web UI was the only viable path.',
      'Made **suffix-based output dedup** (`OUTPUT_SUFFIX`) with a remote-existence check so the watcher never re-upscales the same image after a restart — without it, the queue would spin on already-done work.',
      'Built **Pandas-based reconciliation** so every SKU is traceable back to the prompt + seed that generated it — once it works, the next bug becomes "do the generated images sell?", which is the right next problem.',
    ],
    learnings: <String>[
      'Once the pipeline is fully automated, the design constraint shifts from "does it ship" to "does the art sell" — a totally different problem.',
      'Brand kits in ComfyUI (consistent typography, palette, composition rules) were the unlock for avoiding the generic "AI-slop" look that kills conversion.',
      'Face-aware denoise was worth the latency cost for portrait-style designs and dead weight for everything else — making it environment-optional, not always-on, let the operator tune per batch.',
    ],
  ),

  // 13 ----------------------------------------------------------------------
  ProjectItemData(
    title: 'ImmoPilot — Real-Estate SaaS',
    subtitle: 'Multi-tenant CRM-and-mail automation for German brokers',
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
        'workers poll onOffice for new leads while LLM classifiers '
        'draft replies and match leads against the broker\'s active '
        'portfolio. The "qualified-suitors" matcher converts free-form '
        'lead text into a 0-100% match score; n8n then formats the '
        'result as a DIN-5008 compliant DOCX/PDF "Angebot". Runs on '
        'the sovereign k3s platform with full Prometheus + Grafana '
        'observability.',
    isPublic: false,
    isLive: true,
    mockupType: 'laptop',
    screenshots: <String>['$_d/immopilot/cover.png'],
    decisions: <String>[
      'Enforced multi-tenancy with **row-level security on PostgreSQL 18 as defence-in-depth** — SQLAlchemy filters are the primary check, RLS exists to catch the bugs in the primary check before they ship customer data the wrong way.',
      'Made email default to **"Draft in Outlook", not direct-send** — every broker sees the AI draft before it goes out. The trust win has been larger than any feature; an early auto-send experiment surfaced exactly the bias problems you\'d expect.',
      'Put **client-facing settings in a NocoDB view** rather than building a custom admin panel — brokers tune tonality, follow-up cadence and routing rules without a developer in the loop. Building the admin panel ourselves would have eaten a quarter.',
      'Chose **ARQ-scheduled polling against the onOffice API** over a webhook queue — onOffice doesn\'t emit webhooks, and faking events out of polling is always wrong. Architecture has to fit the upstream\'s actual shape.',
      'Made **Mistral primary, OpenAI/Anthropic fallbacks behind a feature flag** so EU-residency clients can switch in a config change instead of a refactor.',
    ],
    learnings: <String>[
      'onOffice\'s `qualifiedsuitors` endpoint converts free-form lead text into a 0-100% match score against the active portfolio — once shipped, no broker wanted to go back to manual matching.',
      'DSGVO + AVV documentation produced before sales (DIN-5008-formatted, 50+ pages) shortens enterprise contract negotiation considerably; clients read it as a maturity signal.',
      'onPreo has no public API in 2026; architecting onOffice as the single source of truth made the platform survive vendor uncertainty.',
    ],
  ),

  // 14 ----------------------------------------------------------------------
  ProjectItemData(
    title: 'CaterSmart — Catering Ops + AI Core',
    subtitle: 'FastAPI backend + pluggable-LLM inquiry triage',
    category: 'B2B / OPERATIONS',
    platform: 'Web · API',
    primaryColor: const Color(0xFF65A30D),
    image: '$_d/catersmart/cover.png',
    coverUrl: '$_d/catersmart/cover.png',
    technologyUsed:
        'FastAPI · SQLAlchemy 2 async · Alembic · PostgreSQL · Redis · Mistral / Claude / OpenAI · Supabase pgvector',
    portfolioDescription:
        'A full-stack catering operations platform: an async FastAPI + '
        'SQLAlchemy 2 backend on PostgreSQL and Redis, plus a stateless '
        '"AI core" microservice that turns inbound inquiry mails into '
        'structured tickets. The classifier sorts every message into '
        'one of eleven catering categories against a 55-email gold '
        'set; strict JSON-schema enforcement keeps the LLM output '
        'parseable. Pluggable provider (Mistral / Claude / OpenAI / '
        'OpenWebUI), RAG over a Supabase pgvector store for prior '
        'decisions, mock mode for tests, JSONL audit logs of every '
        'decision, plus 88 unit tests in CI. Shipped at catersmart.de.',
    isPublic: false,
    isLive: true,
    mockupType: 'laptop',
    screenshots: <String>['$_d/catersmart/cover.png'],
    decisions: <String>[
      'Built the AI core **stateless** with on-demand context fetch from the CaterSmart REST API rather than mirroring state — single source of truth, no cache invalidation problem, zero risk of stale-context drift.',
      'Enforced **tenant isolation on every API call** with strict per-tenant RAG embedding scoping — cross-tenant feedback leak in a multi-tenant LLM system is a catastrophic failure mode, RLS-style isolation is the only acceptable answer.',
      'Made the LLM provider swappable behind **one env var** (Mistral primary, Claude / OpenAI / local OpenWebUI as fallbacks) so an EU-residency client gets a config change, not a deployment.',
      'Defaulted to **mock mode when API keys are absent** so contributors and CI can run the full stack without consuming tokens — this also makes the contract testable in isolation.',
      'Set Phase-1 success at **"60% perfect, 30% light-edit, 10% manual"** — naming acceptable failure modes up front kept the team from over-engineering for the long tail and shipped a useful product months earlier.',
    ],
    learnings: <String>[
      'Eleven email categories (NEW_INQUIRY / CHANGE_REQUEST / COMPLAINT / SPAM_NEWSLETTER / ...) took three rounds of refinement; the first taxonomy missed three real-world cases that only surfaced in the long tail.',
      'Deferring pgvector + RAG storage out of Phase 1 was the right call — basic mock mode unblocked the API contract months before the embeddings layer was needed.',
    ],
  ),

  // 15 ----------------------------------------------------------------------
  ProjectItemData(
    title: 'Dynamic Property 3D Tours',
    subtitle: 'Browser-based walkable 3D building models for real-estate',
    category: 'CLIENT / 3D',
    platform: 'Web · Cloud',
    primaryColor: const Color(0xFF475569),
    image: '$_d/freelance/cover.png',
    coverUrl: '$_d/freelance/cover.png',
    technologyUsed:
        'Three.js · FastAPI · Node + TypeScript · PostgreSQL · FFmpeg · Sharp · Docker · Kubernetes',
    portfolioDescription:
        'A platform for dynamic, walkable 3D building models that '
        'prospective buyers explore in the browser — no plugin, no '
        'app install. Each listing is composed by a per-concern '
        'microservice mesh: a 3D floor-plan generator builds the '
        'geometry, a video processor cuts walkthrough footage, an AI '
        'staging service drops furniture into empty rooms, a geometry '
        'optimiser collapses the asset count for browser delivery, and '
        'an image pipeline (Sharp) compresses textures. The Node + '
        'TypeScript orchestrator streams every asset to and from '
        'object storage so memory pressure stays constant regardless '
        'of input size, and the sandboxed Three.js viewer lets brokers '
        'preview the processed asset live before publishing.',
    isPublic: false,
    isLive: false,
    mockupType: 'laptop',
    screenshots: <String>['$_d/freelance/cover.png'],
    decisions: <String>[
      'Split the platform into **per-concern microservices** (geometry, video, AI staging, optimisation, compression) instead of a monolith — each service has its own GPU/CPU profile, scales independently, and can fail without taking the rest of the pipeline down.',
      'Streamed every asset **directly to/from object storage** — memory pressure stays constant regardless of input size, so a 4 GB walkthrough doesn\'t OOM the box that processes a 200 MB one.',
      'Picked a **sandboxed Three.js viewer** for the broker preview rather than a fat client — works in any browser, no plugin install, no app distribution headache.',
      'Built around **WSL2 + Podman + Makefile** orchestration with one explicit rule the README enforces: the project must not live on OneDrive — sync mid-build causes I/O locks that crash `make`.',
    ],
    learnings: <String>[
      'A `make` entry point (`health-check`, `up`, `logs`, `db-check`, `seed`) cuts cognitive load much more than raw docker-compose for a service mesh of this size.',
      'Health + disk-space checks before every start catch stale dependencies or low-disk conditions before they crash mid-run. Cheap habit, big save.',
    ],
  ),

  // 16 ----------------------------------------------------------------------
  ProjectItemData(
    title: 'PSCoat — Industrial Coatings Ops',
    subtitle: 'Playwright lead discovery + LLM inquiry triage',
    category: 'CLIENT / AUTOMATION',
    platform: 'Web · Python',
    primaryColor: const Color(0xFF0F172A),
    image: '$_d/pscoat/cover.png',
    coverUrl: '$_d/pscoat/cover.png',
    technologyUsed: 'Python 3.12 · Playwright · async/await · Mistral · WordPress',
    portfolioDescription:
        'Operations and lead-automation toolkit for an industrial '
        'coatings business. A Playwright-driven job-board crawler (with '
        'TOS-aware throttling and authenticated sessions) pulls '
        'qualified projects from vertical boards; a small LLM '
        'classifier sorts inbound inquiries into pricing / technical / '
        'callback buckets and drafts tone-matched responses in the '
        'company\'s voice. The same stack feeds the marketing-asset '
        'pipeline behind the public site.',
    isPublic: false,
    isLive: false,
    mockupType: 'laptop',
    screenshots: <String>['$_d/pscoat/cover.png'],
    decisions: <String>[
      'Used **Playwright over plain scraping** because Upwork ships Cloudflare Turnstile + browser fingerprinting + fraud detection (Incognia, Forter); only an authenticated, fingerprint-matched session bypasses the challenges. Naive `requests`-based scraping was blocked within minutes.',
      'Did a **manual login on first run, then reused the session jar** (`upwork_session.json`) — automated login would have been a continuous arms race against the bot-detection vendor, manual reauth-as-needed cost nothing extra.',
      'Made the **classifier output tone-matched drafts** in the company\'s voice via a small Mistral prompt — saved the operator from rewriting every reply from scratch while keeping the final send in human hands.',
      'Documented **explicit TOS guardrails**: educational + personal use only; nothing in the system supports commercial scraping. Drew the line up front instead of discovering it through a take-down.',
    ],
    learnings: <String>[
      'Selector fragility against modern marketplaces is permanent — instrument the scraper so breakage is visible the day it happens, not the day a deal is lost.',
      'Session expiration cadence is undocumented; building re-auth retry in from day one is much cheaper than discovering its absence at 11pm.',
    ],
  ),

  // 17 ----------------------------------------------------------------------
  ProjectItemData(
    title: 'Theater Website — Ruhrbühne Witten',
    subtitle: 'Programme + Eventim ticketing for a German regional theater',
    category: 'CLIENT / WEB',
    platform: 'Web',
    primaryColor: const Color(0xFF7E22CE),
    image: '$_d/theater/cover.png',
    coverUrl: '$_d/theater/cover.png',
    technologyUsed: 'WordPress · Elementor Pro · PHP · MySQL · Eventim',
    portfolioDescription:
        'Public-facing site for a German regional theater (Ruhrbühne '
        'Witten e.V.): programme listings, season-pass purchasing '
        'through an Eventim ticketing integration, accessibility-first '
        'styling and a low-friction Elementor-based CMS so the artistic '
        'team can update copy without the developer being in the loop. '
        'Hosted with GDPR-compliant audience data handling and '
        'role-scoped admin.',
    isPublic: false,
    isLive: false,
    mockupType: 'laptop',
    screenshots: <String>['$_d/theater/cover.png'],
    decisions: <String>[
      'Picked **WordPress + Elementor Pro** instead of bespoke or JAMstack because the artistic team needed a CMS they could touch — not a Git repo. Wrong tool for engineers, right tool for actors.',
      'Versioned the site through **timestamped backup archives** (~2.8 GB of DB + uploads + plugins + themes) — Git would have been heavier and more brittle for an editorial workflow.',
      'Routed ticketing to **Eventim** rather than a self-hosted shop — payments, refunds and tax handling become someone else\'s problem; that\'s the right trade for a small theater.',
    ],
    learnings: <String>[
      'Backup-archive versioning works for editorial sites with one or two editors; drift risk grows the moment a third hand touches the admin.',
    ],
  ),

  // 18 ----------------------------------------------------------------------
  ProjectItemData(
    title: 'NestNode — Smart-Home Concept',
    subtitle: 'Archived mobile concept rolled into Sovereign Smart Home',
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
        'rather than through a cloud bridge. Archived at concept '
        'stage — the design language was rolled into the Sovereign '
        'Smart Home stack.',
    isPublic: false,
    isLive: false,
    mockupType: 'phone',
    screenshots: <String>['$_d/nestnode/cover.png'],
    decisions: <String>[
      'Archived as **concept-stage** — only a Word doc, logos and a moodboard exist; no codebase. The Home Assistant Edge stack absorbed the design language, so building a separate app would have been duplicate effort.',
    ],
    learnings: <String>[
      'Some projects are most useful as design exercises — the gesture-first nav and tactile energy view were rolled into the Sovereign Smart Home UX instead of shipped standalone.',
    ],
  ),

  // 19 ----------------------------------------------------------------------
  ProjectItemData(
    title: 'burakbasci_widgets',
    subtitle: 'Reusable Flutter widget library on pub.dev',
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
    screenshots: <String>['$_d/widgets-pkg/cover.png'],
    decisions: <String>[
      'Maintained as a **standalone pub.dev package** rather than vendored per-project because every new Flutter app starts by adding it as a dep — the moment a widget is copy-pasted twice, it belongs in a library.',
      'Made the package **null-safety-first** and SDK-tracking — bumping the Flutter SDK never breaks the consumers because the package moves in lockstep.',
      'Required **widget tests + dartdoc on every widget** before merging — "it boots on my server" is not a release criterion for shared code.',
    ],
    learnings: <String>[
      'The "copy-paste twice → extract" discipline keeps the package honest; without it the package fills with one-off widgets and stops being a kit.',
    ],
  ),

  // 20 ----------------------------------------------------------------------
  ProjectItemData(
    title: 'AI Screenshot Recall',
    subtitle: 'Wayland-native evdev daemon racing Gemini vs Copilot',
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
        'input layer that reads evdev directly. Sub-second insight '
        'into what\'s on screen without alt-tabbing into a chatbot.',
    isPublic: false,
    isLive: false,
    mockupType: 'terminal',
    screenshots: <String>['$_d/python-recall/cover.png'],
    decisions: <String>[
      'Read `/dev/input/eventN` via **evdev directly** instead of going through `input-remapper` + the Wayland inhibitor — the inhibitor blocks compositor shortcuts in FreeRDP fullscreen VMs, and evdev simply doesn\'t care. The triple-bind of input-remapper + inhibitor + compositor refused to cooperate; evdev was the escape hatch.',
      'Ran the daemon as a **user systemd service** rather than a global one — no root, no setuid binary, no per-machine sysadmin overhead.',
      'Raced **Gemini vs Copilot on parallel threads with SSE-stream-of-first-winner** because either provider can stall by 2–4 seconds on a bad day — never letting one block the other gave a hard p95 floor.',
      'Used **cosmic-screenshot for the frame capture on Wayland + Nvidia** — mss returns all-black frames there. Empirical finding; no other capture method worked.',
    ],
    learnings: <String>[
      '`EVIOCGRAB` prevents *grabbing* the device by others but not *reading* it — that single insight unlocked the entire daemon approach. Could have saved a weekend if I\'d read the kernel docs sooner.',
      'Systemd user services do **not** inherit group changes from `newgrp` or `usermod -aG` — a full re-login is required. Discovered the hard way; documented in README so the next person doesn\'t.',
      'input-remapper v2 JSON expects arrays + `Super_L+F5` syntax, not `key(super+F5)`. Broken JSON fails silently — instrument the loader.',
    ],
  ),

  // 21 ----------------------------------------------------------------------
  ProjectItemData(
    title: 'BoxHead — Unreal FPS',
    subtitle: 'Wave-based first-person shooter built in UE5 + C++',
    category: 'GAME / UNREAL',
    platform: 'Windows · Linux',
    primaryColor: const Color(0xFF1F2937),
    image: '$_d/boxhead/cover.png',
    coverUrl: '$_d/boxhead/cover.png',
    technologyUsed: 'Unreal Engine 5 · C++ · Blueprints',
    portfolioDescription:
        'A fast-paced 3D shooter built in Unreal Engine 5 — '
        'claustrophobic maze-like arenas, wave-based AI, ranged and '
        'melee weapons with their own feel. C++ handles the weapon '
        'systems (spread, ricochet, projectile pooling), particle '
        'effects sell the impacts, and the same project builds editor '
        'and shipping targets for both Linux and Windows with high-res '
        'screenshot tooling for level-design iteration.',
    isPublic: false,
    isLive: false,
    mockupType: 'unreal-still',
    screenshots: <String>[
      '$_d/boxhead/shot-01.png',
      '$_d/boxhead/shot-02.png',
      '$_d/boxhead/shot-03.png',
      '$_d/boxhead/shot-04.png',
    ],
    decisions: <String>[
      'Wrote the **weapon systems in C++**, not Blueprints, because the per-shot feel has to be tunable to single-frame accuracy — Blueprints add latency and the spread/ricochet math is fiddly enough that a typed compiler is worth it.',
      'Baked **high-res screenshot tooling into the build** so every level-design iteration auto-generates a marketing-grade still — work product is also documentation.',
      'Built **editor + shipping targets for both Linux and Windows from one project tree** — parallel platform branches always drift, single-tree builds force the platform diffs to live in code review.',
    ],
    learnings: <String>[
      'Maze-like claustrophobic arenas drive the wave-shooter feel more than enemy variety does; one tight corridor + one mood carries the game further than a roster of monster types.',
    ],
  ),

  // 22 ----------------------------------------------------------------------
  ProjectItemData(
    title: 'Flappy Griffon',
    subtitle: 'Ray-traced indie game on itch.io',
    category: 'GAME / UNREAL',
    platform: 'Windows · Android',
    primaryColor: const Color(0xFFF59E0B),
    image: '$_d/flappy-griffon/cover.png',
    coverUrl: '$_d/flappy-griffon/cover.png',
    technologyUsed: 'Unreal Engine 5 · C++ · Blueprints · Water plugin',
    portfolioDescription:
        'A 3D, ray-traced reimagining of Flappy Bird. A griffon '
        'navigates a continuously generated obstacle course; the '
        'Water plugin handles the cinematic lake reflections, '
        'ray-tracing carries the lighting, and the same project builds '
        'across Windows, Linux, Android and Mac. Shipped on itch.io.',
    isPublic: true,
    isLive: true,
    webUrl: 'https://burakbasci.itch.io/flappygriffon',
    mockupType: 'unreal-still',
    screenshots: <String>['$_d/flappy-griffon/cover.png'],
    decisions: <String>[
      'Picked **ray-tracing for water + global illumination** because it\'s the visual hook in a genre that\'s usually 2D pixel art — the surprise is the entire selling point.',
      'Built **one cross-platform project (Windows / Linux / Android / Mac)** instead of parallel ports — same reason as BoxHead, parallel trees always drift.',
      'Shipped on **itch.io** rather than a gatekeeping storefront — same-day publishing, no review queue, no platform tax on indie experiments.',
    ],
    learnings: <String>[
      'Reskinning a known mechanic (Flappy Bird) is a learning-vehicle accelerator; nobody has to figure out how to play, so the surprise is purely visual.',
    ],
  ),

  // 23 ----------------------------------------------------------------------
  ProjectItemData(
    title: 'MyJumpNRun',
    subtitle: 'Iterative UE5 platformer series',
    category: 'GAME / UNREAL',
    platform: 'Windows',
    primaryColor: const Color(0xFF65A30D),
    image: '$_d/jumpnrun/cover.png',
    coverUrl: '$_d/jumpnrun/cover.png',
    technologyUsed: 'Unreal Engine 5 · C++ · Blueprints',
    portfolioDescription:
        'A personal Unreal Engine platformer rebuilt across multiple '
        'iterations (5.2, 5.2-variant, ...) to keep pushing on level '
        'design, character physics and Blueprint scripting. Tight '
        'movement (jump buffering, coyote time, wall-slide detection), '
        'checkpoints and a small replay system make the core mechanics '
        'feel responsive enough that the levels stand on their own.',
    isPublic: false,
    isLive: false,
    mockupType: 'unreal-still',
    screenshots: <String>['$_d/jumpnrun/cover.png'],
    decisions: <String>[
      'Tuned **jump buffering + coyote time + wall-slide detection up front** before designing any level — feel-tuning early means the levels exist for movement that already works, not the other way around.',
      'Tracked **multiple project iterations as separate folders** (5.2, variant, ...) so old level files stayed playable as the engine updated — destructive in-place upgrades would have lost the early-iteration content.',
    ],
    learnings: <String>[
      'Iterating on platformer feel is mostly about input latency and the curve of the jump arc; everything else (art, music, levels) is decoration on top.',
    ],
  ),

  // 24 ----------------------------------------------------------------------
  ProjectItemData(
    title: 'ALSignal — ASL Hackathon',
    subtitle: 'Real-time American Sign Language in Unity',
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
    screenshots: <String>['$_d/unity-hackathon/cover.png'],
    decisions: <String>[
      'Picked **MediaPipe + a small custom LSTM** over a one-shot vision model — off-the-shelf hand-tracking plus a tiny trainable classifier beats a single big model for niche gesture sets at this scale, and trains in minutes instead of hours.',
      'Built the demo in **Unity** instead of a web frontend so the captured gesture set could stay on-device — privacy was a hackathon talking point as much as a real constraint.',
      'Overlaid the **confidence bar + label live on the webcam feed** because visible decisions are easier to debug at a hackathon than logs are — judges see the model thinking.',
    ],
    learnings: <String>[
      'Computer-vision UX at a hackathon stands or falls on a working live demo; the LSTM won purely because it was demoable.',
    ],
  ),

  // 25 ----------------------------------------------------------------------
  ProjectItemData(
    title: 'Steam Market Arbitrage Bot',
    subtitle: 'Trading-card economy analyser with risk scoring',
    category: 'AUTOMATION / FINANCE',
    platform: 'Linux',
    primaryColor: const Color(0xFF1B2838),
    image: '$_d/steam-market/cover.png',
    coverUrl: '$_d/steam-market/cover.png',
    technologyUsed: 'Python · BeautifulSoup · Requests · SQLite',
    portfolioDescription:
        'A research toolkit for the Steam Community Market: scans '
        'thousands of listings a day and detects arbitrage loops — '
        'gem → booster pack crafting spreads, card → gem conversions, '
        'foil-card price gaps, and badge → component economics. '
        'Cookie-based authenticated session respects Steam\'s rate '
        'limits, every simulated trade factors in Steam\'s 15% market '
        'fee, and a local SQLite stores opportunities with a risk '
        'score so the obviously-stale ones get filtered before a human '
        'sees them.',
    isPublic: false,
    isLive: false,
    mockupType: 'terminal',
    screenshots: <String>['$_d/steam-market/cover.png'],
    decisions: <String>[
      'Used a **cookie-based authenticated session** that respects rate limits because anonymous scraping of the market gets blocked within minutes — being a guest on Valve\'s API isn\'t viable for this kind of scan.',
      'Baked **Steam\'s 15% market fee into every simulated trade** because opportunities that ignore the fee look 10× bigger than they are; ranking by raw spread is a fast way to lose money.',
      'Ranked opportunities by **risk score** (depth-of-book + listing age + spread volatility) rather than raw margin — most "arbitrage" on inefficient marketplaces is actually a liquidity trap.',
    ],
    learnings: <String>[
      'Ranking by risk-of-execution beats ranking by margin every time on a thin marketplace; the right top-1 is the listing you can actually clear, not the listing that looks biggest.',
    ],
  ),

  // 26 ----------------------------------------------------------------------
  ProjectItemData(
    title: 'CSFloat Sniper',
    subtitle: 'CS:GO marketplace scanner with API integration',
    category: 'AUTOMATION / RESEARCH',
    platform: 'Linux',
    primaryColor: const Color(0xFFEAB308),
    image: '$_d/csfloat/cover.png',
    coverUrl: '$_d/csfloat/cover.png',
    technologyUsed: 'Python · aiohttp · CSFloat API · asyncio',
    portfolioDescription:
        'A scanner that watches CSFloat marketplace listings (Bayonet '
        'Vanilla, covert tier) for price + condition mismatches and '
        'notifies a private channel. Built to learn browser-automation '
        'and event-driven Python; configurable dry-run mode skips '
        'order placement during testing.',
    isPublic: false,
    isLive: false,
    mockupType: 'terminal',
    screenshots: <String>['$_d/csfloat/cover.png'],
    decisions: <String>[
      'Cached **listings + buy orders into a single immutable `MarketDataCache` dataclass** rather than fetching per function — collapsed 3 API calls per item into 2 (a 33% reduction) and stopped a class of "is this data still fresh?" bugs at the type level.',
      'Loaded API tokens **from environment via a gitignored `.env`** — never check the credential surface into git, even for personal tooling.',
    ],
    learnings: <String>[
      'Redundant API calls show up easily in multi-function workflows; one systematic audit of call sites before optimisation prevents regression and is faster than chasing them one at a time.',
      'Caching by whole-value-object (entire market snapshot) instead of per-field simplified downstream signatures and removed a lot of state-passing noise.',
    ],
  ),

  // 27 ----------------------------------------------------------------------
  ProjectItemData(
    title: 'Binance → German Tax PDF',
    subtitle: 'CSV-to-Steuerbericht generator',
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
    screenshots: <String>['$_d/binance-tax/cover.png'],
    decisions: <String>[
      'Used **WeasyPrint over Pdfkit / ReportLab** because pango + cairo handle German typography (umlauts, hyphenation, kerning) without typesetting drama; ReportLab would have required hand-tuning every column.',
      'Picked the **FIFO cost basis** because that\'s what the Finanzbehörde wants — no opinion required. Implementing LIFO/HIFO would have been a tax-audit conversation nobody wants.',
      'Shipped as a **CLI, not a UI** — the tool is used once a year per portfolio; headless fits cron / CI / one-off runs cleanly and there\'s no demand for a chrome around it.',
    ],
    learnings: <String>[
      'Compliance documents look dramatically more credible when they use the right typography — DIN-style margins and faces did more for trust than feature work would have.',
    ],
  ),

  // 28 ----------------------------------------------------------------------
  ProjectItemData(
    title: 'Open-Source WordPress Plugins',
    subtitle: 'Small GPL plugins for ImmoWare-style sites + utilities',
    category: 'OPEN SOURCE / PHP',
    platform: 'WordPress',
    primaryColor: const Color(0xFF21759B),
    image: '$_d/wp-plugins/cover.png',
    coverUrl: '$_d/wp-plugins/cover.png',
    technologyUsed: 'PHP · WordPress · MySQL · PHPUnit',
    portfolioDescription:
        'A small collection of open-source WordPress plugins, originally '
        'written for freelance clients (ImmoWare-style listing pages, '
        'custom taxonomy management, a few small SEO helpers) and '
        'released back to the WordPress community under GPL. Each '
        'plugin follows the WordPress coding standards, ships with '
        'PHPUnit tests, and tracks the WordPress LTS line for '
        'long-term compatibility.',
    isPublic: true,
    isLive: false,
    mockupType: 'laptop',
    screenshots: <String>['$_d/wp-plugins/cover.png'],
    decisions: <String>[
      'Released the work-for-hire plugins back under **GPL** so the next freelancer can pick them up — small WordPress shops re-use each other\'s glue code constantly, and the licensing tax of "rebuild from scratch" is bad for everyone.',
      'Required **PHPUnit tests + inline docblocks** before merging — "it boots on my server" is not a release criterion for community plugins, and the WordPress.org review process won\'t let it through without them.',
      'Tracked the **WordPress LTS line** for long-term compatibility — every plugin survives at least three WP major versions, so client sites don\'t break on routine WP updates.',
    ],
    learnings: <String>[
      'Passing WordPress.org\'s review is more about coding-standards conformance than feature value — meeting the standards once made every subsequent release frictionless.',
    ],
  ),

  // 29 ----------------------------------------------------------------------
  ProjectItemData(
    title: 'burakbasci.de',
    subtitle: 'This portfolio site — Flutter Web, Material 2, content-driven',
    category: 'WEB / PERSONAL',
    platform: 'Flutter Web',
    primaryColor: const Color(0xFF363636),
    image: '$_d/this-site/cover.png',
    coverUrl: '$_d/this-site/cover.png',
    technologyUsed: 'Flutter Web · CanvasKit · GitHub Pages · Podman',
    portfolioDescription:
        'The site you are reading. Flutter Web on the CanvasKit '
        'renderer, deployed to GitHub Pages with a custom domain. '
        'Source heavily restructured from David Cobbina\'s open-source '
        'portfolio template into a new widget tree (header / footer / '
        'page-wrapper / animation primitives), rebuilt against current '
        'stable Flutter, and rewired so every animation, font, route '
        'and project page is content-driven by `lib/data/projects.dart`.',
    isPublic: true,
    isLive: true,
    webUrl: 'https://www.burakbasci.de',
    gitHubUrl: 'https://github.com/burak-basci/burak_basci_website',
    mockupType: 'laptop',
    screenshots: <String>['$_d/this-site/cover.png'],
    decisions: <String>[
      'Forked David Cobbina\'s upstream template and **maintained via cherry-pick, not direct rebase** — heavy customisations stay clean of upstream churn, and the small bug-fixes from upstream can still flow in selectively.',
      'Enforced **`useMaterial3: false`** to retain Material 2 ink ripples and elevation — M3 introduced visual drift in the top nav and footer that wasn\'t worth fighting and that nobody asked for.',
      'Picked **URW Gothic + Carlito + Inter** for the brand fonts (all OFL) because Microsoft\'s DSIG-signed Century Gothic and Calibri break CanvasKit — discovered the hard way.',
      'Built **Flutter 3.41.9 strictly inside `ghcr.io/cirruslabs/flutter:stable` Podman** with no host install — every build reproduces on any machine, and CI is just "same command, somewhere else".',
      'Used a **two-repo pattern**: source repo `burak_basci_website` for code, `burak-basci.github.io` for the deployed static site — independent release cycle, no live-site risk during dev.',
    ],
    learnings: <String>[
      'Microsoft\'s DSIG-signed fonts break CanvasKit; OFL metric-compatible alternatives are non-negotiable for Flutter Web.',
      'Per-section animation controllers + `VisibilityDetector` lifts the perceived premium of the site more than any individual font or layout decision.',
    ],
  ),
];

/// Subset shown on the home page "selection of recent work" — the top picks.
final List<ProjectItemData> recentWorksHighlights = <ProjectItemData>[
  recentWorks[0], // Volkswagen AI Patent Search
  recentWorks[1], // Hetzner k3s Infrastructure
  recentWorks[2], // PostPilot
  recentWorks[6], // Night-Drive Object Detection
  recentWorks[7], // VR Anxiety Trainer
  recentWorks[8], // Durak Multiplayer
];
