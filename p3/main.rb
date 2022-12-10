# frozen_string_literal: true

# :reek:TooManyStatements

# class for calculating minimal root of function
class Root
  def self.find_min_root_lambda(left_lim, right_lim, equation)
    cur_res = equation.call(iterator = left_lim)
    loop do
      prev_res = cur_res
      cur_res = equation.call(iterator += 0.05)
      return nil if iterator > right_lim

      cur_res_abs = cur_res.abs
      prev_res_abs = prev_res.abs
      break if (prev_res_abs < cur_res_abs) && (cur_res_abs < 0.1)
    end
    iterator - 0.05
  end

  def self.find_min_root_block(left_lim, right_lim)
    cur_res = yield(iterator = left_lim)
    loop do
      prev_res = cur_res
      cur_res = yield(iterator += 0.05)
      return nil if iterator > right_lim

      cur_res_abs = cur_res.abs
      prev_res_abs = prev_res.abs
      break if (prev_res_abs < cur_res_abs) && (cur_res_abs < 0.1)
    end
    iterator - 0.05
  end
end
