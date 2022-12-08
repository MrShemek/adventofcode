#!/usr/bin/env ruby

# frozen_string_literal: true

input = File.read([File.dirname(__FILE__), 'input'].join('/')).split("\n")

trees_map = input.map { |line| line.split('').map(&:to_i) }
trees_map_transposed = trees_map.transpose

visible = (trees_map.size - 1) * 4
(1...trees_map.length - 1).each do |x|
  (1...trees_map.length - 1).each do |y|
    left = trees_map[x][0...y].max < trees_map[x][y]
    right = trees_map[x][y + 1..-1].max < trees_map[x][y]
    up = trees_map_transposed[y][0..x - 1].max < trees_map[x][y]
    down = trees_map_transposed[y][x + 1..-1].max < trees_map[x][y]
    next unless up || down || left || right

    visible += 1
  end
end

p visible
