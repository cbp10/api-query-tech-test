describe 'app' do 

  it "should return most sold" do
    # most_sold = Kernel.exec("ruby app.rb most_sold")
    most_sold = `ruby app.rb most_sold`
    expect(most_sold).to eq("\"Heavy Duty Concrete Watch\"\n")
  end

  it "should return total spend for specified user" do
    total_spend = `ruby app.rb total_spend kelley_paucek@jakubowski.biz`
    expect(total_spend).to eq("\"340.36\"\n")
  end

  it "should return most loyal user, who bought most items" do
    most_loyal = `ruby app.rb most_loyal`
    expect(most_loyal).to eq("\"travis_kshlerin@wunsch.net\"\n")
  end

end
