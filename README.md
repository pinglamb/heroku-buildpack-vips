# Heroku Buildpack for VIPS
This is a [Heroku Buildpack](http://devcenter.heroku.com/articles/buildpacks) for [libvips](https://github.com/jcupitt/libvips).

The libvips is pre-built base on the [commmit f1635b8](https://github.com/jcupitt/libvips/commit/f1635b873d2f2d5887da8ba7cd0aa1cfc2741f46) inside docker with [heroku/cedar:14](https://hub.docker.com/r/heroku/cedar/) image with `libjpeg-turbo8-dev`, `libpng12-dev`, `libgif-dev` and `libwebp-dev`.

Heavily inspired from https://github.com/alex88/heroku-buildpack-vips.
