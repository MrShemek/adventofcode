#!/usr/bin/env ruby

# frozen_string_literal: true

pairs = File.read([File.dirname(__FILE__), 'input'].join('/')).split("\n\n")

def compare(x,y)
  case [x, y]
  in [Integer, Integer]
    x <=> y
  in [Array, Array]
    (0...[x.size, y.size].min).each do |i|
      rr = compare(x[i], y[i])
      return rr if rr != 0
    end
    x.size <=> y.size
  else
    compare([x].flatten(1), [y].flatten(1))
  end
end

pairs.each_with_index do |pair, ii|
  a, b = *pair.split("\n").map(&method(:eval))

  r << ii+1 if compare(a,b) < 0
end

p r.sum
