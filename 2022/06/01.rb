#!/usr/bin/env ruby

# frozen_string_literal: true

input = File.read([File.dirname(__FILE__), 'input'].join('/')).split('')

i = 0
loop do
  if input[i..i + 3].uniq.size == 4
    p i + 4
    break
  end

  i += 1
end
