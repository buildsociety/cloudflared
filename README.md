# cloudflared

<span style="display:block;text-align:center">[![GitHub](https://img.shields.io/static/v1.svg?color=db422a&logoColor=2a6bdb&style=for-the-badge&label=buildsociety&message=GitHub&logo=github)](https://github.com/buildsociety "view the source for all of our repositories.")</span>

![GitHub Workflow Status](https://img.shields.io/github/workflow/status/buildsociety/cloudflared/build?color=db422a&logoColor=FFFFFF&style=for-the-badge)
![Docker Pulls](https://img.shields.io/docker/pulls/buildsociety/cloudflared?color=db422a&logoColor=2a6bdb&style=for-the-badge)
![Docker Image Size (latest by date)](https://img.shields.io/docker/image-size/buildsociety/cloudflared?color=db422a&logoColor=2a6bdb&style=for-the-badge)
![Docker Stars](https://img.shields.io/docker/stars/buildsociety/cloudflared?color=db422a&logoColor=2a6bdb&style=for-the-badge)
![Docker Image Version (latest by date)](https://img.shields.io/docker/v/buildsociety/cloudflared?color=db422a&logoColor=2a6bdb&style=for-the-badge)

cloudflared is the command-line client and libraries for Argo Tunnel, a tunneling daemon that proxies any local webserver through the Cloudflare network. Built from source nightly.

## Supported Architectures
Our images support multiple architectures such as x86-64, arm64 and armhf. We utilise the docker manifest for multi-platform awareness. More information is available from docker [here](https://github.com/docker/distribution/blob/master/docs/spec/manifest-v2-2.md#manifest-list).

Simply pulling [buildsociety/cloudflared](https://github.com/buildsociety/cloudflared) should retrieve the correct image for your arch.

## Version Tags

This image provides various versions that are available via tags. `latest` tag usually provides the latest stable version. Others are considered under development and caution must be exercised when using them.

| Tag | Description |
| :----: | --- |
| latest | Stable cloudflared Releases |
| edge | Latest cloudflared Releases |
| 2020.11.5 | cloudflared 2020.11.5 Release |
| 2020.11.4 | cloudflared 2020.11.4 Release |
| 2020.11.3 | cloudflared 2020.11.3 Release |
| 2020.11.2 | cloudflared 2020.11.2 Release |
| 2020.11.1 | cloudflared 2020.11.1 Release |
| 2020.11.0 | cloudflared 2020.11.0 Release |
| 2020.10.2 | cloudflared 2020.10.2 Release |
| 2020.10.1 | cloudflared 2020.10.1 Release |
| 2020.10.0 | cloudflared 2020.10.0 Release |
| 2020.9.3 | cloudflared 2020.9.3 Release |
| 2020.9.1 | cloudflared 2020.9.1 Release |
| 2020.9.0 | cloudflared 2020.9.0 Release |
| 2020.8.2 | cloudflared 2020.8.2 Release |
| 2020.8.1 | cloudflared 2020.8.1 Release |
| 2020.8.0 | cloudflared 2020.8.0 Release |
| 2020.7.4 | cloudflared 2020.7.4 Release |
| 2020.7.3 | cloudflared 2020.7.3 Release |
| 2020.7.2 | cloudflared 2020.7.2 Release |
| 2020.7.1 | cloudflared 2020.7.1 Release |
| 2020.7.0 | cloudflared 2020.7.0 Release |

## Usage

Here are some example snippets to help you get started creating a container.

### docker

```bash
    docker pull buildsociety/cloudflared:latest
```

User documentation for cloudflared can be found at https://developers.cloudflare.com/argo-tunnel/quickstart

## Updating Info

Most of our images are static, versioned, and require an image update and container recreation to update the app inside. We do not recommend or support updating apps inside the container.

An automated process for upgrading your container is available via [containrrr/watchtower](https://github.com/containrrr/watchtower).

## Licence
By using this image, you agree to the cloudflared (Argo Tunnel) [licence](https://github.com/cloudflare/cloudflared/blob/master/LICENSE)
