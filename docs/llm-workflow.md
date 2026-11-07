# LLM-assisted development workflow

The repository includes a structured prompt library at [`prompts/switchplay_cvi_llm_prompts.json`](https://github.com/mrhunsaker/Switch_Access_iPadOS_App/blob/main/prompts/switchplay_cvi_llm_prompts.json).

It contains 14 prompts for requirements, visual-accessibility architecture, interface audits, native Switch Control, activity design, feedback, music, code review, testing, participatory research, customization, onboarding, regression review, and evidence verification.

## Recommended sequence
1. P01 — CVI-centered product requirements.
2. P02 — Individualized visual-accessibility architecture.
3. P10 — Participatory design and user research.
4. P03 — Visual design and interface audit.
5. P04 — Native Switch Control implementation review.
6. P05 and P06 — Activity and feedback design.
7. P11 — Individual customization.
8. P07 — Music activities.
9. P08 and P09 — Code review and acceptance testing.
10. P12–P14 — Documentation, regression, and evidence review.

## Working with an LLM
Provide relevant source files, requirements, and current status. Ask the model to inspect existing files, identify exact files to change, provide complete source where practical, explain accessibility tradeoffs, distinguish facts from assumptions, and verify Apple API behavior against current Apple documentation.

Require the model to state which tests were not run. Do not ask an LLM to declare a feature CVI-accessible based on code alone. LLM output is a development aid, not a substitute for participatory design, professional input, or physical-device testing.

## Repository discipline
Review generated code and documentation like any other contribution. Do not provide private participant information to a model. Do not commit changes without reviewing the diff. Keep the roadmap and [current status](project-status.md) synchronized with actual evidence.
