# frozen_string_literal: true

input = File.read([File.dirname(__FILE__), 'input'].join('/')).split("\n")

pairs = {
  'A X' => 4,
  'A Y' => 8,
  'A Z' => 3,

  'B X' => 1,
  'B Y' => 5,
  'B Z' => 9,

  'C X' => 7,
  'C Y' => 2,
  'C Z' => 6
}

p input.map { |pair| pairs[pair] }.sum
