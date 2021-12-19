# Rails Devs

Find Rails developers looking for freelance and contract work.

<img width="1764" alt="image" src="https://user-images.githubusercontent.com/2092156/141209840-fea16afa-541b-4129-a8b0-8d2d544f7b4a.png">

### Getting started

#### Requirements

You need the following installed:

* Ruby 3.0 or higher
* [bundler](https://bundler.io) - `gem install bundler`
* [Redis](https://redis.io) - `brew install redis`
* [Imagemagick](https://imagemagick.org) - `brew install imagemagick`
* [Yarn](https://yarnpkg.com) - `brew install yarn`
* [Stripe CLI](https://stripe.com/docs/stripe-cli) - `brew install stripe/stripe-cli/stripe`

Optional:

* [foreman](https://github.com/ddollar/foreman) - `gem install foreman`
* [overmind](https://github.com/DarthSim/overmind) - `gem install overmind`

#### Initial setup

An installation script is included with the repository that will automatically get the application setup.

```bash
bin/setup
```

### Development

Run the following to start the server and automatically build assets.

* Requires `foreman` or `overmind`
* Requires `stripe`

```bash
bin/dev
```

#### Stripe

If you are working on anything related to payments then you will need to configure Stripe.

1. [Create a Stripe account](https://dashboard.stripe.com/register) and add an account
1. Login to the Stripe CLI via `stripe login`
1. Configure your development credentials
    1. Generate your credentials file via `bin/rails credentials:edit --environment development`
    1. [Create a Stripe secret key for test mode](https://dashboard.stripe.com/test/apikeys)
    1. [Create a product](https://dashboard.stripe.com/test/products/create) with a recurring, monthly price
    1. Add the secret key and price to your development credentials in the following format

```
stripe:
  private_key: sk_test_YOUR_TEST_STRIPE_KEY
  price_id: price_YOUR_PRICE_ID
```

### Testing

Run `rails test` to run unit/integration tests.
