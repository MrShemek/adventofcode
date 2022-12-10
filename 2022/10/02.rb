#!/usr/bin/env ruby

# frozen_string_literal: true

input = File.read([File.dirname(__FILE__), 'input'].join('/')).split("\n")

def draw(iteration, register, sprite)
  x, y = iteration / 40, iteration % 40
  last_value = register.last
  sprite[x][y] = '#' if (last_value - 1..last_value + 1).include?(y)
end

register = [1]
sprite = Array.new(6) { Array.new(40) { ' ' } }
i = 0

input.each do |line|
  command, value = *line.split(' ')

  case command
  when 'noop'
    draw(i, register, sprite)
    register << register.last
    i += 1
  when 'addx'
    draw(i, register, sprite)
    register << register.last
    i += 1

    draw(i, register, sprite)
    register << (register.last + value.to_i)
    i += 1
  end
end

sprite.each { |row| p row.join('') }
