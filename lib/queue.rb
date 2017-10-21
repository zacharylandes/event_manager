require_relative 'event_reporter'



class Queue

  attr_reader :queue, :count, :add

def initialize
  @queue = []
  @count = 0
end

def count
  @count+=1
  p @count
end

def add(row)
  @queue << row
end

def print
end

end
