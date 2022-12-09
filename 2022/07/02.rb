#!/usr/bin/env ruby

# frozen_string_literal: true

input = File.read([File.dirname(__FILE__), 'input'].join('/')).split("\n")

dirs = {}
current_path = []
i = 0

loop do
  break if i >= input.size

  _, command, dir = input[i].split(' ')
  case command
  when 'cd'
    if dir == '..'
      current_path.pop
    else
      current_path << dir
    end

    dirs[current_path.join('/')] ||= 0
    i += 1
    next
  when 'ls'
    j = i + 1

    loop do
      if input[j].nil? || input[j][0] == '$'
        i = j
        break
      end

      size, = *input[j].split(' ')

      if size == 'dir'
        j += 1
        next
      end

      temp_current_path = current_path.dup
      loop do
        break if temp_current_path.empty?

        dirs[temp_current_path.join('/')] += size.to_i
        temp_current_path.pop
      end

      j += 1
    end
  end
end

total_size = dirs['/']
to_free = 30_000_000 - (70_000_000 - total_size)
p dirs.values.sort.find { |v| v > to_free }
