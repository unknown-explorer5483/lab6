# frozen_string_literal: true

# :reek:TooManyStatements
# :reek:DuplicateMethodCall

# class for interating sum with precision
class Iterator
  def self.calc_sum_elem(kpar)
    1.0 / (kpar * (kpar + 1))
  end

  def self.iterate_sum(epsilon)
    sum = prev_part_of_sum = calc_sum_elem(kpar = 1)
    iterations = 0
    
    sum += part_of_sum = calc_sum_elem(kpar += 1)
    until (prev_part_of_sum - part_of_sum) < epsilon

      iterations += 1
      prev_part_of_sum = part_of_sum
      sum += part_of_sum = calc_sum_elem(kpar += 1)
    end
    [sum, iterations]
  end
end
