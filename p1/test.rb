# frozen_string_literal: true

require_relative 'main'

RSpec.describe Iterator do
  context 'with normal epsilon' do
    it 'should give approximately correct result' do
      expect(Iterator.iterate_sum(0.00001)[0]).to be_within(0.1).of(1)
      expect(Iterator.iterate_sum(0.0000000001)[0]).to be_within(0.001).of(1)
    end
  end
end
