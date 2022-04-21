require 'api_helper'

describe 'List ratings' do
  it 'is successful' do
    header 'Content-Type', 'application/json;'
    get '/api/ratings'
    expect(last_response).must_be :ok?
    expect(last_response.content_type).must_include 'application/json'
  end

  it 'is empty by default' do
    header 'Content-Type', 'application/json;'
    get '/api/ratings'
    expect(last_response.body).must_equal '[]'
  end
end