require_relative 'test_helper'
require './lib/queue'
require './lib/event_reporter'
require 'pry'
require './lib/help'

class HelpTest < Minitest::Test
  # include Help

  def test_it_can_list_all_commands
skip
      h = Help.new

    assert_equal @commands, h.list_commands
  end

  def test_it_can_run_queue_commands

    h = Help.new
    h.list_commands("queue")
    # binding.pry

    assert_equal @commands[2], h.queue_help("count")
  end

  def test_it_can_list_the_queue_count_commands
skip
    h = Help.new
    h.list_commands("queue")

    assert_equal @commands[2], h.help_count
  end

    def test_it_can_list_the_load_commands
skip
      h = Help.new

      assert_equal @commands[1], h.help_load
    end

end
