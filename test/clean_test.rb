require_relative 'test_helper'
require './lib/event_reporter'
require './lib/clean'
# require './lib/full_event_attendees.csv'

class CleanTest < Minitest::Test
  include Clean
  def test_it_can_clean_zipcodes
    assert_equal  "09922",  clean_zipcodes(9922)
  end


  def test_it_can_clean_input

    assert_equal "dani" , clean_rows("first_name  ",["dani  "],[:regdate, "0233"])
  end

end
