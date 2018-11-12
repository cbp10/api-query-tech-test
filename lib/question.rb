require_relative 'api_call'
class Question

  def initialize(api_call = APICall.new)
    @items_data = api_call.get_items
    @users_data = api_call.get_users
  end

  def most_sold
    items_array = get_data_by_key(@items_data, 'item')
    items_count = count_data(items_array)
    p largest_hash_key(items_count)
  end

  def total_spend(email)
    user_data = select_data_by_value(@users_data, 'email', email)
    user_id = get_data_by_key(user_data, 'id')[0]

    user_items_array = select_data_by_value(@items_data, 'user_id', user_id)
    spend_array = get_data_by_key(user_items_array, 'spend')
    total = spend_array.inject(0){ |sum, spend| sum + spend.to_f }
    p '%.2f' % total
  end

  def most_loyal
    users_id_array = get_data_by_key(@items_data, 'user_id')
    users_count = count_data(users_id_array)
    user_id = largest_hash_key(users_count)

    user_data = select_data_by_value(@users_data, 'id', user_id)
    user = get_data_by_key(user_data, 'email')[0]
    p user
  end

  private
  
  def get_data_by_key(json_data, key)
    json_data.map { |data| data[key] }
  end

  def count_data(array)
    data_hash = {}
    array.each { |data| 
      data_hash[data] == nil ? count = 1 : count = data_hash[data] + 1
      data_hash[data] = count
    }
    data_hash
  end

  def largest_hash_key(hash)
    hash.max_by { |k, v| v }[0]
  end

  def select_data_by_value(json_data, key, value)
    json_data.map { |data| data if data[key] == value }.reject(&:nil?)   
  end
end
