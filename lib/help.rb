class Help
  attr_reader :commands,
              :queue_help,
              :help_load,
              :help_clear,
              :help_count,
              :list_commands

  def initialize
    @commands =   ["FIND-finds the record by specified attributes and criteria (i.e. 'find city sacramento')",
        "LOAD-Loads a CSV file passed as an argument. Defaults to 'full_event_attendees.csv",
        "QUEUE COUNT - counts the number of rows that have been found using find",
        "QUEUE CLEAR- Empties the current queue",
        "QUEUE PRINT - Prints all the items in the queue",
        "QUEUE PRINT BY - Prints all the items in the queue organized by specified criteria(i.e )",
        "QUEUE SAVE TO - Prints all the items in the queue",
        "QUEUE EXPORT HTML - Generates html file displaying CSV fields"]

  end

  def list_commands(attribute = '', *criteria)
    return queue_help(*criteria) if attribute == "queue"
    return help_find if attribute == "find"
    return help_load if attribute == "load"
    puts @commands
  end

  def queue_help(criteria = '', *suffix)
    return help_count if criteria == "count"
    return help_print(*suffix) if criteria == "print"
    return help_save(*suffix) if criteria == "save"
    return help_export(*suffix) if criteria == "export"
    return help_clear if criteria == "clear"
  end

  def help_load
    p @commands[1]
  end

  def help_clear
    p @commands[3]
  end

  def help_find
    p @commands[0]
  end

  def help_count
    p @commands[2].chomp
  end

  def help_print(*by)
    return   p @commands[5]  if by.join == 'by'
    p @commands[4]
  end

  def help_save(*to)
    p @commands[6]
  end

  def help_export(*html)
    p @commands.last
  end

end
