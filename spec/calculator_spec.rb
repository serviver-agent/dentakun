# frozen_string_literal: true

require 'spec_helper'

require './src/calculator'

RSpec.describe Calculator do
  describe '#push_number' do
    it 'push_numberに数字を一つ食わせたあとにresult呼んだらその数字が取得できる' do
      calculator = described_class.new
      calculator.push_number(123)
      expect(calculator.result).to eq 123
    end

    it 'push_numberに数字じゃないものを食わせたらArgumentsErrorを出す' do
      calculator = described_class.new
      expect { calculator.push_number('123') }.to raise_error ArgumentError
    end
  end

  describe '#push_op' do
    it 'push_numberする前にpush_opすると例外を出す' do
      calculator = described_class.new
      expect { calculator.push_op(:+) }.to raise_error StandardError
    end

    it ':+を受け取ることができる' do
      calculator = Calculator.new
      calculator.push_number(123)
      expect(calculator.result).to eq 123
    end

    it '四則演算以外のシンボルを渡すとArgumentErrorを出す' do
      calculator = Calculator.new
      calculator.push_number(123)
      expect { calculator.push_op(:%) }.to raise_error ArgumentError
    end
  end

  describe '#result' do
    it 'resultはNumericなものが返ってくる' do
      calculator = described_class.new
      calculator.push_number(123)
      expect(calculator.result).to be_a Numeric
    end

    it 'push_numberしたあとresult呼んだらその数字が取得できる' do
      calculator = described_class.new
      calculator.push_number(123)
      expect(calculator.result).to eq 123
    end

    it 'push_numberとpush_opのあとにresult呼んだら最初にpush_numberした数字が取得できる' do
      calculator = described_class.new
      calculator.push_number(123)
      calculator.push_op(:+)
      expect(calculator.result).to eq 123
    end

    it '何も食わせずにresult呼んだら例外を出す' do
      expect { described_class.new.result }.to raise_error StandardError
    end
  end

  describe 'けつごー' do
    it '足し算ができる' do
      calculator = described_class.new
      calculator.push_number(1)
      calculator.push_op(:+)
      calculator.push_number(2)
      expect(calculator.result).to eq 3
    end
    it '引き算ができる' do
      calculator = described_class.new
      calculator.push_number(1)
      calculator.push_op(:-)
      calculator.push_number(2)
      expect(calculator.result).to eq(-1)
    end

    it '掛け算ができる' do
      calculator = described_class.new
      calculator.push_number(2)
      calculator.push_op(:*)
      calculator.push_number(3)
      expect(calculator.result).to eq 6
    end

    it '割り算ができる' do
      calculator = described_class.new
      calculator.push_number(3)
      calculator.push_op(:/)
      calculator.push_number(2)
      expect(calculator.result).to eq 1.5
    end

    it '1 + 2 + 3ができる' do
      calculator = described_class.new
      calculator.push_number(1)
      calculator.push_op(:+)
      calculator.push_number(2)
      calculator.push_op(:+)
      calculator.push_number(3)
      expect(calculator.result).to eq 6
    end

    it '1 + 2 * 3が左結合で処理される' do
      calculator = described_class.new
      calculator.push_number(1)
      calculator.push_op(:+)
      calculator.push_number(2)
      calculator.push_op(:*)
      calculator.push_number(3)
      expect(calculator.result).to eq 9
    end

    it 'メソッドチェーンで書ける' do
      calculator = described_class.new
      expect(calculator
        .push_number(1)
        .push_op(:+)
        .push_number(2)
        .push_op(:*)
        .push_number(3)
        .result).to eq 9
    end
  end
end
