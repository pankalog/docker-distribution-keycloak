# Keycloak and CNCF Distribution Docker-compose

This repository was made to reproduce the issue of `failed to verify token: token signed by untrusted key with ID` by Distribution upon login of a user to the registry. There is a mismatch between the reported KIDs from Keycloak and Distribution.

This repository was created from [this issue](https://github.com/distribution/distribution/issues/2875), to reproduce the issue easily.

# Launching, reproduction

To reproduce the issue, run the docker-compose project:

```bash
docker compose up -p distributionRepro up -d
```
Wait a minute or two until Keycloak is up and running, and then try to log in to the registry with `testuser` and `secret` as username and password respectively:

```bash
docker login https://localhost:5001 -u testuser -p secret
```

*Maybe I will be able to use this as a demo repository down the line!*