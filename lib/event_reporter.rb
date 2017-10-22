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
    # @q ||= Queue.new
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
  @q.add(row)
# binding.pr
end

def email(attribute,criteria,row)
  if attribute == "email" && criteria == row[:email_address]
    add_to_queue(row)
    #  row[:email_address]
  end
end

def first_name(attribute,criteria,row)
  if attribute == "first_name" && criteria.downcase == row[:first_name].downcase
    add_to_queue(row)

  end
end
def last_name(attribute,criteria,row)
  if attribute == "last_name" && criteria.downcase == row[:last_name].downcase
    add_to_queue(row)
    row
  end
end

def zip(attribute,criteria,row)
  if attribute == "zipcode" && criteria == row[:zipcode]
    add_to_queue(row)
    row
  end
end

def state(attribute,criteria,row)
  if attribute == "state" &&  criteria == row[:state]
    add_to_queue(row)
    row[:state]
   row
end
end

def input(attribute,criteria,row)
  attribute = attribute.strip
    first_name(attribute,criteria,row)
    last_name(attribute,criteria,row)
    state(attribute,criteria,row)
    zip(attribute,criteria,row)
    email(attribute,criteria,row)
end

end
#
# e = EventReporter.new
# # @q = Queue.new
# # q.run
#
# BUILTINS = {

# loop do
#   $stdout.print '-> '
#   line = $stdin.gets.strip
#   attribute, *arguments = Shellwords.shellsplit(line)
#
#   if BUILTINS[attribute]
#     BUILTINS[attribute].call(*arguments)
#   else
#     pid = fork {
#       exec line
#     }
#
#     Process.wait pid
#
#   end
# end


#
#
# class List
#
#   attr_reader :count, :add
#
# def initialize
#   @queue = []
#   @count = 0
# end
# def count
#   @count+=1
#   p @count
# end
# def add(row)
#   @queue << row
# end
# def print
# end
# end



# require 'readline'
#  require 'csv'




# def print_attendees
# load.each do |row|
#  p row
# end
# end
#

#
#
#
#
# # Readline::HISTORY.pop if input == ""
# # system(input)
# # comp = proc { |s| Readline::HISTORY.grep(/^#{Regexp.escape(s)}/) }
# # Readline.completion_append_character = " "
# # Readline.completion_proc = comp
# end
# e =EventReporter.new
# e.make_shell
