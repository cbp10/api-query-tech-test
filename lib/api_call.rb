require 'net/http'
require 'json'

class APICall

  def get_items
    get_data('http://driftrock-dev-test.herokuapp.com/purchases')
  end

  def get_users
    get_data('http://driftrock-dev-test.herokuapp.com/users')
  end
  
  private

  def get_data(url)
    res_body = api_response(url).body
    parse_body(res_body)['data']
  end

  def api_response(url)
    Net::HTTP.get_response(URI.parse(url))
  end

  def parse_body(body)
    JSON.parse(body)
  end

end