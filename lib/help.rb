class Help
attr_reader :output, :print_all
def initialize

end

def output(*attribute)
attribute= attribute.join
  if attribute == "find"
    help_find
  elsif attribute == "clear"
    help_clear
  elsif  attribute == "load"
    help_load
  elsif  attribute == "count"
      help_count
  elsif  attribute == "print"
      help_print
  elsif  attribute == "print_by"
      help_print_by
  elsif  attribute == "save_to"
      help_save_to
  elsif  attribute == "export html"
      help_export
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
  "QUEUE SAVE_TO - Prints all the items in the queue",
  "QUEUE EXPORT HTML - Generates html file displaying CSV fields"]
  puts commands
end

def help_load
  puts "LOAD-Loads a CSV file passed as an argument. Defaults to 'full_event_attendees.csv'"
end

def help_clear
  puts "CLEAR-Clears the queue"
end

def help_find
  puts "FIND-Loads a CSV file passed as an argument. Defaults to 'full_event_attendees.csv'"
end
def help_count
  puts "Count-returns current count of queue"
end
def help_print
  puts "QUEUE PRINT - Prints all the items in the queue"

end
def help_print_by
  puts "QUEUE PRINT_BY - Prints all the items in the queue organized by specified criteria"
end

def help_save_to
  puts  "SAVE TO - Exports the current queue to the specified filename as a CSV. "

end

def help_export
  puts  "QUEUE EXPORT HTML - Generates html file displaying CSV fields"

end
end
