#
require 'shellwords'
require 'csv'
require 'pry'
require_relative 'queue'
require_relative 'help'
require_relative 'clean'

class EventReporter
  def initialize
    @attendees = []
  end
  include Clean

  def load(file = './full_event_attendees.csv')
      delete_attendees
      contents = CSV.open file, headers: true, header_converters: :symbol
      contents.each { |row| @attendees << row}
      @attendees
  end

  def find(attribute, *criteria)
    delete_queue
    @attendees.find_all do |row|
      clean(attribute, criteria, row)
      match(attribute,criteria,row)
    end
  end

  def make_queue
    @q ||=Queue.new
  end

  def delete_attendees
    @attendees = []
  end

  def delete_queue
    @q = nil
  end

  def add_to_queue(row)
    make_queue
    if row.class == CSV::Row
      row = row.to_hash
    end
    @q.add(row)
  end

  def match(attribute,criteria,row)
    row[attribute.to_sym] = "" if row[attribute.to_sym] == nil
    if criteria.join(' ').downcase == row[attribute.to_sym].downcase && criteria != nil
      add_to_queue(row)
    end
  end

end
