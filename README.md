# Luhn_Validation

## Introduction
A ruby gem implementing the Luhn (Modulus 10) algorithm commonly used for credit card validation.

## Installation

	gem install luhn_validation

## Use
Require the gem:

    require 'luhn_validation'

Instantiate a validation object:

	luhn_val = LuhnValidation.new

Validate the credit card number.  Note that basic string sanitising is performed performed, so acceptable formats include:

* Alpha character separated strings such as hyphens (4444-3333-2222-1111) or whitespace (4444 3333 2222 1111) etc.
* FIXNUM

Validate returns true if the number passes luhn validation, false otherwise.

    luhn_val.validate('4444-3333-2222-1111')

You can also access the validation objects more recently processed number via the cc_dirty and cc_clean attributes.

    luhn_val.cc_dirty # => '4444-3333-2222-1111'
    luhn_val.cc_clean # => 4444333322221111


## Links
* RubyGem: https://rubygems.org/gems/luhn_validation
* Download: https://rubygems.org/downloads/luhn_validation-1.0.0.gem
* Source: https://github.com/owenbyrne/luhn_validation
* Issue Tracking: https://github.com/owenbyrne/luhn_validation/issues