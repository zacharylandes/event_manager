class Help
attr_reader :output, :print_all
def initialize

end

def output(*attribute)
attribute= attribute.join
  if attribute == "find"
    help_find
  elsif attribute == "queue"
    help_queue
  elsif  attribute == "load"
    help_load
  else
    print_all
  end
end

def print_all
  commands = ["FIND-Loads a CSV file passed as an argument. Defaults to 'full_event_attendees.csv'",
  "LOAD-Loads a CSV file passed as an argument. Defaults to 'full_event_attendees.csv'",
  "QUEUE COUNT - counts the number of rows that have been found using find",
  "QUEUE PRINT - Prints all the items in the queue",
  "QUEUE PRINT_BY - Prints all the items in the queue organized by specified criteria",
  "QUEUE SAVE_TO - Prints all the items in the queue"]
end

def help_load
  puts "LOAD-Loads a CSV file passed as an argument. Defaults to 'full_event_attendees.csv'"
end

def help_queue
  puts "QUEUE-"
end

def help_find
  puts "FIND-Loads a CSV file passed as an argument. Defaults to 'full_event_attendees.csv'"
end



end
