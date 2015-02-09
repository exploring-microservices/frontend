# Frontend

Note: This project is part of a series of blog posts about Microservices.

Web frontend for interacting with the [Registrar](https://github.com/exploring-microservices/registrar) API.

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
