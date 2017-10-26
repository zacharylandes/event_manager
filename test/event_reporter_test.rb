require_relative 'test_helper'
require './lib/event_reporter'
require './lib/queue'
# require './lib/full_event_attendees.csv'

class EventReporterTest < Minitest::Test

  def test_it_loads_CSV
    reporter = EventReporter.new

    assert_instance_of Array, reporter.load
  end

  def test_it_can_find_rows
    reporter = EventReporter.new
    reporter.load

    assert_equal "Allison",  reporter.find("first_name", "allison").first[:first_name]
    assert_equal "Becker" ,  reporter.find("last_name", "becker").first[:last_name]
    refute_equal "Becker" ,  reporter.find("last_name", "franklin").first[:last_name]
  end


  def test_it_can_make_a_queue
    reporter = EventReporter.new
    reporter.load


    assert_equal [],  reporter.make_queue.queue
  end

  def test_it_can_delete_queues
    reporter= EventReporter.new
    reporter.load

    assert_equal nil, reporter.delete_queue
  end

  def test_it_can_add_to_the_queue
    reporter = EventReporter.new
    reporter.load

    assert_equal ["asd"], reporter.add_to_queue("asd")
    assert_equal ["asd", 90909], reporter.add_to_queue(90909)
    refute_equal [90909], reporter.add_to_queue(90909)
  end

  def test_it_can_find_rows_by_first_name
    reporter = EventReporter.new
    reporter.load

    assert_equal "Zach",  reporter.find("first_name", "zach").first[:first_name]
    assert_equal "Allison", reporter.find("first_name", "allison").first[:first_name]
    refute_equal "jim", reporter.find("first_name", "allison").first[:first_name]
  end

  def test_it_can_find_rows_by_last_name
    reporter = EventReporter.new
    reporter.load

    assert_equal "Franklin",  reporter.find("last_name", "franklin").first[:last_name]
  end

  def test_it_can_find_rows_by_zipcode
    reporter = EventReporter.new
    reporter.load
    row = reporter.find("zipcode", "99362")
    row1 = reporter.find("zipcode", "03872")

    assert_equal "99362", row.first[7]
  end

  def test_it_can_find_rows_by_city
    reporter = EventReporter.new
    reporter.load

    assert_equal "new york", reporter.find("city", "new york").first[5]
    assert_equal "Superior", reporter.find("city", "superior").first[5]
  end

  def test_it_can_find_rows_by_phone
    reporter = EventReporter.new
    reporter.load

    assert_equal "7208911000", reporter.find("homephone", "7208911000").first[3]
  end

  def test_it_can_find_rows_by_address
    reporter = EventReporter.new
    reporter.load

    assert_equal "1995 E Coalton Rd 43-204", reporter.find("street", "1995 E Coalton Rd 43-204").first[4]
  end

  def test_it_can_find_rows_by_state
    reporter = EventReporter.new
    reporter.load

    assert_equal "NY", reporter.find("state", "ny").first[6]
    assert_equal "CA", reporter.find("state", "ca").first[6]
  end

  def test_it_can_match_attributes
    reporter1 = EventReporter.new
    reporter1.load
    row1 = {:first_name=>"jim"}
    reporter2 = EventReporter.new
    reporter2.load
    row2 = {:zipcode=>"99362"}
    reporter3 = EventReporter.new
    reporter3.load
    row3 = {:state=>"ca"}
    # reporter.load

    # assert_equal [{:first_name=>"jim"}], reporter1.match("first_name", ["jim"],row1)
    assert_equal [{:zipcode=>"99362"}], reporter2.match("zipcode", ["99362"],row2)
    assert_equal [{:state=>"ca"}], reporter3.match("state", ["ca"],row3)
  end


end
