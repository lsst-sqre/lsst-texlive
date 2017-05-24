# lsst-texlive

**texlive Docker image for LSST documentation deployment.**

Use ``lsst-texlive`` in a CI environment to speed up build times, or as a replacement for a local texlive installation on your own computer.

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

## Developer guide

You can hack on this repo by cloning it and build it using the Makefile:

```bash
git clone https://github.com/lsst-sqre/lsst-texlive
cd lsst-texlive
make all
docker run --rm lsstsqre/lsst-texlive:latest
```

This repo uses Travis CI to build and push tagged image to Docker Hub.
The normal development workflow is:

1. Create a branch.
2. Commit changes and push to a new branch on GitHub (`git push -u`).
3. Test your image using the tagged version corresponding to the branch or Travis build number.
4. To release, make a tag: `git tag -s N.N.N -m "vN.N.N"` and `git push --tags`
5. Merge to master: `git checkout master && git merge --no-ff <branch>`.

The `latest` tag corresponds to the head of the `master` branch.

## License

Copyright 2017 Association of Universities for Research in Astronomy, Inc..

lsst-texlive is MIT-licensed open source. See LICENSE file.
