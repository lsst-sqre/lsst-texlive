set -ex

# Manage the image build from Travis CI
# This assumes that the image is initially built with the "build" tag.

# Skip deployments in PRs
if [ $TRAVIS_PULL_REQUEST != "false" ]; then
    exit 0;
fi

docker login -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD"

# Create tag; latest for master; otherwise use branch name
if [ "$TRAVIS_BRANCH" == "master" ]; then
    TAG="latest";

else
    # need to sanitize any "/" from git branches
    TAG=`echo "$TRAVIS_BRANCH" | sed "s/\//-/"`;
fi

# Tag and push the branch-based name
docker tag ${IMAGE_NAME}:build ${IMAGE_NAME}:${TAG}
docker push ${IMAGE_NAME}:${TAG}

# Tag and push based on the Travis build number for forensics
docker tag ${IMAGE_NAME}:build ${IMAGE_NAME}:travis-${TRAVIS_BUILD_NUMBER}
docker push ${IMAGE_NAME}:${IMAGE_NAME}:travis-${TRAVIS_BUILD_NUMBER}
