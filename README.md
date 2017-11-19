# Kudzu::Adapter::ActiveRecord

ActiveRecord adapter for kudzu crawler.

## Dependencies

* kudzu 1.0+
* activerecord 5.0+

## Installation

Add to your application's Gemfile:

```ruby
gem 'kudzu-adapter-active_record'
```

Then run:

    $ bundle install

Create migration files:

    $ rails generate kudzu:adapter:active_record:migration

Migrate into your application:

    $ bundle exec rake db:migrate

This migration creates following tables:

* kudzu_pages
* kudzu_contents
* kudzu_links

## Usage

Basic usage is same as [kudzu gem](https://github.com/kanety/kudzu).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kanety/kudzu-adapter-active_record. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
