
class Queue

  attr_accessor  :queue,
                 :count,
                 :run

def initialize
  @queue = []
  # @count = 0
end

def run(method)
  case method
  when "count"
      count
  when "clear"
    clear
  when "print"
    qprint
  when "print by"
    qprint_by
  when "save to"
    save_to
  when "export html"
    export
  end

end

def add(row)
  @queue << row
  p @queue
end

def count
p   @queue.count
end
#
# def add(row)
#   @queue << row
# end

def print
end

end
