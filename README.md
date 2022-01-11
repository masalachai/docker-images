# docker-images

Simple project to manage Dockerfiles and auto build and upload to registries upon change to or addition of any new Dockerfiles.

There's a simple convention that is followed for tagging and uploading the image. The Dockerfile to be used to build the image must be placed inside the `dockerfiles/` directory.

- The directories under `dockerfiles/` should be labelled with the namespace you want the image to be tagged under.

- The directories under the namespace directory must be named for the label you want to tag the image with

- The Dockerfiles under the label directories must be named `Dockerfile-[version]` where `version` is the version you want to assign to the built image.

- The built image will be uploaded to the registry for which the credentials are stored in `$HOME/.docker/[namespace]`

For example, the Dockerfile at `dockerfiles/ayravat/rust/Dockerfile-1.56.1-ci` will generate an image with the tag `ayravat/rust:1.56.1-ci` and will be uploaded to the registry pointed to by the docker credentials in `$HOME/.docker/ayravat`.
