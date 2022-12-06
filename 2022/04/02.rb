#!/usr/bin/env ruby

# frozen_string_literal: true

input = File.read([File.dirname(__FILE__), 'input'].join('/')).split("\n")

p input.map { |pair|
  range1, range2 = *pair.split(',').map { |i| Range.new(*i.split('=').map(&:to_i)) }

  (range1.to_a & range2.to_a).any?
}.count(true)
