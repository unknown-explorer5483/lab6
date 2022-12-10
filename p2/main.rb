# frozen_string_literal: true

# :reek:TooManyStatements

# class for interating sum with precision
class Iterator
  def self.calc_sum_elem(kpar)
    1.0 / (kpar * (kpar + 1))
  end

  def self.calc_sum_emum(epsilon)
    func = Enumerator.new do |difference|
      sum = prev_part_of_sum = calc_sum_elem(kpar = 1)
      loop do
        sum += part_of_sum = calc_sum_elem(kpar += 1)
        difference << [(prev_part_of_sum - part_of_sum), sum]
        prev_part_of_sum = part_of_sum
      end
    end
    func.find { |difference| difference[0] < epsilon }[1]
  end
end
