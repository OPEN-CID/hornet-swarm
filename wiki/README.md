# Hornet Swarm Wiki

Universal agent skills: one folder per skill, every domain covered.

## Start here

- New? Read docs/PLAN.md (vision), docs/WORLD-TAXONOMY.md (all domains), docs/SKILL-FAMILIES.md (the 5 kinds).
- Use a skill: copy skills/<name> into .agents/skills/ (or .claude/skills/, .opencode/skills/).
- Add a skill: 6 lines of JSON in catalog/ plus scripts/generate-skills.ps1 (see docs/SKILL-FACTORY.md).

## Domains (50) - 533 skills

- [business-ops](business-ops.md) (19) - Validate, sell, hire, and operate.
- [career](career.md) (12) - Apply, interview, negotiate, grow.
- [civic](civic.md) (6) - Volunteer, fundraise, organize, and vote.
- [cloud](cloud.md) (11) - Kubernetes, Terraform, AWS, DNS, TLS, and costs.
- [company-arch](company-arch.md) (10) - Architecture by company function: frontend, backend, data, ML, security, platform.
- [cooking](cooking.md) (13) - Bake, grill, ferment, brew, and season with confidence.
- [craft](craft.md) (13) - Draw, paint, shoot, knit, sew, and make.
- [creative-media](creative-media.md) (16) - Write, film, record, and publish.
- [culture](culture.md) (6) - Roots, media literacy, debate, and museums.
- [data-ai](data-ai.md) (11) - Query, clean, prompt, retrieve, evaluate.
- [data-pipeline](data-pipeline.md) (11) - Move, check, and present data.
- [data-platforms](data-platforms.md) (12) - Snowflake, Databricks, BigQuery, dbt, Kafka, Postgres and more. Watch the bill.
- [devops-infra](devops-infra.md) (15) - Ship and run software reliably.
- [diy-maker](diy-maker.md) (12) - Build and fix things safely with real plans.
- [docs-research](docs-research.md) (6) - Understand systems and explain them well.
- [eco](eco.md) (7) - Recycle, compost, save water, and cut carbon.
- [education](education.md) (18) - Learn anything with tutoring and study systems.
- [events](events.md) (7) - Weddings, parties, budgets, and toasts.
- [everyday-tech](everyday-tech.md) (16) - CLI, passwords, backups, wifi, and AI tools.
- [fitness](fitness.md) (12) - Run, lift, stretch, and coach. Info only - pros for injuries.
- [frameworks](frameworks.md) (8) - React, Next.js, Vue, Django, Rails, FastAPI, Spring, Laravel.
- [git-release](git-release.md) (6) - Clean history, reviewable PRs, safe releases.
- [hardware](hardware.md) (6) - GPUs, PC builds, Pi projects, home servers. Safety first.
- [home-life](home-life.md) (21) - Meals, cleaning, maintenance, moves, pets, safety.
- [housing](housing.md) (11) - Rent, buy, inspect, renovate, and decorate.
- [knowledge](knowledge.md) (9) - Notes, inbox, calendar, reports, and research.
- [languages](languages.md) (20) - Idiomatic code in 20 languages: toolchain, style, idioms, arch patterns, pitfalls.
- [law-life](law-life.md) (10) - Tenants, claims, wills, and scam defense. Info only - not advice.
- [leadership](leadership.md) (8) - Manage, give feedback, speak, and facilitate.
- [legal-finance](legal-finance.md) (13) - Organize money and paperwork. General info - confirm big decisions professionally.
- [medical-health](medical-health.md) (12) - Organize health information. Info only - always consult a professional.
- [meta](meta.md) (2) - Skills about skills: create and onboard.
- [mind](mind.md) (11) - Habits, focus, memory, calm, and clear thinking.
- [music](music.md) (8) - Guitar, piano, voice, theory, and recording.
- [outdoors](outdoors.md) (13) - Hike, camp, paddle, and read the wild safely.
- [parenting](parenting.md) (14) - Newborns to teens plus elder care. Info only - consult professionals.
- [pets](pets.md) (7) - Dogs, cats, tanks, birds, hens, and bees.
- [play](play.md) (9) - Chess, poker, game nights, and game design.
- [productivity](productivity.md) (6) - Plan work and run better meetings.
- [quality-testing](quality-testing.md) (8) - Prove it works: tests, reviews, QA, performance, security.
- [relationships](relationships.md) (10) - Communicate, repair, befriend, and network.
- [saas-tools](saas-tools.md) (8) - Notion, Figma, Slack, Stripe, Shopify and everyday company tools.
- [safety](safety.md) (9) - First aid, fire, storms, and scams. Call emergency first.
- [science-big](science-big.md) (8) - Stars, weather, genes, minds, and markets.
- [science-lab](science-lab.md) (10) - Run trustworthy experiments and read papers well.
- [software-build](software-build.md) (13) - Design, write, fix, and reshape code.
- [travel](travel.md) (15) - Trips, packing, visas, itineraries, and safety.
- [vehicles](vehicles.md) (7) - Buy, inspect, ride, charge, and fix transport.
- [wealth](wealth.md) (9) - Invest, insure, retire, and review. Education only - not advice.
- [writing](writing.md) (9) - Fiction, poetry, scripts, grants, and publishing.
- [workflows](workflows.md) (plays that run skills in order)

## Family pattern

Every domain follows Translate, Parse, Do, Review, Playbook. Details: docs/SKILL-FAMILIES.md.