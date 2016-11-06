require 'sinatra/base'
require 'cgi'

class FakeQuickbooks::Server < Sinatra::Base
  
  get '/api/v1/connection/reconnect' do
    xml_response 200, 'access_token_200.xml'
  end

  post '/v3/company/:realm_id/account' do
    xml_response 200, 'account.xml'
  end

  get '/v3/company/:realm_id/account/:id' do
    xml_response 200, 'account.xml'
  end

  post '/v3/company/:realm_id/item' do
    xml_response 200, 'item.xml'
  end

  get '/v3/company/:realm_id/item/:id' do
    xml_response 200, 'item.xml'
  end

  post '/v3/company/:realm_id/customer' do
    xml_response 200, 'customer.xml'
  end

  get '/v3/company/:realm_id/customer/:id' do
    xml_response 200, 'customer.xml'
  end

  post '/v3/company/:realm_id/invoice' do
    xml_response 200, 'invoice.xml'
  end

  get '/v3/company/:realm_id/invoice/:id' do
    if params[:id] == 'paid'
      xml_response 200, 'invoice_paid.xml'
    else
      xml_response 200, 'invoice.xml'
    end
  end

  get '/v3/company/:realm_id/invoice/:id/pdf' do
    # xml_response 200, 'invoice.xml'
    send_file 'spec/support/test.pdf', :type => :pdf
  end

  post '/v3/company/:realm_id/invoice/:id/send' do
    xml_response 200, 'invoice.xml'
  end

  post '/v3/company/:realm_id/payment' do
    xml_response 200, 'payment.xml'
  end

  get '/v3/company/:realm_id/payment/:id' do
    xml_response 200, 'payment.xml'
  end

  post '/v3/company/:realm_id/refundreceipt' do
    xml_response 200, 'fetch_refund_receipt_by_id.xml'
  end

  get '/v3/company/:realm_id/payment/:id' do
    xml_response 200, 'payment.xml'
  end

  post '/v3/company/:realm_id/journalentry' do
    xml_response 200, 'journal_entry.xml'
  end

  get '/v3/company/:realm_id/journalentry/:id' do
    xml_response 200, 'journal_entry.xml'
  end

  get '/v3/company/:realm_id/:query' do
    if params["changedSince"]
      filename = 'invoices.xml'
    else
    	query = CGI::parse(request.env['QUERY_STRING'])['query'].first.gsub('SELECT * FROM ','')
      model_name = query.split.first.downcase
      model_name = 'journal_entry' if model_name == 'transfer'
  	  filename = "#{model_name}.xml"	
    end
    xml_response 200, filename
  end

  post '/v3/company/:realm_id/vendor' do
    xml_response 200, 'vendor.xml'
  end

  get '/v3/company/:realm_id/vendor/:id' do
    xml_response 200, 'vendor.xml'
  end

  post '/v3/company/:realm_id/bill' do
    xml_response 200, 'bill.xml'
  end

  get '/v3/company/:realm_id/bill/:id' do
    xml_response 200, 'bill.xml'
  end

  private

  def xml_response(response_code, file_name)
    content_type :xml
    status response_code
    path = File.expand_path("../fixtures/#{file_name}", __FILE__)
    File.open(path).read
  end
end