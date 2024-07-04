# Jungle

This project is a mini e-commerce application developed with Ruby on Rails 6.1. It was created to gain proficiency in Ruby and the Rails framework through debugging, working with an existing code base, implementing new features, and refining existing functionalities. Some of the changes include:
  - Admin Security: Implemented HTTP Basic Auth to secure access to admin pages.
  - Category Management: Added functionality for admins to create and manage product categories.
  - User Authentication: Introduced user authentication using has_secure_password for secure password handling.
  - Inventory Management: Modified product display to replace the add button with a sold out button when products are out of stock.
  - Cart Enhancements: Implemented an empty cart message when users attempt to checkout with no items in their cart.

## Application Screenshots 
!["Jungle main page, inclueds nav bar and rows of plant for sale"](https://github.com/Mekyle28/Jungle-rails/blob/feature/cypress/docs/jungle%20products%20page.png?raw=true)

!["Jungle main product description page, features the Giant Tea plant and a soldout badge"](https://github.com/Mekyle28/Jungle-rails/blob/feature/cypress/docs/jungle%20product%20info.png?raw=true)

!["Jungle cart page"](https://github.com/Mekyle28/Jungle-rails/blob/feature/cypress/docs/jungle%20cart.png?raw=true)



## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe
