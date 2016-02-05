# Danish banktools

Ruby gem to validate and normalize Danish account numbers.

This library only checks the length of the full account number, bank registration number included.

If we got anything wrong, please file an issue or contribute a fix yourself.

## Usage

    account = BankTools::DK::Account.new("12345678901")
    account.valid?  # => true
    account.errors  # => []

    bad_account = BankTools::DK::Account.new("1")
    bad_account.valid?  # => false
    bad_account.errors  # => [:too_short]

    # Error codes

    BankTools::SE::Errors::TOO_SHORT                # => :too_short
    BankTools::SE::Errors::TOO_LONG                 # => :too_long
    BankTools::SE::Errors::INVALID_CHARACTERS       # => :invalid_characters

## Tests

    bundle
    rspec # or: rake


## Installation

Add this line to your application's Gemfile:

    gem 'banktools-dk'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install banktools-dk

## TODO

* Normalization
* Interpret bank registration number?

## Also see

* [BankTools::SE(Swedish)](https://github.com/barsoom/banktools-se)
* [BankTools::DE (German)](https://github.com/barsoom/banktools-de)
* [iban-tools](https://github.com/iulianu/iban-tools)

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
