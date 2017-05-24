# lsst-texlive

**texlive Docker image for LSST documentation deployment.**

Use ``lsst-texlive`` in a CI environment to speed up build times, or as a replacement for a local lexlive installation on your own computer.

**Links:**

- GitHub repository: https://github.com/lsst-sqre/lsst-texlive
- Docker Hub: https://hub.docker.com/r/lsstsqre/lsst-texlive/

## Example usage

This example demonstrates how how to build [DMTN-044](https://github.com/lsst-dm/dmtn-044) (a LaTeX-formatted technical note) with `lsst-texlive`.

```bash
git clone https://github.com/lsst-dm/dmtn-044
cd dmtn-044
git submodule init && git submodule update
docker run --rm -v `pwd`:/workspace -w /workspace lsstsqre/lsst-texlive:latest sh -c 'make'
```

Notes:

- The `-v` argument binds the current working directory (the technote's source) to the `/workspace` directory in the container.
- The `-w` argument has the container run the user command (`sh -c make`) from that `workspace` directory.

## What's in it

The ``lsst/lsst-texlive`` image is currently based on Ubuntu trusty (14.04).
It includes ``git``, ``make`` and a comprehensive texlive installation.
See the Dockerfile for details.

## License

Copyright 2017 Association of Universities for Research in Astronomy, Inc..

lsst-texlive is MIT-licensed open source. See LICENSE file.
