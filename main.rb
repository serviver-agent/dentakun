require './src/calculator'

calc = Calculator.new

loop do
  begin
    ipt = gets
    if ipt == "exit\n"
      puts 'bye!👎'
      break
    end
    ipt.split.each do |token|
      if token.to_i.to_s == token
        puts calc.push_number(token.to_i).result
      else
        calc.push_op(token.to_sym)
      end
    end
    puts "計算結果: #{calc.result}"
  rescue StandardError => e
    puts e
  end
end
