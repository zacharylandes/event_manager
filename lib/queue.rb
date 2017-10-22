
class Queue

  attr_accessor  :queue,
                #  :count,
                 :run

def initialize
  @queue = []
  # @count = 0
end

def run(method)
  if method == "count"
      count
  end
end

def add(row)
  @queue << row
  p @queue
end

def count
  # @count+=1
  p @queue.count
end
#
# def add(row)
#   @queue << row
# end

def print
end

end
