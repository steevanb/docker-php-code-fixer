[![version](https://img.shields.io/badge/version-2.0.19-green.svg)](https://github.com/steevanb/docker-php-code-fixer/tree/2.0.19)
[![php](https://img.shields.io/badge/docker-blue.svg)](https://php.net)
![Lines](https://img.shields.io/badge/code%20lines-105-green.svg)

## docker-php-code-fixer

Docker container for [wapmorgan/PhpCodeFixer](https://github.com/wapmorgan/PhpCodeFixer).

Version of this repository,
and docker images on [dockerhub](https://cloud.docker.com/u/steevanb/repository/docker/steevanb/php-code-fixer),
follow [wapmorgan/PhpCodeFixer](https://github.com/wapmorgan/PhpCodeFixer) versions.

If some fix has to be made on this repository, we will add a 4th level in version, like 2.0.19`.1`.

## Installation

You don't need to install this repository, use the Docker image directly.

## Usage

### Locally

Create `bin/phpcf`: 

```bash
#!/usr/bin/env sh

set -e

if [ $(which docker || false) ]; then
    readonly PROJECT_DIRECTORY=$(realpath $(dirname $(realpath $0))/..)
    docker run \
        --rm \
        -it \
        -v ${PROJECT_DIRECTORY}:/var/php-code-fixer:ro \
        -w /var/php-code-fixer \
        steevanb/php-code-fixer:2.0.19 \
        bin/phpcf
else
    phpcf --exclude=/vendor/ .
fi
```

### Integration with CircleCI

Add phpcf in `.circleci/config.yml`:

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
                  name: phpcf
                  command: bin/phpcf

workflows:
    version: '2.1'
    Code quality:
        jobs:
            - phpcf
```
