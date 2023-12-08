#!/usr/bin/env ruby

# frozen_string_literal: true

input = File.read([File.dirname(__FILE__), 'input'].join('/'))

finish = [0, 0]
start_from = [0, 0]

map = []
dis = []

input.split("\n").each_with_index do |r, x|
  r.split('').each_with_index do |c, y|
    if c == 'S'
      start_from = [x, y]
      c = 'a'
    end

    if c == 'E'
      finish = [x, y]
      c = 'z'
    end

    (map[x] ||= []) << c.downcase.bytes.first
    (dis[x] ||= []) << 0
  end
end

queue = [finish]
max_x = map.size
max_y = map[0].size

queue.each do |point|
  neighbours = [
    [point[0] - 1, point[1]],
    [point[0] + 1, point[1]],
    [point[0], point[1] - 1],
    [point[0], point[1] + 1]
  ]

  loop do
    break if neighbours.empty?

    next_point = neighbours.pop

    if (next_point[0] < max_x && next_point[0] > -1 && next_point[1] < max_y && next_point[1] > -1) &&
        map[next_point[0]][next_point[1]] >= map[point[0]][point[1]] - 1 &&
        dis[next_point[0]][next_point[1]] == 0

        dis[next_point[0]][next_point[1]] = (dis[point[0]][point[1]] + 1)
        queue << next_point
    end
  end
end

p dis[start_from[0]][start_from[1]]