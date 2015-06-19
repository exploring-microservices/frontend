# Frontend

[![Codeship build status](https://codeship.com/projects/89586b50-92fa-0132-ea21-66933f4492d6/status?branch=master)](https://codeship.com/projects/62095)

Web frontend for interacting with the [Registrar](https://github.com/site-builder/registrar) API.

### Local development

Download gems with Bundler:

     $ bundle install

Run specs:

      $ bundle exec rspec

Run app:

      $ bin/start

Run app in production

      $ ENV=production bin/start

### Docker instructions

Build container:

      $ make build

Run specs on Docker container:

      $ make test

Run container

      $ make run

Remove image locally

      $ make clean

Make a new release and push to docker

      $ make release
