# frozen_string_literal: true

require_relative './main'
puts 'Введите левую границу диапазона:'
a = gets.to_f
puts 'Введите правую границу диапазона:'
b = gets.to_f
puts 'Введите порядковый номер уравнения:'
puts '1. x^2 + sin(x / 2) = 0'
puts '2. arctg(x) + x = 1'
number = gets.to_i
lambda_eq = if number == 1
              ->(x) { x**2 + Math.sin(x / 2.0) }
            else
              ->(x) { Math.atan(x) + x - 1 }
            end
puts 'Результат:'
puts "#{Root.find_min_root_lambda(a, b, lambda_eq)}\n"
if number == 1
  puts "#{Root.find_min_root_block(a, b) { |x| x**2 + Math.sin(x / 2.0) }}\n"
else
  puts "#{Root.find_min_root_block(a, b) { |x| Math.atan(x) + x - 1 }}\n"
end
