# medical-health

Organize health information. Info only - always consult a professional.

| Skill | Type | Use it when |
|---|---|---|
| `fitness-plan` | skill | Build progressive workout plans around goals and limits. Use when starting or fixing a training routine. |
| `health-checkup` | flow | Do an annual health review with data and tune-ups. Use once a year. Info only; doctors decide. |
| `health-playbook` | skill | Best-practice playbook for ongoing health routines: meds, activity, sleep, records. Use when building a sustainable health system. |
| `med-care-review` | skill | Review a home care plan for gaps, interactions, and missing follow-ups. Use monthly or after any medication change. Information only; pharmacist confirms. |
| `med-discharge-helper` | skill | Turn discharge papers into a home care checklist. Use after a hospital discharge. |
| `med-jargon-translate` | skill | Translate medical jargon into plain language with a glossary. Use when discharge notes, reports, or prescriptions are hard to understand. Information only. |
| `med-lab-reader` | skill | Explain lab results in plain language with questions to ask. Use when reviewing bloodwork or test reports. Information only. |
| `med-pill-schedule` | skill | Build a daily medication schedule from prescription labels. Use when managing multiple meds. Never changes doses; confirm with pharmacist. |
| `med-record-parse` | skill | Extract medications, doses, and appointments from medical documents into a structured list. Use when organizing prescriptions or visit papers. Never alters doses. |
| `med-symptom-triage` | skill | Organize symptoms into a clear timeline summary for a clinician visit. Use when preparing for a doctor appointment. Information only, never a diagnosis. |
| `mental-reset` | skill | Guide a short stress-reset routine with journaling prompts. Use when stressed. Not therapy; crisis situations need a professional. |
| `nutrition-plan` | skill | Plan balanced meals around budget and restrictions. Use when meal planning for health goals. General information, not medical advice. |
| `sleep-improve` | skill | Audit sleep habits and build an improvement plan. Use for insomnia or fatigue routines. |

Install: Copy-Item -Recurse skills/<name> .agents/skills/ - full file: `skills/<name>/SKILL.md`

Workflows (plays) live on the [workflows](workflows.md) page.
