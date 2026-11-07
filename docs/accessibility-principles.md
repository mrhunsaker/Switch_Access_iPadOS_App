# CVI-centered accessibility principles

## Start with the individual
Cortical or cerebral visual impairment is not a single visual profile. Functional access and preferences vary between individuals and by task, environment, fatigue, and time. Do not assume a diagnosis predicts one ideal color scheme, contrast setting, target arrangement, or visual complexity.

Explore design choices with the individual and, when appropriate, people they choose to support them. The individual's preferences and communication are central.

## Make visual presentation configurable
The architecture should support independent adjustment, subject to research and feasibility, of:
- background and foreground colors;
- contrast and visual boundaries;
- object and target size;
- spacing and crowding;
- number of visible choices;
- text size and amount of text;
- visual complexity and decorative detail;
- animation and transition behavior;
- object placement and stability;
- response timing and feedback.

These are potential controls, not claims that every setting is appropriate for every user. Avoid one universal “CVI mode” and avoid defaults based solely on diagnosis.

## Reduce avoidable visual competition
Use clear, stable layouts and present only information needed for the current task. Avoid unnecessary animation, flashing, moving backgrounds, parallax, decorative motion, and simultaneous competing stimuli. Preserve meaningful context and familiar objects; minimalism alone is not an accessibility outcome.

## Support more than vision
Where appropriate, provide auditory feedback and interactions that do not depend exclusively on visual recognition. Audio must be configurable, non-startling, and easy to stop. Do not make sound the only channel for essential information.

## Switch interaction
- Use native SwiftUI controls exposed to system-wide iPadOS Switch Control.
- Make meaningful actions independently reachable.
- Use concise labels and hints describing actions or results.
- Organize controls into logical regions without excessive scan stops.
- Keep focus order predictable.
- Allow enough time to locate and select targets.
- Avoid drag-only, precision, and simultaneous gesture requirements.
- Keep app navigation separate from system scan navigation.

## Autonomy and choice
The individual should be able to make choices and express preferences. Assistance can be supported without making proxy control the default. Settings should be understandable, previewable, and reversible.

## Evidence and limits
Code review or successful build does not demonstrate functional access. Testing must include actual iPad hardware, representative switches, and individuals with varied CVI characteristics. Do not claim clinical benefit, treatment effect, or universal CVI accessibility without appropriate evidence.

These principles guide product decisions; they do not replace individualized functional vision assessment or professional advice.
