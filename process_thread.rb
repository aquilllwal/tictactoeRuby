# range = 0...10_000_000
# number = 8_888_888
# puts range.to_a.index(number)

# range1 = 0...5_000_000
# range2 = 5_000_000...10_000_000
# number = 8_888_888
# puts "Parent #{Process.pid}"
# fork { puts "Child1 #{Process.pid}: #{range1.to_a.index(number)}" }
# fork { puts "Child2 #{Process.pid}: #{range2.to_a.index(number)}" }
# Process.wait

require 'thread'
queue = Queue.new

producer = Thread.new do
  5.times do |i|
     sleep rand(i) # simulate expense
     queue << i
     puts "#{i} produced"
  end
end

consumer = Thread.new do
  5.times do |i|
     value = queue.pop
     sleep rand(i/2) # simulate expense
     puts "consumed #{value}"
  end
end

producer.join
consumer.join