# Nexus Container

A containerized setup for Sonatype Nexus Repository Manager, built on `ubi8/ubi:8.7`. Includes a Containerfile and two scripts - one for building the image and one for running it. Nexus data is kept on the host so nothing gets lost when the container restarts.

---

## Build

Make sure `Containerfile` and `build.sh` are in the same directory, then run:

```bash
./build.sh
```

---

## Run

```bash
./run.sh
```

This starts the container in the background, maps port `18081` on the host to Nexus, mounts `/tn_devops/nexus` for persistent storage, and sets it to restart automatically on boot.

---

## Login

Go to:

```
http://<host-ip>:18081
```

Default credentials are `admin` / `admin123`. You'll be asked to change the password on first login.
