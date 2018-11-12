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

  def total_spend(email)
    users_data = @api_call.get_users
    user_data = select_data_by_value(users_data, 'email', email)
    user_id = get_data_by_key(user_data, 'id')[0]

    items_data = @api_call.get_items
    user_items_array = select_data_by_value(items_data, 'user_id', user_id)
    spend_array = get_data_by_key(user_items_array, 'spend')
    total = spend_array.inject(0){ |sum, x| sum + x.to_f }
    p '%.2f' % total
  end

  def most_loyal
    items_data = @api_call.get_items
    items_array = get_data_by_key(items_data, 'user_id')
    items_hash = count_data(items_array)
    user_id = largest_hash_key(items_hash)

    users_data = @api_call.get_users
    user_data = select_data_by_value(users_data, 'id', user_id)
    user = get_data_by_key(user_data, 'email')
    p user[0]
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

  def select_data_by_value(json_data, key, value)
    data_array = []
    json_data.each { |data| 
      data_array.push(data) if data[key] == value 
      }
    data_array 
  end
end
