#!/usr/bin/env ruby

# frozen_string_literal: true

input = File.read([File.dirname(__FILE__), 'input'].join('/')).split("\n")

register = [1]
cycles = [20, 60, 100, 140, 180, 220]

input.each do |line|
  command, value = *line.split(' ')

  case command
  when 'noop'
    register << register.last
  when 'addx'
    register += [register.last, register.last + value.to_i]
  end
end

p cycles.map { |i| register[i] * i }.sum
