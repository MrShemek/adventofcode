# frozen_string_literal: true

input = File.read([File.dirname(__FILE__), 'input'].join('/')).split("\n")

priority = [*'a'..'z', *'A'..'Z'].each_with_index.each_with_object({}) do |(letter, ind), output|
  output[letter] = ind + 1
end

p input.each_slice(3).map { |group_of_three|
  priority[
    (
      group_of_three[0].split('') & group_of_three[1].split('') & group_of_three[2].split('')
    ).first
  ]
}.sum
