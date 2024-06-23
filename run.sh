#!/usr/bin/env bash

# Without these, the .rstudio_config and workspace directories within the
# container will be root-owned and therefore not writable by the rstudio user.
# To the best of my knowledge, this is because if these directories did not
# already exist, they would be created by the root user; so to remedy that, I
# simply pre-create them with the user running this script.
mkdir -p .rstudio_config
mkdir -p workspace

# https://rocker-project.org/images/versioned/rstudio.html
docker run --rm --interactive --tty \
    --publish 8787:8787 --env DISABLE_AUTH=true \
    --volume ./.rstudio_config:/home/rstudio/.config/rstudio \
    --volume ./workspace:/home/rstudio/workspace \
    cytor:latest
