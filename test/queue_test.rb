require_relative 'test_helper'
require './lib/queue'
require './lib/event_reporter'
require 'pry'

class QueueTest < Minitest::Test

def test_it_makes_a_queue_class
  assert_instance_of Queue, Queue.new
end

def test_it_can_auto_run_queue_methods
q= Queue.new
q.add("bums")
q.add("more_bums")


assert_equal 2 ,
end

def test_it_can_add_to_the_queue
q= Queue.new
q.add("bums")
q.add("more_bums")

assert_equal ["bums", "more_bums", "more_bums"] , q.add("more_bums")
end

def test_it_can_count_the_queue
q= Queue.new
q.add("bums")
q.add("more_bums")


assert_equal 2, q.queue.count
end


def test_it_can_print_the_queue


end

end
