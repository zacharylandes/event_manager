#
require 'shellwords'
require 'csv'
require 'pry'
require_relative 'queue'
require_relative 'help'


class EventReporter


  def load(file = 'full_event_attendees.csv')
      CSV.open file, headers: true, header_converters: :symbol
  end


  def find(attribute, criteria)
    delete_queue
    load.find_all do |row|
      clean(attribute, criteria, row)
    end
  end

  def clean_zipcodes(row)
    row[:zipcode] =  row[:zipcode].to_s.rjust(5,"0")[0..4]
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
       row = row.to_hash  if row == CSV::Row
      @q.add(row)
  end



  def match(attribute,criteria,row)
      row[attribute.to_sym] = "" if row[attribute.to_sym] == nil
      if criteria.downcase == row[attribute.to_sym].downcase && criteria != nil
      add_to_queue(row)
    end
  end


  def clean(attribute,criteria,row)
        clean_zipcodes(row)
        clean_phone_numbers(row)
        attribute = attribute.strip
        criteria= criteria.strip
        match(attribute,criteria,row)
  end
end
