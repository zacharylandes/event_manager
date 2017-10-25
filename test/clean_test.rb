require_relative 'test_helper'
require './lib/event_reporter'
require './lib/clean'
# require './lib/full_event_attendees.csv'

class CleanTest < Minitest::Test
  include Clean
    def test_it_can_clean_zipcodes
      assert_equal  "09922",  clean_zipcodes(9922)
    end

    def test_it_can_clean_phone_numbers
      assert_equal  "6154385000", clean_phone_numbers("615-438-5000")
    end

    def test_it_can_clean_input

      assert_equal "dani" , clean("first_name  ",["dani  "],0233)
    end

end
