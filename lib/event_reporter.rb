#
require 'shellwords'
require 'csv'
require 'pry'
require_relative 'queue'
# require '../lib/queue'


class EventReporter
  def initialize
    @queue = []
    @count = 0
  end

def load( file = 'full_event_attendees.csv')
  CSV.open file, headers: true, header_converters: :symbol
end

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5,"0")[0..4]
end

def find(attribute, criteria)
  delete_queue
  load.find_all do |row|
      input(attribute, criteria, row)
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
    row = row.to_hash
    @q.add(row)
end

def field(attribute,criteria,row)
    row[attribute.to_sym] = "" if row[attribute.to_sym] == nil
  if criteria.downcase == row[attribute.to_sym].downcase && criteria != nil
    add_to_queue(row)
    end
end


def input(attribute,criteria,row)
  attribute = attribute.strip
  criteria= criteria.strip
    field(attribute,criteria,row)
  end
end
