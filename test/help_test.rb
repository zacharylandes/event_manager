require_relative 'test_helper'
require './lib/queue'
require './lib/event_reporter'
require 'pry'
require './lib/help'

class HelpTest < Minitest::Test

  def test_it_can_list_all_commands
    h = Help.new

    assert_equal @commands, h.list_commands
  end

  def test_it_can_run_queue_commands
    count= "QUEUE COUNT - counts the number of rows that have been found using find"
    clear = "QUEUE CLEAR- Empties the current queue"
    h = Help.new
    h.list_commands("queue")

    assert_equal count,  h.queue_help("count")
    assert_equal clear,  h.queue_help("clear")
  end

  def test_it_can_list_the_queue_count_commands
    count= "QUEUE COUNT - counts the number of rows that have been found using find"
    h = Help.new

    assert_equal count, h.help_count
  end

  def test_it_can_list_the_load_commands
    h_load = "LOAD-Loads a CSV file passed as an argument. Defaults to 'full_event_attendees.csv"
    h = Help.new

    assert_equal h_load, h.help_load
  end

  def test_it_can_list_the_find_commands
    find = "FIND-finds the record by specified attributes and criteria (i.e. 'find city sacramento')"
    h = Help.new

    assert_equal find, h.help_find
  end

end
