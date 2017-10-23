require_relative 'test_helper'
require '../lib/event_reporter'
# require '../lib/queue'

class EventReporterTest < Minitest::Test

def test_it_loads_CSV
  e = EventReporter.new
  e.load
  assert true
end

# def test_it_cleans_zipcodes
# e = EventReporter.new
#
# assert "00000", e.clean_zipcode(nil)
# end

def test_it_can_find_rows
  e = EventReporter.new

  assert_equal "Allison" ,  e.find("first_name", "allison").first[:first_name]
end

def test_it_shows_help_command
  e = EventReporter.new
  e.help

  assert_equal :print_all, e.help
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
e.find("first_name", "dani")

assert_equal 2, e.make_queue.count
end

def test_it_can_find_rows_by_first_name
  e = EventReporter.new


  assert_equal "Allison" ,  e.find("first_name", "allison").first[:first_name]
end
def test_it_can_find_rows_by_last_name
  e = EventReporter.new


  assert_equal "Franklin" ,  e.find("last_name", "franklin").first[:last_name]
end

# def test_it_can_find_rows_by_zipcode
#   e = EventReporter.new
#   p  e.find("zipcode", 94602).first[:zipcode]
#
#   assert_equal 2,  e.find("zipcode", 94602)[:zipcode]
# end
#

def test_it_can_find_rows_by_zipcode
row = '[#<CSV::Row :"669" regdate:"1/6/09 12:32" first_name:"Kate"
last_name:"Stevens" email_address:"fwnbfuller@jumpstartlab.com" homephone:
"603-520-2000" street:"232 Prescott road" city:"Epping" state:"NH" zipcode:
"3872">]'
  e = EventReporter.new

assert_equal "3872", e.find("zipcode", "3872").first[9]

end

def test_it_can_find_rows_by_city
  row = '#<CSV::Row :"5078" regdate:"2/2/09 1:03" first_name:"Amanda"
   last_name:"Cumberdale" email_address:"bmwvoicespgh@jumpstartlab.com"
   homephone:"7208911000" street:"1995 E Coalton Rd 43-204" city:"Superior"
    state:"CO" zipcode:"80027">'
    e = EventReporter.new


assert_equal "Superior", e.find("city", "superior").first[7]

end

def test_it_can_find_rows_by_phone
  row = '#<CSV::Row :"5078" regdate:"2/2/09 1:03" first_name:"Amanda"
   last_name:"Cumberdale" email_address:"bmwvoicespgh@jumpstartlab.com"
   homephone:"7208911000" street:"1995 E Coalton Rd 43-204" city:"Superior"
    state:"CO" zipcode:"80027">'
    e = EventReporter.new


assert_equal "7208911000", e.find("homephone", "7208911000").first[5]

end

def test_it_can_find_rows_by_address
  row = '#<CSV::Row :"5078" regdate:"2/2/09 1:03" first_name:"Amanda"
   last_name:"Cumberdale" email_address:"bmwvoicespgh@jumpstartlab.com"
   homephone:"7208911000" street:"1995 E Coalton Rd 43-204" city:"Superior"
    state:"CO" zipcode:"80027">'
    e = EventReporter.new

assert_equal "1995 E Coalton Rd 43-204", e.find("street", "1995 E Coalton Rd 43-204").first[6]

end


def test_it_can_find_rows_by_state
row = '[#<CSV::Row :"3400" regdate:"1/30/09 19:17" first_name:"Vianna"
last_name:"Lloyd" email_address:"tessiedewitt@jumpstartlab.com" homephone:
"5054406000" street:"456 N. 12th St. Apt. 9" city:"Laramie" state:"WY" zipcode:"82072">]'
e = EventReporter.new

assert row, e.find("state", "wy")
end


end
