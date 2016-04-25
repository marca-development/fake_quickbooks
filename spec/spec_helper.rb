require 'bundler/setup'
Bundler.setup

require 'webmock'
require 'webmock/rspec'
require 'rest-client'
require 'fake_quickbooks'
require 'pry'

RSpec.configure do |config|

  config.before do
    WebMock.disable_net_connect!
    stub_request(:any, /sandbox-quickbooks.api.intuit.com/).to_rack(FakeQuickbooks::Server)
  end

end