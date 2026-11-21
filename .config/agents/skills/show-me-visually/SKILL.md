---
name: show-me-visually
description: Create a focused visual explanation from the current conversation.
disable-model-invocation: true
---

# Show Me Visually

Turn an explanation already established in this conversation into a small visual artifact.

1. Check the fit first. A diagram should clarify, not decorate: if the prose covers the flow, skip the diagram and say so. If the thing being explained is a state machine or a protocol (a product flow, a service, a bug that lives in state), use the `statechart` skill instead; it models the behavior and draws the chart, and gives the shortest path to each state that breaks a rule.
2. Use the understanding and facts already present in the conversation. Do not re-explore the codebase or gather new information.
3. Choose one visual form that fits the material. Free-form HTML for a flow, timeline, relationship map, or comparison; standalone HTML with inline SVG for structure diagrams, per the `architecture-diagram` skill. Keep it focused on the point the user asked to see.
4. Create a self-contained HTML file with inline styles and no external assets. Save it to a unique temporary path; do not write into the repository unless the user asks.
5. Open the file with `xdg-open`. If opening fails, report the error and the file path; do not claim it opened.
6. Tell the user what the visual shows and where the HTML file was saved.
