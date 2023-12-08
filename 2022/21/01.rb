#!/usr/bin/env ruby

# frozen_string_literal: true

input = File.read([File.dirname(__FILE__), 'input'].join('/')).split("\n")
operations = {}

input.each do |instruction|
  k, v = instruction.split(': ')
  if v =~ /\d+/
    define_method(k) { return v.to_i }
  else
    operations[k] = v
  end
end

loop do
  break if operations.empty?

  operations.each do |k, v|
    begin
      num = eval(v)
      define_method(k) { return num }
      operations.delete(k)
    rescue StandardError
    end
  end
end

p root