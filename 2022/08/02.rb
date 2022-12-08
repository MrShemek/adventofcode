#!/usr/bin/env ruby

# frozen_string_literal: true

input = File.read([File.dirname(__FILE__), 'input'].join('/')).split("\n")

trees_map = input.map { |line| line.split('').map(&:to_i) }
trees_map_transposed = trees_map.transpose

highest_score = 1
(1...trees_map.length - 1).each do |x|
  (1...trees_map.length - 1).each do |y|
    left = trees_map[x][0...y].reverse.find_index { |t| t >= trees_map[x][y] }
    left = left ? left + 1 : trees_map[0...y].size

    right = trees_map[x][y + 1..-1].find_index { |t| t >= trees_map[x][y] }
    right = right ? right + 1 : trees_map[y + 1..-1].size

    up = trees_map_transposed[y][0..x - 1].reverse.find_index { |t| t >= trees_map[x][y] }
    up = up ? up + 1 : trees_map_transposed[y][0..x - 1].size

    down = trees_map_transposed[y][x + 1..-1].find_index { |t| t >= trees_map[x][y] }
    down = down ? down + 1 : trees_map_transposed[y][x + 1..-1].size

    (left * right * up * down).tap do |local_score|
      highest_score = local_score if local_score > highest_score
    end
  end
end

p highest_score
