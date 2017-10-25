#
require 'shellwords'
require 'csv'
require 'pry'
require_relative 'queue'
require_relative 'help'
require_relative 'clean'

class EventReporter
  include Clean

  def load(file = 'full_event_attendees.csv')
      contents = CSV.open file, headers: true, header_converters: :symbol
        contents.map {|csv|csv}
  end

  def find(attribute, *criteria)
    delete_queue
    load.find_all do |row|
      # binding.pry
      clean(attribute, criteria, row)
      match(attribute,criteria,row)
    end
  end

  def make_queue
    @q ||=Queue.new
  end

  def delete_queue
    @q = nil
  end

  def add_to_queue(row)
    make_queue
    row = row.to_hash  if row == CSV::Row
    @q.add(row)
  end

  def match(attribute,criteria,row)
    row[attribute.to_sym] = "" if row[attribute.to_sym] == nil
    if criteria.join(' ').downcase == row[attribute.to_sym].downcase && criteria != nil
      add_to_queue(row)
    end
  end


end
