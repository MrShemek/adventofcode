#!/usr/bin/env ruby

# frozen_string_literal: true

input = File.read([File.dirname(__FILE__), 'input'].join('/')).split('')

i = 0
loop do
  if input[i..i + 13].uniq.size == 14
    p i + 14
    break
  end

  i += 1
end
