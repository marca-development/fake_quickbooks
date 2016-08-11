# FakeQuickbooks

Provides a FakeQuickbooks

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'fake_quickbooks', git: 'https://git.cratebind.com/open-source/fake_quickbooks.git'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fake_quickbooks

## Usage

Add the following to your rails_helper.rb where you have your webmock stub requests:

```
    # Quickbooks API
    stub_request(:any, /sandbox-quickbooks.api.intuit.com/).to_rack(FakeQuickbooks::Server)
    stub_request(:any, /.*appcenter.intuit.com.*/).to_rack(FakeQuickbooks::Server)
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/fake_quickbooks/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
