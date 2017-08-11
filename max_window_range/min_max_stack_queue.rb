class MinMaxStackQueue
  def initialize
    @stack_push = MyStack.new
    @stack_shift = MyStack.new
  end

  def enqueue(el)
    @stack_push.push(el)
  end

  def max
    [@stack_push.max, @stack_shift.max].compact.max
  end

  def min
    [@stack_push.min, @stack_shift.min].compact.min
  end

  def dequeue
    if @stack_shift.empty?
      until @stack_push.empty?
        el = @stack_push.pop
        @stack_shift.push(el) unless el.nil?
      end
    end
    @stack_shift.pop
  end

  def size
    @stack_push.size + @stack_shift.size
  end

  def empty?
    @stack_push.empty? && @stack_shift.empty?
  end

end

class MyQueue
  def initialize
    @store = []
  end

  def enqueue(el)
    @store.push(el)
  end

  def dequeue
    @store.shift
  end

  def peek
    @store.first
  end

  def size
    @store.count
  end

  def empty?
    @store.empty?
  end
end

class MyStack
  attr_reader :max, :min

  def initialize
    @store = []
    @max = nil
    @min = nil
  end

  def pop
    el = @store.pop
    @max = nil if empty?
    @min = nil if empty?
    el
  end

  def push(el)
    @store.push(el)
    @max = el if @max.nil?
    @min = el if @min.nil?
    @max = el if @max < el
    @min = el if @min > el
  end

  def peek
    @store.last
  end

  def size
    @store.count
  end

  def empty?
    @store.empty?
  end
end
