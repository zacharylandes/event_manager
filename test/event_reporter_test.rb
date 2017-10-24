require_relative 'test_helper'
require './lib/event_reporter'
require './lib/queue'
# require './lib/full_event_attendees.csv'

class EventReporterTest < Minitest::Test

  def test_it_loads_CSV
    reporter = EventReporter.new

    assert_instance_of CSV , reporter.load
  end

  def test_it_can_find_rows
    reporter = EventReporter.new

    assert_equal "Allison",  reporter.find("first_name", "allison").first[:first_name]
    assert_equal "Becker" ,  reporter.find("last_name", "becker").first[:last_name]
    refute_equal "Becker" ,  reporter.find("last_name", "franklin").first[:last_name]
  end

  def test_it_can_clean_zipcodes
    reporter = EventReporter.new
    zip = reporter.find("first_name", "allison").first

    assert_equal  "20010",  reporter.clean_zipcodes(zip)
  end

  def test_it_can_clean_phone_numbers
      reporter = EventReporter.new
      number = reporter.find("first_name", "allison").first

      assert_equal  "6154385000",  reporter.clean_phone_numbers(number)
  end

  def test_it_shows_help_command
    reporter = EventReporter.new
    command = "QUEUE SAVE_TO - Prints all the items in the queue"

    assert_equal command, reporter.help.last
  end

  def test_it_can_make_a_queue
    reporter = EventReporter.new

    assert_equal [],  reporter.make_queue.queue
  end

  def test_it_can_delete_queues
    reporter= EventReporter.new

    assert_equal nil, reporter.delete_queue
  end

  def test_it_can_add_to_the_queue
    reporter = EventReporter.new

    assert_equal ["asd"], reporter.add_to_queue("asd")
    assert_equal ["asd", 90909], reporter.add_to_queue(90909)
    refute_equal [90909], reporter.add_to_queue(90909)

  end

  def test_it_can_find_rows_by_first_name
    reporter = EventReporter.new

    assert_equal "Zach",  reporter.find("first_name", "zach").first[:first_name]
    assert_equal "Allison", reporter.find("first_name", "allison").first[:first_name]
    refute_equal "jim", reporter.find("first_name", "allison").first[:first_name]

  end

  def test_it_can_find_rows_by_last_name
    reporter = EventReporter.new

    assert_equal "Franklin",  reporter.find("last_name", "franklin").first[:last_name]
  end

  def test_it_can_find_rows_by_zipcode

    reporter = EventReporter.new

    assert_equal "99362", reporter.find("zipcode", "99362").first[9]
    assert_equal "03872", reporter.find("zipcode", "03872").first[9]

  end

  def test_it_can_find_rows_by_city
    reporter = EventReporter.new

    assert_equal "new york", reporter.find("city", "new york").first[7]
    assert_equal "Superior", reporter.find("city", "superior").first[7]
  end

  def test_it_can_find_rows_by_phone
    reporter = EventReporter.new

    assert_equal "7208911000", reporter.find("homephone", "7208911000").first[5]
  end

  def test_it_can_find_rows_by_address
    reporter = EventReporter.new

    assert_equal "1995 E Coalton Rd 43-204", reporter.find("street", "1995 E Coalton Rd 43-204").first[6]
  end

  def test_it_can_find_rows_by_state
    reporter = EventReporter.new

    assert_equal "NY", reporter.find("state", "ny").first[8]
    assert_equal "CA", reporter.find("state", "ca").first[8]
  end

  def test_it_can_match_attributes
    skip

    reporter = EventReporter.new

    assert_equal "aasd", reporter.match("first_name", "jim","")
  end


end
