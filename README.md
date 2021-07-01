# Jungle

A mini e-commerce application built with Rails 4.2 that allows users to buy products, for admins to add categories and products.

This project is my solution to this exercise and published by me as part of my learnings at Lighthouse Labs.

## Screenshots

!["Full list"](https://github.com/Avivitw/scheduler/blob/master/docs/full_list.png?raw=true)

!["Edit and Delete"](https://github.com/Avivitw/scheduler/blob/master/docs/edit_delete.png?raw=true)

## Getting Started

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Dependencies

- Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
- PostgreSQL 9.x
- Stripe
