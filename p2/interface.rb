# frozen_string_literal: true

require_relative './main'
puts 'Введите ξ:'
epsilon = gets.to_f
puts 'Результат:'
puts "#{Iterator.calc_sum_emum(epsilon)}\n"
