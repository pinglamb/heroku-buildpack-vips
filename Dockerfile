FROM heroku/cedar:14

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN apt-get update
# dependencies of libvips
RUN apt-get install -y --no-install-recommends git build-essential pkg-config libglib2.0-dev libxml2-dev swig gtk-doc-tools gobject-introspection libjpeg-turbo8-dev libpng12-dev libgif-dev libwebp-dev
RUN rm -rf /var/lib/apt/lists/*

RUN mkdir -p /app/vendor/vips

RUN cd /tmp \
  && git clone https://github.com/jcupitt/libvips.git \
  && cd libvips \
  && ./bootstrap.sh \
  && ./configure --enable-debug=no --without-python --without-fftw --without-libexif --without-orc --prefix=/app/vendor/vips \
  && make \
  && make install \
  && ldconfig

CMD ["rm -Rf /tmp/vips-export/* && cp -R /app/vendor/vips/* /tmp/vips-export/"]

VOLUME ["/tmp/vips-export"]
