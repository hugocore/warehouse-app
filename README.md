[![Build Status](https://travis-ci.org/hugocore/warehouse-app.svg?branch=master)](https://travis-ci.org/hugocore/warehouse-app)
[![Maintainability](https://api.codeclimate.com/v1/badges/57d6a14eb1a0c0ee7248/maintainability)](https://codeclimate.com/github/hugocore/warehouse-app/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/57d6a14eb1a0c0ee7248/test_coverage)](https://codeclimate.com/github/hugocore/warehouse-app/test_coverage)
[![Coverage Status](https://coveralls.io/repos/github/hugocore/warehouse-app/badge.svg?branch=master)](https://coveralls.io/github/hugocore/warehouse-app?branch=master)

# Skeleton - Code tests

A Warehouse Management System built using #Ruby and #Ruby on Rails.

# Usage

Run this project with Docker:

```
docker-compose build
docker-compose run --rm web rake db:reset
docker-compose run --rm web rspec
```

Or, locally by creating an `.env` file with:

```
DB_HOST=...
DB_USER=...
DB_PASSWORD=...
```

And then running:

```
bundle install
RAILS_ENV=test rake db:create
rspec
```

# Code Quality

- Run rspec via Spring to speed up preloading with:

```
docker-compose run --rm web bash
bundle exec spring rspec
```

- Check test coverage locally:

```
open coverage/index.html
```

- A git commit hook runs Rubocop to validate changes, to skip it run:

```
SKIP=RuboCop git commit
```

- Travis makes sure the repo keeps building:

https://travis-ci.org/github/hugocore/warehouse-app

- Coveralls shows test coverage at:

https://coveralls.io/github/hugocore/warehouse-app

- Codeclimate checks code quality for every build at:

https://codeclimate.com/github/hugocore/warehouse-app

# The problem

Let's build a software for adding products to a warehouse. The users of the software would be able to add/update/delete products with variants. Each product must have a title (required), description (optional and up to 300 characters) and variants (at least one). Variants have a unique SKU (string, no specific format) and stock quantity (required, integer, not negative).

## Assumptions

- TODO

# Solution


### Code

#### TODO

- TODO

#### Registry

Perhaps one of the most important pieces of code is the `Container`. It keeps a registry
of all the repositories and services, allowing these to be auto-injected into
one another's. For instance:

```ruby
- TODO
```

Thus, we can compose objects together and decouple them from actual implementations.
It's also particularly useful when testing because it allows dependencies to be
stubbed in specs, preventing things like hitting databases or raising errors.

# Improvements

- TODO

# Review

Take a look these pages to review this work:

- https://github.com/hugocore/warehouse-app/pulls
