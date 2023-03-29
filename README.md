# Administrate::Field::Money

[![No Maintenance Intended](https://unmaintained.tech/badge.svg)](https://unmaintained.tech/) [![Build status](https://github.com/zooppa/administrate-field-money/actions/workflows/build.yml/badge.svg)](https://github.com/zooppa/administrate-field-money/actions/workflows/build.yml) [![Code Climate](https://codeclimate.com/github/zooppa/administrate-field-money/badges/gpa.svg)](https://codeclimate.com/github/zooppa/administrate-field-money)

---

### IMPORTANT NOTICE

**This gem is not actively maintained anymore**.

If you’re interested in taking over and steward the project moving forward, please get in touch.

---

A plugin to deal with money in [Administrate], with the help of [Money] gem.

**IMPORTANT: this plugin expects the attribute to be an integer representing the
number of cents, with a name ending in `_cents`**.

## Usage

Add it to your `Gemfile`:

```ruby
gem 'administrate-field-money', '~> 0.3.0'
```

Run:

```bash
$ bundle install
```

Add to your `FooDashboard`:

```ruby
ATTRIBUTE_TYPES = {
  amount_cents: Field::Money.with_options(
    code: 'USD', # EUR, CAD, GBP, AUD, JPY, ...
    symbol: '$',
    delimiter: ',',
    separator: '.'
  ),
}.freeze
```

The field will figure out the appropriate thousand separator and decimal delimiter for the unit.

![Demo](https://raw.githubusercontent.com/zooppa/administrate-field-money/master/demo.gif)

## About

Administrate::Field::Money is maintained by [Zooppa].

See also the list of [contributors](https://github.com/zooppa/administrate-field-money/contributors) who participated in this project.

[administrate]: https://github.com/thoughtbot/administrate
[money]: https://github.com/RubyMoney/money
[zooppa]: https://www.zooppa.com/
