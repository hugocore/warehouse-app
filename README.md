[![Build Status](https://travis-ci.org/hugocore/warehouse-app.svg?branch=master)](https://travis-ci.org/hugocore/warehouse-app)
[![Maintainability](https://api.codeclimate.com/v1/badges/57d6a14eb1a0c0ee7248/maintainability)](https://codeclimate.com/github/hugocore/warehouse-app/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/57d6a14eb1a0c0ee7248/test_coverage)](https://codeclimate.com/github/hugocore/warehouse-app/test_coverage)
[![Coverage Status](https://coveralls.io/repos/github/hugocore/warehouse-app/badge.svg?branch=master)](https://coveralls.io/github/hugocore/warehouse-app?branch=master)

# Warehouse Management System

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

Let's build an app to manage products in a warehouse. The users of the software would be able to add/update/delete products with variants. Each product must have a title (required), description (optional and up to 300 characters) and variants (at least one). Variants have a unique SKU (string, no specific format) and stock quantity (required, integer, not negative).

# Solution

Straight out Rails MVC application with models (`Product`, `Variant`) to encapsulate business logic, controllers to prepare objects and serve views, and views to present data to the user.

## Requirements

The following requirements were all achieved.

### Products

- List all products, latest on the top
- Users should be able to navigate to a new product page, edit product page or delete a product by confirming the deletion.

### Add product

- Creates new product with at least one variant
- Add/remove variant buttons should only update the UI and should not persist the data

### Edit product

- Updates product and its variants
- Add/remove variant buttons should only update the UI and should not persist the data

### Non-Functional Requirements

- Rails app
- Persist data in PostgreSQL
- Product and variants should be soft deleted. Deleted product and variants are not displayed anywhere in the app.
- Adding/updating/removing variants should happen inline when creating/updating the product
- No need of fancy or responsive design but the implementation should roughly match the wireframe
- Tests (no need of 100% coverage)

# Improvements

- The UI code could eventually be moved into its own project
- A Javascript library (e.g. React) could be used here to avoid Rails views and make the code a bit more manageable and clean
- The logic that updates products and their variants could be moved into a Service Object, one that could validate data, apply the changes in a transaction and so on. Given that at this point, the update is so simple that Rails is doing all this inline, I decided to keep it simple until further notice

# Review

Take a look at these pages to review this work:

- https://github.com/hugocore/warehouse-app/pulls?q=is%3Apr+is%3Aclosed
