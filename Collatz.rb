def collatz(n) 
  seq = []
  seq << n
  return seq if n == 1
  return seq + collatz(n/2) if n % 2 == 0
  return seq + collatz(3*n +1)
end

def collatz2(n)
  seq = []
  if n > 1 then
    while n > 1 
      seq << n
      if n % 2 == 0 then
        n = n/2
      else
        n = 3*n + 1
      end 
    end
  end
  seq << 1
  return seq
end

def longest_collatz(num)
  length_ary = [1]
  number_ary = [1]
  for i in 1..num do
    if collatz(i).length > length_ary.last then
      length_ary.push collatz(i).length 
      number_ary.push i
    else
      next
    end 
  end
  puts "#{number_ary.last} has the longest Collatz sequence with a length of #{length_ary.last}"
end

def longest_collatz2(num)
  length_ary = [1]
  number_ary = [1]
  for i in 1..num do
    if collatz2(i).length > length_ary.last then
      length_ary.push collatz2(i).length 
      number_ary.push i
    else
      next
    end 
  end
  puts "Between 1 and #{num}, #{number_ary.last} has the longest Collatz sequence with a length of #{length_ary.last}"
end
puts 'Collatz recursion:'
puts collatz(1).inspect
puts collatz(2).inspect
puts collatz(3).inspect
puts collatz(4).inspect
puts collatz(5).inspect
puts collatz(6).inspect
puts collatz(7).inspect
puts collatz(8).inspect
puts '-------'
puts 'Collatz loop:'
puts collatz2(1).inspect
puts collatz2(2).inspect
puts collatz2(3).inspect
puts collatz2(4).inspect
puts collatz2(5).inspect
puts collatz2(6).inspect
puts collatz2(7).inspect
puts collatz2(8).inspect

puts '-------'

longest_collatz2(1000000)

puts '-------'

# I wanted to test which version worked better. The loop works much better.
require 'benchmark'
num = 1000000000
Benchmark.bm do |x|
  x.report("Collatz recursion") { collatz(num) }
  x.report("Collatz loop")  { collatz2(num)  }
end