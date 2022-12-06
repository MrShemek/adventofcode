# frozen_string_literal: true

input = File.read([File.dirname(__FILE__), 'input'].join('/')).split("\n")

pairs = {
  'A X' => 3,
  'A Y' => 4,
  'A Z' => 8,

  'B X' => 1,
  'B Y' => 5,
  'B Z' => 9,

  'C X' => 2,
  'C Y' => 6,
  'C Z' => 7
}

p input.map { |pair| pairs[pair] }.sum
