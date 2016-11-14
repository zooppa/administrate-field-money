# Administrate::Field::Money

[![Code Climate](https://codeclimate.com/github/z-productions/administrate-field-money/badges/gpa.svg)](https://codeclimate.com/github/z-productions/administrate-field-money)

A plugin to deal with money in [Administrate], with the help of [Money] gem.

**Attribute must be in cents**.

![Demo](https://raw.githubusercontent.com/z-productions/administrate-field-money/master/demo.gif)

## Usage

Add it to your `Gemfile`:

```ruby
gem 'administrate-field-money', '~> 0.0.1'
```

Run:

```bash
$ bundle install
```

Add to your `FooDashboard`:

```ruby
ATTRIBUTE_TYPES = {
  bar: Field::Money.with_options(
    unit: 'USD', # EUR, CAD, GBP, AUD, JPY, ...
    symbol: '$',
    delimiter: ',',
    separator: '.'
  ),
}.freeze
```
The field will figure out the appropriate thousand separator and decimal delimiter for the unit.

## About

Administrate::Field::Money is maintained by [z.productions].

[Administrate]: https://github.com/thoughtbot/administrate
[Money]: https://github.com/RubyMoney/money
[z.productions]: https://www.z.productions/
