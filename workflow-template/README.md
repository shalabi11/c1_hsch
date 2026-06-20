# 🚀 Antigravity Autonomous Workflow Template

This is a reusable GitHub Template Repository designed for the **Planner-Executor-Reviewer** pattern inside **Antigravity IDE**. It optimizes AI development by splitting strategic planning and low-cost, fast execution.

## 👥 The AI Crew
1. **The Planner & Reviewer (Claude Opus 4.8):** The Lead Architect. Handles feature deconstruction, task allocation, and rigorous code/clean-code reviews.
2. **The Executor & Analyzer (Gemini Flash 3.5):** The Fast Developer. Analyzes the tech stack, proposes the best file structures, and writes clean, production-ready code.

## 📁 Shared Memory Files
* `claude.md`: System prompt for the Planner (Opus).
* `Agents.md`: System prompt for the Executor (Flash).
* `workflow.md`: The live, dynamic task board tracking project progress.
* `execution-log.md`: Detailed activity and error log written by the Executor.
* `stat.md`: Analytics dashboard monitoring iteration counts and completion status.