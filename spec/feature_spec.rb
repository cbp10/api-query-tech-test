describe 'app' do 

  it "should return most sold" do
    # most_sold = Kernel.exec("ruby app.rb most_sold")
    most_sold = `ruby app.rb most_sold`
    expect(most_sold).to eq("\"Heavy Duty Concrete Watch\"\n")
  end
end
