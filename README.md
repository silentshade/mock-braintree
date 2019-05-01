# MockBraintree

## A library for mocking Braintree responses in your tests

###### This Gem is a work in progress and currently offers only a small amount of functionality - currently only `transaction.sale` calls with limited responses returned.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mock_braintree'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mock_braintree

## Usage

MockBraintree lets you test simple result handling just like Braintree responses:

```ruby
result = gateway.transaction.sale(nonce: 'fake-valid-nonce', amount: '10.00', options: { submit_for_settlement: true })

puts result.success?
puts result.transaction.status
puts result.transaction.amount
puts result.transaction.id
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/mock_braintree.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
