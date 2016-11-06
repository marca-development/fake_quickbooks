require 'spec_helper'
describe FakeQuickbooks::Server do
  
	it 'should be able to stub a request' do
		url = "https://sandbox-quickbooks.api.intuit.com/v3/company/1402547300/account/1"
		res = RestClient.get(url)
		expect(res.code).to eq(200)
	end
  
	it 'should be able to stub a vendor request' do
		url = "https://sandbox-quickbooks.api.intuit.com/v3/company/1402547300/vendor/1"
		res = RestClient.get(url)
		expect(res.code).to eq(200)
	end

	it 'should be able to stub a vendor request' do
		url = "https://sandbox-quickbooks.api.intuit.com/v3/company/1402547300/vendor"
		res = RestClient.post(url, {})
		expect(res.code).to eq(200)
	end

end