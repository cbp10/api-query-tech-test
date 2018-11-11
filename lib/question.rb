require_relative 'api_call'
class Question

  def initialize(api_call = APICall.new)
    @api_call = api_call
  end

  def most_sold
    items_data = @api_call.get_items
    items_array = get_data_by_key(items_data, 'item')
    items_hash = count_data(items_array)
    p largest_hash_key(items_hash)
  end

  private
  
  def get_data_by_key(json_data, key)
    data_array = []
    json_data.each { |data|
      data_array.push(data[key])
    }
    data_array
  end

  def count_data(array)
    data_hash = {}
    array.each { |data| 
      if data_hash[data] == nil
        count = 1
      else
        count = data_hash[data] + 1
      end
      data_hash[data] = count
    }
    data_hash
  end

  def largest_hash_key(hash)
    hash.max_by { |k, v| v }[0]
  end

end
