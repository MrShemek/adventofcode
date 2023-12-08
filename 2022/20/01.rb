#!/usr/bin/env ruby

# frozen_string_literal: true

input = File.read([File.dirname(__FILE__), 'input'].join('/')).split("\n").map(&:to_i)
i_size = input.size

input.each_with_index do |n, i|
  # output = output[0...(i + n) % i_size] + [ n ] + output[((i + n) % i_size)+1..]
  p output
end

p output