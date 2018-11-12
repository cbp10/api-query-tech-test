require 'api_call'

describe APICall do
  
  let(:subject) { described_class.new }

  it("should return items data") do
    stub = stub_request(:get, "http://driftrock-dev-test.herokuapp.com/purchases").
    to_return(
      body:  '{
        "data": [
          {
          "user_id": "12DF-2324-GA2D-31RT",
          "item": "Huge pineapple pizza",
          "spend": "19.99"
          },
          {
          "user_id": "12DF-2324-GA2D-31RT",
          "item": "A nice cup of tea",
          "spend": "2.99"
          }
        ]
      }')

  item_data = [{"item"=>"Huge pineapple pizza",
         "spend"=>"19.99",
         "user_id"=>"12DF-2324-GA2D-31RT"},
        {"item"=>"A nice cup of tea",
         "spend"=>"2.99",
         "user_id"=>"12DF-2324-GA2D-31RT"}]
    
    subject.get_items
    expect(stub).to have_been_requested.times(1)
    expect(subject.get_items).to eq(item_data)
  end

  it("should return users data") do
    stub = stub_request(:get, "http://driftrock-dev-test.herokuapp.com/users").
    to_return(
      body:  '{
        "data": [
          {
            "id": "12DF-2324-GA2D-31RT",
            "first_name": "Drift",
            "last_name": "Rock",
            "phone": "0-000-000-0000",
            "email": "drift.rock@email.com"
          }
        ]
      }')

  user_data = [{"email"=>"drift.rock@email.com",
        "first_name"=>"Drift",
        "id"=>"12DF-2324-GA2D-31RT",
        "last_name"=>"Rock",
        "phone"=>"0-000-000-0000"}]
    
    subject.get_users
    expect(stub).to have_been_requested.times(1)
    expect(subject.get_users).to eq(user_data)
  end

end