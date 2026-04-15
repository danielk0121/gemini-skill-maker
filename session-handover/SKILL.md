---
name: session-handover
description: Session context preservation and cleanup. Triggered by "파일널퓨전" or when a task is completed. Summarizes the session's 'Final Structure' (최종 구조) into memory and prepares for a session reset via `/clear`.
---

# Session Handover

This skill ensures that key architectural decisions, project states, and session progress are preserved across session resets. It implements a standardized "Session Handover" workflow to maintain continuity.

## Workflow: Session Completion & Context Preservation

When the user says "파이널퓨전", or when a task/sub-project is completed, follow these steps:

### 1. Summarize "Final Structure" (최종 구조)
Create a concise but comprehensive summary of the current project state. This must include:
- **Project Goal:** The original objective and current progress.
- **Key Architectural Decisions:** Major design choices, tech stack used, and why.
- **File Structure:** Significant files created or modified.
- **Current State:** What is finished, what is pending, and any known issues.
- **Next Steps:** Recommended actions for the next session.

### 2. Persist to Memory
Use the `save_memory` tool with the `project` scope to save the summary.
- **Fact:** `최종 구조: [Your concise summary here]`
- **Scope:** `project`

### 3. Initiate Session Reset
Inform the user that the session state has been preserved and suggest they reset the session to maintain performance.
- **Message:** "파이널퓨전! 방금까지의 작업 내용을 요약해서 save_memory에 '최종 구조'로 저장했습니다. 이제 `/clear`를 입력하여 세션을 초기화해주세요. 새 세션에서 '최종 구조' 메모리를 조회하여 맥락을 이어가겠습니다."

## Examples

### Scenario: Manual Trigger via Special Command
**User:** "파이널퓨전"
**Agent:** (Executes `save_memory` with the summary) "파이널퓨전! 작업 내용을 '최종 구조'로 저장했습니다. `/clear`로 세션을 초기화해주세요."

### Scenario: Finishing a Feature Implementation
**User:** "이 기능 작업 끝났어."
**Agent:** (Executes `save_memory` with the summary) "작업 내용을 '최종 구조'로 저장했습니다. `/clear`로 세션을 초기화해주세요."

### Scenario: End of Work Day
**User:** "오늘 작업은 여기까지 할게."
**Agent:** (Executes `save_memory` with the summary) "오늘의 최종 구조를 저장했습니다. 다음 세션에서 뵙겠습니다. `/clear`로 초기화 권장합니다."
