#!/usr/bin/env ruby

# frozen_string_literal: true

require 'set'

input = File.read([File.dirname(__FILE__), 'input'].join('/'))

visited_by_tail = Set.new
knots = []
10.times { knots << [0, 0] }

input.split("\n").each do |instruction|
  direction, steps = *instruction.split(' ')

  steps.to_i.times do
    case direction
    when 'R'
      knots[0][1] += 1
    when 'L'
      knots[0][1] -= 1
    when 'D'
      knots[0][0] += 1
    when 'U'
      knots[0][0] -= 1
    end

    i = 1
    loop do
      break if i >= knots.size

      head = knots[i - 1]
      tail = knots[i]

      dx = head[0] - tail[0]
      dy = head[1] - tail[1]

      if dx.abs > 1 || dy.abs > 1
        tail[0] += dx.zero? ? 0 : dx / dx.abs
        tail[1] += dy.zero? ? 0 : dy / dy.abs
      end

      i += 1
    end

    visited_by_tail << knots.last.dup
  end
end

p visited_by_tail.size
