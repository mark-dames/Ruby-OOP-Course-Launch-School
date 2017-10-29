class CircularQueue
  attr_reader :buffer_size
  attr_accessor :queue, :oldest_item, :recent_item

  def initialize(buffer_size)
    @buffer_size = buffer_size
    @queue = Array.new(buffer_size)
    @oldest_item = nil
    @recent_item = nil
  end

  def get_index(item)
    queue.index(item)
  end

  def enqueue(value)
    idx_oldest = get_index(oldest_item)
    idx_recent = get_index(recent_item)
    if queue.count(nil) == buffer_size
      queue[0] = value
      self.oldest_item = value
    elsif queue.count(nil) == 0
      queue[idx_oldest] = value
      self.oldest_item = idx_oldest + 1 < buffer_size ? queue[idx_oldest + 1] : queue[0]
    else
      if idx_recent + 1 < buffer_size && queue[idx_recent + 1] == nil
        queue[idx_recent + 1] = value
      else
        queue[0] = value
      end
    end
    self.recent_item = value
  end

  def dequeue
    idx_oldest = get_index(oldest_item)
    return nil if queue.count(nil) == buffer_size
    
    queue[idx_oldest] = nil
    return_object = oldest_item
    self.oldest_item = idx_oldest + 1 < buffer_size ? queue[idx_oldest + 1] : queue[0]
    return_object
  end
end


queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil
