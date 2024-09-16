# Event Radar API

An all in one event management system made easy for the modern era to manage events, attendees, and more.

This is the API only backend application, user facing frontend is available at [Event Radar Web](https://github.com/abhiyaantrix/event-radar-web)

Both can be independently deployed and scaled separately.

## Why

Started this project with two purposes

1. Brush up on my Ruby on Rails skills
2. Portfolio project

### Note

This is a side project and is not affiliated with any company.

This project is free of AI written code, just plain old pure human craftsmanship.

However, for certain blockers I have used AI to help me out, for example: incorrect configurations.

## Development

### Prerequisites

- Ruby 3+
- Rails 7.2+
- PostgreSQL 16+
- NodeJS 22+
- NPM 10+

Use docker setup for local development to avoid dealing with dependencies.

### Local development with docker

```bash
docker-compose up --watch

# Or if you want to rebuild everything
docker compose up --watch --remove-orphans --build --force-recreate
```

Rails server will be available on <http://localhost:3000> and Sidekiq on <http://localhost:3000/sidekiq>

YJIT is enabled by default in docker setup

### Local development without docker

These steps are only for reference, prefer docker based setup for local development.

Install Ruby, Rails, PostgreSQL and Redis locally.
Prefer using rvm to manage ruby versions and nvm to manage nodejs versions.
On MacOS with Homebrew is recommended for installing PostgreSQL and Redis.

To enable Ruby YJIT install Rust with Homebrew if Ruby is being built from sources.

```bash
brew install rust
```

Install Ruby on MacOS

```bash
rvm install 3.3.5 --docs --with-yjit --with-openssl-dir=$(brew --prefix openssl)
```

Verify YJIT is enabled

```bash
ruby -v
# ruby 3.3.5 (2024-09-03 revision ef084cc8f4) +YJIT [arm64-darwin23]

# or in irb
RubyVM::YJIT.enabled?
```

Install dependencies

```bash
bundle install
npm install
```

Standard Rails database setup

```bash
rails db:drop
rails db:create
rails db:reset
rails db:prepare
rails db:seed

rails db:migrate
rails db:migrate:with_data
```

Check [Rails documentation](https://api.rubyonrails.org/classes/ActiveRecord/Tasks/DatabaseTasks.html)
for more details or try `rails -T` to see what other commands are available.

Start Rails server

```bash
# Start rails server
rails s

# Separately start Sidekiq
bundle exec sidekiq
```

Rails server will be available on <http://localhost:3000> and Sidekiq on <http://localhost:3000/sidekiq>

### Testing

```bash
rspec
```

Rails console for debugging

```bash
rails c
```

### Code quality and best practices

```bash
# Single point to auto fix all linting issues
# It will also run rubocop
npm run lint:fix

# Execute rubocop manually
# Linting and static code analysis
rubocop -A
```

### Commit messages

We use [commitlint](https://commitlint.js.org) to enforce commit message best practices.

```bash
# Check commit message format
npm run lint:commit

# Check commit message format from specific commit
npm run lint:commit:head
```

## API Documentation

TODO: Add Swagger/OpenAPI documentation

## Concepts

Check [Concepts Overview](./docs/concepts/entities.md) for more details.
