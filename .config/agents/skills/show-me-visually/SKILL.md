---
name: show-me-visually
description: Create a focused visual explanation from the current conversation.
disable-model-invocation: true
---

# Show Me Visually

Turn an explanation already established in this conversation into a small visual artifact.

1. Use the understanding and facts already present in the conversation. Do not re-explore the codebase or gather new information.
2. Choose one visual form that fits the material, such as a flow, timeline, relationship map, or comparison. Keep it focused on the point the user asked to see.
3. Create a self-contained HTML file with inline styles and no external assets. Save it to a unique temporary path; do not write into the repository unless the user asks.
4. Open the file with `xdg-open`. If opening fails, report the error and the file path; do not claim it opened.
5. Tell the user what the visual shows and where the HTML file was saved.
