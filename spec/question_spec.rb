require 'question'

describe Question do
  items = [{"item"=>"Awesome Marble Clock","user_id"=>"1","spend"=>"100.00"}]
  users =[{"id"=>"1","email"=>"user_email"}]
  let(:apiCallDouble) {double :api_call, get_items: items, get_users: users}
  let(:subject) { described_class.new(apiCallDouble) }

  describe "most sold" do
    it "should return the most sold item from item data"  do
      expect(subject.most_sold).to eq "Awesome Marble Clock"
    end
  end

  describe "total spend" do
    it "should return the total spend of a specifed user email"  do
      expect(subject.total_spend("user_email")).to eq "100.00"
    end
  end

  describe "most loyal" do
    it "should return the most loyal user"  do
      expect(subject.most_loyal).to eq "user_email"
    end
  end

end
