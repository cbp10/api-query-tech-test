require 'question'

describe Question do
  items = [{"item"=>"Awesome Marble Clock"}]
  let(:apiCallDouble) {double :api_call, get_items: items}
  let(:subject) { described_class.new(apiCallDouble) }

  describe "most sold" do
    it "should return the most sold item from item data"  do
      expect(subject.most_sold).to eq "Awesome Marble Clock"
    end
  end
end
