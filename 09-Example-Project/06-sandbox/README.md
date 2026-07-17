---
artifact_id: EXAMPLE-TASK-SANDBOX
phase: "09-Example-Project"
artifact_type: environment
owner: "Operations"
version: "1.0"
status: Deployed-sandbox
ids: [REL-TASK-001, ENV-TASK-001]
dependencies: [EXAMPLE-TASK-TESTING]
last_verified: "2026-07-18"
---
# Local deployed sandbox

Reproducible command sequence:

```text
docker compose -f deploy/docker-compose.sandbox.yml up --build --wait
curl --fail http://localhost:8080/actuator/health
docker compose -f deploy/docker-compose.sandbox.yml down --volumes
```

The health response and compose logs are the sandbox evidence. No internet-facing endpoint, real customer data, or production secret is used. If Docker is unavailable, mark the sandbox gate blocked and record the exact environment owner/action rather than claiming deployment.
