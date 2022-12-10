# frozen_string_literal: true

require_relative 'main'

RSpec.describe Root do
  context 'with normal equation' do
    it 'should give approximately correct result' do
      equation_sin = ->(x) { x**2 + Math.sin(x / 2.0) }
      equation_arctg = ->(x) { Math.atan(x) + x - 1 }
      expect(Root.find_min_root_lambda(-10, 10, equation_sin)).to be_within(0.1).of(-0.495)
      expect(Root.find_min_root_block(-0.2, 10) { |x| x**2 + Math.sin(x / 2.0) }).to be_within(0.1).of(0)
      expect(Root.find_min_root_lambda(-10, 10, equation_arctg)).to be_within(0.1).of(0.52)
      expect(Root.find_min_root_block(0, 10) { |x| Math.atan(x) + x - 1 }).to be_within(0.1).of(0.52)
    end
    it 'should give nil' do
      equation_sin = ->(x) { x**2 + Math.sin(x / 2.0) }

      expect(Root.find_min_root_lambda(5, 10, equation_sin)).to be_nil
      expect(Root.find_min_root_block(-100, -10) { |x| Math.atan(x) + x - 1 }).to be_nil
    end
  end
end
