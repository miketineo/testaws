require 'benchmark'

def bignumber(n)
  return 2 if n.zero? # base case
  return 1 if n == 1
  return instance_variable_get("@bignumber_#{n}") if instance_variable_get("@bignumber_#{n}")
  instance_variable_set("@bignumber_#{n}", ( bignumber(n-1) + bignumber(n-2) )) if n > 1
end

puts bignumber(150)

Benchmark.bm(10) do |x|
	   x.report("results(#{ARGV[0]} computation time: ") {$big = bignumber(ARGV[0].to_i)}
end

puts "bignumber(#{ARGV[0]}) = #{$big}"