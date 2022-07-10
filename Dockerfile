FROM elixir:1.12.3

# install debian packages
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
  apt-get install -y postgresql-client inotify-tools && \
  apt-get clean

# prepare work dir
WORKDIR /app

# install phoenix packages
RUN mix local.hex --force
RUN mix local.rebar --force
RUN mix archive.install hex phx_new

# install nodejs
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - && \
  apt-get install -y nodejs

# copy files
COPY . /app

# compile application
# RUN mix deps.get
# RUN mix deps.compile
# RUN mix compile

# CMD ["mix", "phx.server"]
