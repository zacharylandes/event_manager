require_relative 'test_helper'
require '../lib/queue'
require '../lib/event_reporter'

class QueueTest < Minitest::Test
def test_it_makes_a_queue_class

assert true, Queue.new
end

def test_it_can_count_the_queue
e= EventReporter.new
q= Queue.new
e.find("last_name","becker")
assert 3 , q.count
end

def test_it_can_run_queue_methods
q= Queue.new

assert 3 , q.run("count")
end

def test_it_can_add_to_the_queue
q= Queue.new
q.add("bums")
assert 1 , q.count
end

def test_it_can_print_the_queue
end

end
