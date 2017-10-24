require_relative 'test_helper'
require './lib/event_reporter'
require './lib/queue'
# require './lib/full_event_attendees.csv'

class EventReporterTest < Minitest::Test

def test_it_loads_CSV
  e = EventReporter.new
  e.load
  assert true
end


def test_it_can_find_rows
  e = EventReporter.new

  assert_equal "Allison" ,  e.find("first_name", "allison").first[:first_name]
end

def test_it_shows_help_command
  e = EventReporter.new
  command = "QUEUE SAVE_TO - Prints all the items in the queue"


  assert_equal command, e.help.last
end

def test_it_can_make_a_queue
  e = EventReporter.new

  assert_equal [] ,  e.make_queue.queue
end

def test_it_can_delete_queues
e= EventReporter.new

assert_equal nil, e.delete_queue
end

def test_it_can_add_to_the_queue
e = EventReporter.new
# e.find("first_name", "dani")
# row = "sin"#< :  "1" regdate:"11/12/08 10:47" first_name:"Allison" last_name:"Nguyen" email_address:"arannon@jumpstartlab.com" homephone:"6154385000" street:"3155 19th St NW" city:"Washington" state:"DC" zipcode:"20010">

assert_equal ["asd"], e.add_to_queue("asd")
end

def test_it_can_find_rows_by_first_name
  e = EventReporter.new


  assert_equal "Allison" ,  e.find("first_name", "allison").first[:first_name]
end
def test_it_can_find_rows_by_last_name
  e = EventReporter.new


  assert_equal "Franklin" ,  e.find("last_name", "franklin").first[:last_name]
end

def test_it_can_find_rows_by_zipcode

  e = EventReporter.new

assert_equal "03872", e.find("zipcode", "03872").first[9]

end

def test_it_can_find_rows_by_city

    e = EventReporter.new


assert_equal "Superior", e.find("city", "superior").first[7]

end

def test_it_can_find_rows_by_phone
    e = EventReporter.new


assert_equal "7208911000", e.find("homephone", "7208911000").first[5]

end

def test_it_can_find_rows_by_address
    e = EventReporter.new

assert_equal "1995 E Coalton Rd 43-204", e.find("street", "1995 E Coalton Rd 43-204").first[6]

end



end
