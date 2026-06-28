# Sydium API Docs

Public documentation for the Sydium API, published via Mintlify at **https://docs.sydium.com**.

This repo is intentionally **separate from the main Sydium monorepo** so Mintlify (a third party)
only ever has access to public-facing docs - never the proprietary codebase.

## Structure

- `docs.json` - Mintlify config (navigation, theme)
- `quickstart.mdx`, `authentication.mdx`, `errors.mdx` - guides
- `api-reference/openapi.yaml` - the OpenAPI 3.1 spec (a **synced copy** - do not hand-edit)
- `llms.txt` - compact API index for AI agents
- `scripts/sync-openapi.sh` - copies the spec from the monorepo

## Source of truth

The OpenAPI spec's source of truth is `functions/openapi/v1.yaml` in the **main Sydium repo**.
`api-reference/openapi.yaml` here is a synced copy. To update it after the API changes:

```bash
./scripts/sync-openapi.sh /path/to/Sydium
git add api-reference/openapi.yaml && git commit -m "sync openapi spec" && git push
```

The spec changes rarely, so manual sync is fine. To automate later, add a GitHub Action in the
**monorepo** that, on changes to `functions/openapi/v1.yaml`, pushes the updated file to this repo
(using a deploy key / PAT with write access here).

## Local preview

```bash
npx mint dev
```

## Mintlify setup

Connect Mintlify to **this repo only** (`Parhelion-Software/sydium-docs`), default branch, content
directory = repo root. Do not connect the code monorepo.
