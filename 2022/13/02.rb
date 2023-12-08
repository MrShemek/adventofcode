#!/usr/bin/env ruby

# frozen_string_literal: true

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

to_sort = File.read([File.dirname(__FILE__), 'input'].join('/')).split("\n").reject(&:empty?).map(&method(:eval))
to_sort << [[2]]
to_sort << [[6]]

sorted = to_sort.sort!(&method(:compare))
p (sorted.index([[2]]) + 1) * (sorted.index([[6]]) + 1)