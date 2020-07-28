# frozen_string_literal: true

class Calculator
  def push_number(n)
    raise ArgumentError unless n.is_a?(Numeric)

    if @ope.nil?
      @result = n
    else
      case @ope
      when :+
        @result += n
      when :-
        @result -= n
      when :*
        @result *= n
      when :/
        @result /= n.to_f
      end
    end
    @ope = nil
    self
  end

  def push_op(ope)
    raise ArgumentError unless %i[+ - * /].include?(ope)
    raise if @result.nil?

    @ope = ope
    self
  end

  def result
    raise if @result.nil?

    @result
  end
end
