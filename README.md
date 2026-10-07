# akrell-hello

A minimal Django app. A push to `main` builds `ghcr.io/mikaelhug/akrell-hello:<next>-rc.<run>`,
which Flux rolls out to staging; a tag `vX.Y.Z` builds `X.Y.Z`, which Flux rolls out to
production.
