#!/usr/bin/env ruby

# frozen_string_literal: true

require 'set'

input = File.read([File.dirname(__FILE__), 'input'].join('/'))

visited_by_tail = Set.new

head = [0, 0]
tail = [0, 0]

input.split("\n").each do |instruction|
  direction, steps = *instruction.split(' ')

  steps.to_i.times do
    case direction
    when 'R'
      head[1] += 1
    when 'L'
      head[1] -= 1
    when 'D'
      head[0] += 1
    when 'U'
      head[0] -= 1
    end

    dx = head[0] - tail[0]
    dy = head[1] - tail[1]

    if dx.abs > 1 || dy.abs > 1
      tail[0] += dx.zero? ? 0 : dx / dx.abs
      tail[1] += dy.zero? ? 0 : dy / dy.abs
    end

    visited_by_tail << [tail[0], tail[1]]
  end
end

p visited_by_tail.size
