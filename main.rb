require './src/calculator'

calc = Calculator.new

loop do
  begin
    puts '式を入力してください。'
    print '> '
    ipt = gets
    if ipt == "exit\n"
      puts 'bye!👎'
      break
    end
    ipt.split.each do |token|
      if token.to_i.to_s == token
        puts "途中経過: #{calc.push_number(token.to_i).result}"
      else
        calc.push_op(token.to_sym)
      end
    end
    puts "\n計算結果: #{calc.result}\n\n"
  rescue StandardError => e
    puts e
  end
end
