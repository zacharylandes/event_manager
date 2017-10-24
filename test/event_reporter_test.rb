require_relative 'test_helper'
require './lib/event_reporter'
require './lib/queue'
# require './lib/full_event_attendees.csv'

class EventReporterTest < Minitest::Test

  def test_it_loads_CSV
    # skip
    reporter = EventReporter.new

    assert_instance_of CSV , reporter.load
  end

  def test_it_can_find_rows
    # skip
    reporter = EventReporter.new

    assert_equal "Allison",  reporter.find("first_name", "allison").first[:first_name]
    assert_equal "Becker" ,  reporter.find("last_name", "becker").first[:last_name]
    refute_equal "Becker" ,  reporter.find("last_name", "franklin").first[:last_name]
  end

  def test_it_can_clean_zipcodes
    # skip
    reporter = EventReporter.new

    assert_equal  "02234",  reporter.clean_zipcodes(2234)
  end

  def test_it_can_clean_phone_numbers
    # skip
    reporter = EventReporter.new
    number = reporter.find("first_name", "allison").first

    assert_equal  "6154385000",  reporter.clean_phone_numbers(number)
  end

  def test_it_shows_help_command
    # skip
    reporter = EventReporter.new
    command = "QUEUE EXPORT HTML - Generates html file displaying CSV fields"

    assert_equal command, reporter.help.last
  end

  def test_it_can_make_a_queue
    # skip
    reporter = EventReporter.new

    assert_equal [],  reporter.make_queue.queue
  end

  def test_it_can_delete_queues
    # skip
    reporter= EventReporter.new

    assert_equal nil, reporter.delete_queue
  end

  def test_it_can_add_to_the_queue
    # skip
    reporter = EventReporter.new

    assert_equal ["asd"], reporter.add_to_queue("asd")
    assert_equal ["asd", 90909], reporter.add_to_queue(90909)
    refute_equal [90909], reporter.add_to_queue(90909)
  end

  def test_it_can_find_rows_by_first_name
    # skip
    reporter = EventReporter.new

    assert_equal "Zach",  reporter.find("first_name", "zach").first[:first_name]
    assert_equal "Allison", reporter.find("first_name", "allison").first[:first_name]
    refute_equal "jim", reporter.find("first_name", "allison").first[:first_name]

  end

  def test_it_can_find_rows_by_last_name
    # skip
    reporter = EventReporter.new

    assert_equal "Franklin",  reporter.find("last_name", "franklin").first[:last_name]
  end

  def test_it_can_find_rows_by_zipcode
    # skip
    reporter = EventReporter.new
    row = reporter.find("zipcode", "99362")
    row1 = reporter.find("zipcode", "03872")
    # binding.pry

    assert_equal "99362", row.first[9]
    # assert_equal "03872", row1.first[9]
  end

  def test_it_can_find_rows_by_city
    # skip
    reporter = EventReporter.new

    assert_equal "new york", reporter.find("city", "new york").first[7]
    assert_equal "Superior", reporter.find("city", "superior").first[7]
  end

  def test_it_can_find_rows_by_phone
    # skip
    reporter = EventReporter.new

    assert_equal "7208911000", reporter.find("homephone", "7208911000").first[5]
  end

  def test_it_can_find_rows_by_address
    # skip
    reporter = EventReporter.new

    assert_equal "1995 E Coalton Rd 43-204", reporter.find("street", "1995 E Coalton Rd 43-204").first[6]
  end

  def test_it_can_find_rows_by_state
    # skip
    reporter = EventReporter.new

    assert_equal "NY", reporter.find("state", "ny").first[8]
    assert_equal "CA", reporter.find("state", "ca").first[8]
  end

  def test_it_can_match_attributes
    reporter1 = EventReporter.new
    row1 = {:first_name=>"jim"}
    reporter2 = EventReporter.new
    row2 = {:zipcode=>"99362"}
    reporter3 = EventReporter.new
    row3 = {:state=>"ca"}

    assert_equal [{:first_name=>"jim"}], reporter1.match("first_name", "jim",row1)
    assert_equal [{:zipcode=>"99362"}], reporter2.match("zipcode", "99362",row2)
    assert_equal [{:state=>"ca"}], reporter3.match("state", "ca",row3)
  end


end
