---
artifact_id: DOC-README-MD
phase: "ROOT"
artifact_type: orchestration
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# AI Project Lifecycle Template — 9 Phases

This is a framework for the **Client/Product Owner contracting a software delivery vendor** model, where the AI assistant operates as the Delivery Vendor (comprising BA, PM, Architect, Developer, QA, and DevOps roles): interviewing stakeholders, clarifying requirements, executing authorized local work autonomously, and handing over evidence-backed results. The framework is also designed to be integrated into an existing, ongoing codebase (Brownfield).

## Quick Start

Three documents to read first:

- [START.md](START.md): Choose and copy the initiation prompt for a greenfield or brownfield project.
- [MASTER_PROMPT.md](MASTER_PROMPT.md): The unified orchestration prompt for the AI to discover requirements, establish a baseline, execute the 9 phases, and complete the handover.
- [USAGE_GUIDE.md](USAGE_GUIDE.md): Operational guide for new projects, existing codebases, and change requests.

After placing the entire template folder structure at the root of the repository, open the AI assistant at the root and send:

```text
Read and execute the entire MASTER_PROMPT.md in this repository.
PROJECT_MODE = AUTO.
My current idea or objective: [short description].
```

`AUTO` allows the AI to determine whether the codebase is `GREENFIELD`, `BROWNFIELD`, or `CHANGE` from repository evidence. If you are certain of the mode, replace `AUTO` with the specific mode. There is no need to copy the entire master prompt into chat if the AI has read access to the repository.

## Applied Development Model

This template uses the **AI-Assisted Client–Vendor Hybrid Stage-Gate Agile/DevSecOps Software Delivery Model**, or simply the **Hybrid 9-Phase Software Delivery Model**.

### Referenced International Standards

This template is designed to be **standards-aligned**; it does not claim formal certification or compliance. Each project must perform its own tailoring, evidence compilation, and reviews; if certification is required, an independent assessment must be obtained.

| Standard | Pinned Version | Scope within Template | Key Artifacts / Evidences | Control Status |
| :--- | :--- | :--- | :--- | :--- |
| [ISO/IEC/IEEE 29148:2018](https://www.iso.org/standard/72089.html) | Edition 2, requirements engineering | BRD/SRS, requirement atomicity/quality, version control, glossary, external interfaces, lifecycle, and traceability. ISO confirmed this version in 2024; verify revisions before new projects. | BRD, SRS, Feature Catalog, Use Case Spec, Traceability Matrix, requirement review | Active |
| [ISO/IEC/IEEE 29119-1:2022](https://www.iso.org/standard/81291.html) | Edition 2, general concepts | Testing vocabulary, terms, and concepts. | Test Policy, Glossary, Test Strategy | Active |
| [ISO/IEC/IEEE 29119-2:2021](https://www.iso.org/standard/79428.html) | Edition 2, test processes | Test governance, planning, entry/exit criteria, monitoring, control, and completion. | Test Policy/Plan, status/completion reports | Active |
| [ISO/IEC/IEEE 29119-3:2021](https://www.iso.org/standard/79429.html) | Edition 2, test documentation | Templates for test documentation (plans, specifications, test cases, status/completion reports, and traceability). | Test Specification, Test Case, Traceability Matrix | Active |
| [ISO/IEC/IEEE 29119-4:2021](https://www.iso.org/standard/79430.html) | Edition 2, test techniques | Design techniques (Equivalence Partitioning, Boundary Value Analysis, Decision Tables, State Transitions). | Test Specification (coverage analysis) | Active |
| [ISO/IEC 27001:2022](https://www.iso.org/standard/27001) | Edition 3, ISMS requirements | Risk-management/ISMS interface; does not substitute organizational security certification. | Security Standard, risk matrices, approvals | Active |
| [ISO/IEC 27002:2022](https://www.iso.org/standard/75652.html) | Edition 3, security controls guidance | Reference security controls tailored by Security Profile and threat model. | Security control mapping, design/test evidence | Guidance |
| [OWASP Top 10:2025](https://owasp.org/Top10/2025/0x00_2025-Introduction/) | Web application risk awareness | Threat/security review by attack surface; not a complete checklist. | Threat Model, security requirements/tests | Active |

`IEEE 830-1998` and `IEEE 829-2008` are treated as legacy references because they have been superseded. Detailed mapping and liability boundaries reside in the [Standards Alignment Matrix](00-Governance-Policy/STANDARDS_ALIGNMENT_MATRIX.md); quality rules are controlled by the [Document Quality Standard](00-Governance-Policy/DOCUMENT_QUALITY_STANDARD.md).

This is not pure Waterfall, Scrum, or V-Model. The model uses a **Stage-Gate SDLC** as its governance framework, combining Agile/Iterative Delivery, V-Model-style traceability, and DevSecOps within each phase.

| Component | Application in Template |
| :--- | :--- |
| **Client–Vendor Governance** | The Client decides goals, scope, priorities, and signs off acceptance; the Delivery Vendor handles discovery, design, development, testing, reporting, and handover. The relationship is managed via Charters, SOWs, RACI, Change Requests, and formal acceptance gates. |
| **Stage-Gate SDLC** | The project progresses through 9 phases. Each phase has inputs, mandatory artifacts, evidence, and exit gates yielding `Pass`, `Conditional Pass`, or `Fail`. |
| **Agile/Iterative Delivery** | Work within a phase is split into vertical slices and small work items. Build, review, test, and feedback happen continuously. |
| **V-Model-like Traceability** | Enforces bidirectional traceability from business objectives/requirements to designs, work items, code, tests, releases, and handovers. A requirement without passing test evidence cannot be considered done. |
| **DevSecOps** | Security, privacy, automated testing, dependency scanning, database migrations, rollbacks, and operational observability are built in from day one. |
| **Risk-based Security Profiles** | Choose from `STANDARD/HIGH/CRITICAL` profiles. Threat modeling, control selection, and release gates scale with data classification, exposure, and risk. |
| **Portable Bank Security Reference** | Two Java snapshots are provided as starting reference components. Stacks other than Spring Boot must refactor these controls into native implementations and prove equivalence with security tests. |
| **Human–AI Collaboration** | The AI does not offload work due to difficulty; it only requests human assistance for decisions, access provisioning, manual dependencies, or sign-offs using structured, minimal action requests. |
| **Brownfield Continuation** | For existing codebases, the AI audits code, configs, tests, and git state first, constructs an as-is model, executes a gap analysis, and resumes from the first failed phase gate. |

### How the 9 Phases Work

The phases are ordered to ensure scope and quality control, but they allow for **controlled iteration**. When requirements change, tests fail, designs prove unfeasible, or production incidents occur, the corresponding gates are reopened and downstream artifacts are re-verified.

Within each phase, the team executes in tight loops:

```text
Clarify ➔ Design ➔ Implement a vertical slice ➔ Build/Test/Review ➔ Feedback ➔ Adjust ➔ Exit Gate
```

Mandatory traceability sequence:

```text
Objective/Stakeholder
➔ Business/Functional/Non-functional Requirement
➔ ADR/Engineering Design
➔ Work Item
➔ Code/Configuration
➔ Test/Evidence
➔ Release
➔ Handover
```

Detailed reference documents:

- [Nine Phase Gates](.agents/skills/ai-project-delivery/references/phase-gates.md)
- [Artifact Map & Traceability](.agents/skills/ai-project-delivery/references/artifact-map.md)
- [Project Plan](01-Planning/PROJECT_PLAN.md)
- [Engineering Policy](00-Governance-Policy/ENGINEERING_POLICY.md)
- [Test Strategy & Plan](06-Testing/TEST_STRATEGY_AND_PLAN.md)
- [International Standards Alignment](00-Governance-Policy/STANDARDS_ALIGNMENT_MATRIX.md)
- [Document Quality Standard](00-Governance-Policy/DOCUMENT_QUALITY_STANDARD.md)
- [Security & Privacy Engineering Standard](00-Governance-Policy/SECURITY_AND_PRIVACY_STANDARD.md)
- [Bank Security Reference Baseline](00-Governance-Policy/BANK_SECURITY_REFERENCE_BASELINE.md)
- [Security Portability Matrix](.agents/skills/ai-project-delivery/references/security-portability-matrix.md)
- [Human–AI Collaboration Protocol](00-Governance-Policy/HUMAN_AI_COLLABORATION_PROTOCOL.md)

## Two Ways of Usage

### 1. New Project (GREENFIELD)

1. Copy the entire folder structure into a new repository.
2. Open `PROJECT_PROFILE.md` and fill in any initial known details.
3. Message the AI: `Read and execute the entire MASTER_PROMPT.md. PROJECT_MODE = GREENFIELD. My idea: ...`
4. The AI will interview you in rounds (typically 120 core questions, and 80–240 conditional questions for complex systems).
5. Once the baseline is approved, the AI will execute work locally, pausing only at defined human-exclusive gates.

### 2. Existing Project (BROWNFIELD)

1. Copy the template contents into the root of your existing project without overwriting existing files (commit/backup your code first).
2. Message the AI: `Read and execute the entire MASTER_PROMPT.md. PROJECT_MODE = BROWNFIELD. Audit the repository and resume the project.`
3. The AI reads code, configs, tests, and git state to reconstruct the current system behavior before asking questions.
4. The AI generates a gap analysis and regression tests to protect existing behavior, then continues from the first failed phase gate.

If the repository already has an `AGENTS.md` file, the bootstrap script preserves it and creates `AGENTS.ai-project-delivery.md`. Instruct the AI to merge these rule sets instead of overwriting.

Bootstrap command example:

```powershell
# Greenfield: Destination directory must be empty
powershell -ExecutionPolicy Bypass -File .\.agents\skills\ai-project-delivery\scripts\bootstrap_project.ps1 `
  -ProjectName "Product Name" -ProjectCode "APP" -ProjectOwner "Client Name" `
  -Destination "D:\Projects\my-product" -Mode Greenfield

# Brownfield: Copies missing template files without overwriting existing files
powershell -ExecutionPolicy Bypass -File .\.agents\skills\ai-project-delivery\scripts\bootstrap_project.ps1 `
  -ProjectName "Product Name" -ProjectCode "APP" -ProjectOwner "Client Name" `
  -Destination "D:\Projects\existing-product" -Mode Brownfield
```

## The 9 Phases

| Phase | Main Objective | Output Gate |
| :--- | :--- | :--- |
| `00-Governance-Policy` | Charter, roles, decision rights, and engineering policies | Governance aligned with clear owners |
| `01-Planning` | Discovery, scoping, roadmaps, and risk register | Problem and scope baseline approved |
| `02-Requirements` | BR/FR/NFR/UC/US specifications and traceability | Requirements clear, testable, and prioritized |
| `03-Architecture-Design` | C4 modeling, ADRs, database/API/UX designs, threat modeling | Architecture feasible and design reviewed |
| `04-Implementation` | Work breakdown, database migration, release, and rollback planning | Ready for implementation |
| `05-Development` | Coding, reviews, CI pipeline setup, technical debt tracking | Build compiles, lints, and unit tests pass |
| `06-Testing` | Integration, E2E, security, performance, and UAT checks | Quality meets exit criteria |
| `07-Reports` | Status, sprint, release, incident, and final reports | Outcomes and deviations transparent |
| `08-Document-References` | Runbooks, user guides, handover documentation, and archiving | Receiving team can operate the system |

## Interview Mechanics

The question bank resides in `.agents/skills/ai-project-delivery/references/`. The AI does not ask questions mechanically; it uses conditional questioning, cross-checks answers, explores edge cases, and logs all decisions in `01-Planning/DISCOVERY_LOG.md`.

## Automation and Safety

Once the baseline is approved, the AI operates in `FULL-LOCAL` mode by default: making local, reversible changes within the agreed scope. The AI must search the code graph, configurations, tests, official references, and run safe experiments before asking questions. Operations such as deploying to production, spending money, modifying billing, deleting production data, sending external notifications, or reducing security controls still require explicit, manual human confirmation.

## Template Variables

Search and replace variables matching `{{VARIABLE}}`. At a minimum, provide:

| Variable | Meaning |
| :--- | :--- |
| `{{PROJECT_NAME}}` | Full name of the product |
| `{{PROJECT_CODE}}` | Short code, uppercase, alphanumeric |
| `{{PROJECT_OWNER}}` | Person ultimately responsible |
| `{{PRODUCT_OWNER}}` | Product decision maker |
| `{{TECH_LEAD}}` | Technical decision maker |
| `{{DATE}}` | Date in `YYYY-MM-DD` format |
| `{{VERSION}}` | Version of the document/product |
| `{{STATUS}}` | Draft / In Review / Approved / Deprecated |

## Verification

From the root of the project, run:

```powershell
powershell -ExecutionPolicy Bypass -File .\.agents\skills\ai-project-delivery\scripts\validate_delivery.ps1
```

This script verifies the presence of the 9 phases, mandatory artifacts, and basic traceability.

Semantic and contract checks can be run during template maintenance:

```powershell
powershell -ExecutionPolicy Bypass -File .\.agents\skills\ai-project-delivery\scripts\lint_delivery.ps1
powershell -ExecutionPolicy Bypass -File .\.agents\skills\ai-project-delivery\scripts\validate_contracts.ps1 -Strict
powershell -ExecutionPolicy Bypass -File .\.agents\skills\ai-project-delivery\scripts\generate_document_index.ps1
```

In an unpopulated template, warning messages about "Unresolved template placeholders" are normal. For a real handover, run the validator with the `-StrictDelivery` flag; any remaining placeholders or unpassed phase gates will cause validation to fail.
