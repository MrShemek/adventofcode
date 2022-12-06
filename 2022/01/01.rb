input = File.read([File.dirname(__FILE__), "input"].join("/"))

p input.split("\n\n").map { |inner| inner.split("\n").map(&:to_i).sum }.max