require './lib/question'
class App

  question = Question.new

  command, argument = ARGV

  case command
  when "most_sold"
    question.most_sold
  when "total_spend"
    p "total spend"
  when "most_loyal"
    p "most_loyal"
  else
    p "command not recognised"
  end

end