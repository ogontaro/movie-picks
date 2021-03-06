FROM ruby:2.7.1-slim

ENV LANG="C.UTF-8" \
    RAILS_ENV="development" \
    TZ="Asia/Tokyo" 
RUN cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# mysql-client use default-libmysqlclient-dev
RUN apt-get update && \
    apt-get install -y --no-install-recommends build-essential wget default-libmysqlclient-dev && \
    apt-get clean && \
    rm -r /var/lib/apt/lists/*

ENV ENTRYKIT_VERSION 0.4.0
RUN wget -q https://github.com/progrium/entrykit/releases/download/v${ENTRYKIT_VERSION}/entrykit_${ENTRYKIT_VERSION}_Linux_x86_64.tgz && \
    tar -xvzf entrykit_${ENTRYKIT_VERSION}_Linux_x86_64.tgz && \
    rm entrykit_${ENTRYKIT_VERSION}_Linux_x86_64.tgz && \
    mv entrykit /bin/entrykit && \
    chmod +x /bin/entrykit && \
    entrykit --symlink

ENV DOCKERIZE_VERSION v0.6.1
RUN wget -q https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz

ENV USER_NAME moviepicks
ENV USER_HOME /home/${USER_NAME}
ENV APP_HOME ${USER_HOME}/project
RUN useradd ${USER_NAME} -u 1234 -d ${USER_HOME} && \
    mkdir -p ${APP_HOME} && \
    chown ${USER_NAME}.${USER_NAME} -R ${USER_HOME}
WORKDIR ${APP_HOME}

RUN chown -R ${USER_NAME}:${USER_NAME} $GEM_HOME

USER ${USER_NAME}
WORKDIR ${APP_HOME}

COPY Gemfile* ./
USER root
RUN chown ${USER_NAME}:${USER_NAME} Gemfile*
USER ${USER_NAME}

RUN bundle install --jobs 4
RUN mkdir tmp

EXPOSE 3000

ENTRYPOINT [ \
    "prehook", "ruby -v", "--", \
    "prehook", "rm -f tmp/pids/server.pid", "--", \
    "prehook", "bundle install -j4 --quiet", "--", \
    "prehook", "dockerize -wait tcp://db:3306 -timeout 30s", "--", \
    "prehook", "bundle exec rails db:create db:migrate", "--" \
    ]
