#!/usr/bin/env ruby

# frozen_string_literal: true

input = File.read([File.dirname(__FILE__), 'input'].join('/')).split("\n\n")

class Monkey
  attr_accessor :items, :examined

  def initialize(items:, operation:, reduce:, divisible:, true_destination:, false_destination:)
    @examined = 0
    @operation = operation
    @reduce = reduce
    @divisible = divisible
    @true_destination = true_destination
    @false_destination = false_destination
    @items = items
  end

  def call(monkeys)
    loop do
      break if items.empty?

      item = items.pop
      @examined += 1
      
      item = @operation.call(item).then { |item| @reduce.call(item) }

      if item % @divisible == 0
        monkeys[@true_destination].items << item
      else
        monkeys[@false_destination].items << item
      end
    end
  end
end

monkeys = []

input.each do |monkey_block|
  monkey_desc = monkey_block.split("\n")
  monkeys << Monkey.new(
    items: monkey_desc[1][18..].split(', ').map(&:to_i),
    operation: proc { |old| eval(monkey_desc[2].split(" = ").last.gsub("old", "#{old}")) },
    reduce: proc { |item| item / 3 },
    divisible: monkey_desc[3].split(' ').last.to_i,
    true_destination: monkey_desc[4].split(' ').last.to_i,
    false_destination: monkey_desc[5].split(' ').last.to_i
  )
end

20.times do
  monkeys.each do |monkey|
    monkey.call(monkeys)
  end
end

p monkeys.map(&:examined).sort.last(2).reduce(:*)

