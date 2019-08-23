[![version](https://img.shields.io/badge/version-2.0.19-green.svg)](https://github.com/steevanb/docker-php-code-fixer/tree/2.0.19)
[![php](https://img.shields.io/badge/docker-blue.svg)](https://php.net)
![Lines](https://img.shields.io/badge/code%20lines-105-green.svg)

docker-php-code-fixer
=====================

Docker container for [wapmorgan/PhpCodeFixer](https://github.com/wapmorgan/PhpCodeFixer).

Version of this repository,
and docker images on [dockerhub](https://cloud.docker.com/u/steevanb/repository/docker/steevanb/php-code-fixer),
follow [wapmorgan/PhpCodeFixer](https://github.com/wapmorgan/PhpCodeFixer) versions.

If some fix has to be made on this repository, we will add a 4th level in version, like 2.0.19`.1`.

Installation
============

You don't need to install this repository, use the Docker image directly.

Usage
====

You can use a script like this one to launch Docker container who will test all files into `/var/php-code-fixer`:

```bash
#!/usr/bin/env sh

readonly PROJECT_DIRECTORY=$(realpath $(dirname $(realpath $0)))

set -e

docker run \
    --rm \
    -v ${PROJECT_DIRECTORY}:/var/php-code-fixer:ro \
    -w /var/php-code-fixer \
    steevanb/php-code-fixer:2.0.19
```

To add some parameters to PhpCodeFixer:

```bash
#!/usr/bin/env sh

readonly PROJECT_DIRECTORY=$(realpath $(dirname $(realpath $0)))

set -e

docker run \
    --rm \
    -v ${PROJECT_DIRECTORY}:/var/php-code-fixer:ro \
    -w /var/php-code-fixer \
    steevanb/php-code-fixer:2.0.19 \
    phpcf --target=7.3 /var/php-code-fixer
```

Example of how using it with CircleCI:
```yaml
version: '2.1'

jobs:
    phpcf:
        docker:
            - image: steevanb/php-code-fixer:2.0.19
        working_directory: /var/php-code-fixer
        steps:
            - checkout
            - run:
                name: PhpCodeFixer
                command: phpcf .
```
