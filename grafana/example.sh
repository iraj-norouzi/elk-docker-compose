#!/usr/bin/env bash

# In the [Grafana GitHub repository](https://github.com/grafana/grafana)
# there is a folder called packaging/docker/custom/,
# which includes two Dockerfiles, Dockerfile and ubuntu.Dockerfile,
# that can be used to build a custom Grafana image. It accepts GRAFANA_VERSION,
# GF_INSTALL_PLUGINS, and GF_INSTALL_IMAGE_RENDERER_PLUGIN as build arguments.
# Build with pre-installed plugins

# If you need to specify the version of a plugin, you can add it to the
# GF_INSTALL_PLUGINS build argument.
# 
# Otherwise, the latest will be assumed.
# 
# For example:
# --build-arg "GF_INSTALL_PLUGINS=grafana-clock-panel 1.0.1,grafana-simple-json-datasource 1.3.5"

# Build with Grafana Image Renderer plugin pre-installed

# Only available in Grafana v6.5 and later. This is experimental.

# The Grafana Image Renderer plugin does not currently work if it is installed
# in a Grafana Docker image.
# You can build a custom Docker image by using the
# GF_INSTALL_IMAGE_RENDERER_PLUGIN build argument.
# This installs additional
# dependencies needed for the Grafana Image Renderer plugin to run.

# Example of how to build and run:

# cd packaging/docker/custom

docker build \
  --build-arg "GRAFANA_VERSION=latest" \
  --build-arg "GF_INSTALL_IMAGE_RENDERER_PLUGIN=true" \
  --build-arg \
  "GF_INSTALL_PLUGINS=grafana-clock-panel 1.0.1,grafana-simple-json-datasource 1.3.5" \
  -t grafana-custom -f Dockerfile .

docker run -d -p 3000:3000 --name=grafana grafana-custom
