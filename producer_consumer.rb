q = Queue.new
capacity = 2

consumer = Thread.new do
    5.times do
        sleep(2)
        puts "consumed: #{q.deq}" if q.size > 0
    end
end

producer = Thread.new do
    5.times do |i|
        # puts "produced"
        q << i if q.size < capacity
        puts "produced #{i}"
        sleep(2)
    end
end


producer.join
consumer.join