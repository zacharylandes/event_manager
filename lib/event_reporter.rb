#
require 'shellwords'
require 'csv'
require 'pry'
require_relative 'queue'
require_relative 'help'

# require '../lib/queue'


class EventReporter

  def initialize
    # # @queue = []
    # @count = 0
  end

  def load(file = 'full_event_attendees.csv')
    CSV.open file, headers: true, header_converters: :symbol
  end


  def find(attribute, criteria)
    delete_queue
    load.find_all do |row|
      input(attribute, criteria, row)
    end
  end

  def clean_zipcodes(row)
    row[:zipcode] =  row[:zipcode].to_s.rjust(5,"0")[0..4]
    #  p row
  end

  def clean_phone_numbers(row)
    row[:homephone] =  row[:homephone].gsub('-', '')
  end


  def help(*attribute)
    h ||=Help.new
    h.output(*attribute)
  end

  def make_queue
    @q ||=Queue.new
  end

  def delete_queue
    @q = nil
  end

  def add_to_queue(row)
      make_queue
      if row == CSV::Row
      row = row.to_hash #
      end

      # binding.pry
      @q.add(row)
  end



  def field(attribute,criteria,row)
      row[attribute.to_sym] = "" if row[attribute.to_sym] == nil
      if criteria.downcase == row[attribute.to_sym].downcase && criteria != nil
      add_to_queue(row)
    end
  end


  def input(attribute,criteria,row)
        clean_zipcodes(row)
        clean_phone_numbers(row)
    attribute = attribute.strip
    criteria= criteria.strip
    field(attribute,criteria,row)
  end
end
