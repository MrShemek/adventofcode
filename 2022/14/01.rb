#!/usr/bin/env ruby

# frozen_string_literal: true

input = File.read([File.dirname(__FILE__), 'input'].join('/'))

map = Array.new(12) { Array.new(12) { '.' } }

input.split("\n").each do |instruction|
  points = instruction.split(" -> ").map{|point| point.split(",").map(&:to_i) }.reverse

  start = points.pop

  loop do
    break if points.empty?

    next_point = points.pop

    Range.new(*[start[0], next_point[0]].sort).each do |y|
      Range.new(*[start[1], next_point[1]].sort).each do |x|
        map[x][y] = '#'
      end
    end

    start = next_point
  end
end

map.each{ |r| p r.join('') }

sp = [0, 8]
units = 0

loop do
  x = sp[0]
  y = sp[1]

  (0..10).each do |i|
    x += 1

    if map[x+1][y] == "."
      next
    end

    if map[x+1][y] == "#"
      break
    end

    if map[x+1][y] == "o"
      if map[x+1][y-1] == "."
        x += 1
        y -= 1
        break
      end

      if map[x+1][y+1] == "."
        x += 1
        y += 1
        break
      end

      x+= 1
      break
    end
  end

  map[x][y] = "o"

  units += 1

  break if units > 5
end

map.each{ |r| p r.join('') }