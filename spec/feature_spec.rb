describe 'app' do 

  it "should return most sold item" do
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

  it "should return command not recognised message for unknown question" do
    question = `ruby app.rb qwret`
    expect(question).to eq("\"command not recognised\"\n")
  end

end
