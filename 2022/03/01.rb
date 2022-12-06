# frozen_string_literal: true

class String
  def first_half
    self[0, (size / 2.to_f).ceil]
  end

  def last_half
    self[(size / 2.to_f).ceil, size]
  end
end

input = File.read([File.dirname(__FILE__), 'input'].join('/')).split("\n")

priority = [*'a'..'z', *'A'..'Z'].each_with_index.each_with_object({}) do |(letter, ind), output|
  output[letter] = ind + 1
end

p input.map { |line|
  priority[
    (
      line.first_half.split('') & line.last_half.split('')
    ).first
  ]
}.sum
