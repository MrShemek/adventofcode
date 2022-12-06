#!/usr/bin/env ruby

# frozen_string_literal: true

input = File.read([File.dirname(__FILE__), 'input'].join('/'))
stacks_initial_state, instructions = *input.split("\n\n")

stacks = Array.new(Array.new)

stacks_initial_state.split("\n").each do |row|
  i = 0
  stack_no = 0

  loop do
    break if i+2 > row.size

    crate = row[i..i+2]

    if crate[0] != "["
      i += 4
      stack_no += 1
      next
    end

    stacks[stack_no] ||= []
    stacks[stack_no] << crate[1]
    i += 4
    stack_no += 1
  end
end

stacks = stacks.map(&:reverse)

instructions.split("\n").each do |ins|
  n, from, to = *ins.match(/move (\d+) from (\d+) to (\d+)/)[1..].map(&:to_i)
  
  stacks[to-1] += stacks[from-1][(-1 * n)..]
  stacks[from-1] = stacks[from-1][0...(-1 * n)]
end

p stacks.map(&:last).join('')