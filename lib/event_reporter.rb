#
require 'shellwords'
require 'csv'
require 'pry'
require_relative 'output'
require_relative 'queue'
require_relative 'help'
require_relative 'clean'

class EventReporter
  include Output
  def initialize(*attendee)
    @attendees = []
    @attendee =attendee

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
      clean_rows(attribute, criteria, row)
      match_rows(attribute,criteria,row)
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

  def save_find(row)
    make_queue
      row = row.to_hash if row.class == CSV::Row
    @q.add(row)
  end

  def match_rows(attribute,crit,row)
    row[attribute.to_sym] = "" if row[attribute.to_sym] == nil
    if crit.join(' ').downcase == row[attribute.to_sym].downcase && crit != nil
      save_find(row)
    end
  end

end
