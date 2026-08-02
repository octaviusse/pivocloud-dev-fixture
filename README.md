# pivocloud-dev-fixture

A deliberately trivial app whose only job is to **always deploy on PivoCloud**, so
development and UAT have a guaranteed-buildable target.

It serves one page listing the environment variables the container can see. That
turns *"did my env-var edit actually reach the running container?"* into something
you check by reloading a page rather than by running `docker exec`.

## Why it looks so old-fashioned

The `Dockerfile` uses only classic syntax — no `RUN --mount=...`, no heredocs.
PivoCloud's worker currently builds with the **legacy** Docker builder, so a
modern `docker init`-style Dockerfile fails to build. Keeping this one boring is
the entire point: it must never be the thing that breaks.

## Usage

Point a PivoCloud app at this repository and deploy. Then set a variable in the
dashboard, redeploy, and reload the page.

`GET /healthz` returns `ok` for health probes.

## Warning

This page prints every environment variable it is given, unredacted. Never run it
with real credentials attached.
