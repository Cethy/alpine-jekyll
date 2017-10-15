FROM alpine:3.6

ENV OUTPUT_DIR '/var/_site'
ENV INPUT_DIR '/var/_source'
ENV INPUT_EXTRA_PARAMETERS ''

# Copy entrypoint script
COPY ./entrypoint.sh /bin/entrypoint.sh
RUN chmod +x /bin/entrypoint.sh

# Install jekyll app
COPY ./app/* /app/

WORKDIR /app
# install dev deps in --virtual, gem install and cleanup
RUN apk add --update ruby \
    && apk add --virtual build-dependencies build-base ruby-dev libffi-dev \
    && gem install bundler --no-ri --no-rdoc \
    && bundle install --without development test \
    && gem cleanup \
    && apk del build-dependencies

ENTRYPOINT ["entrypoint.sh"]
CMD ["build"]
