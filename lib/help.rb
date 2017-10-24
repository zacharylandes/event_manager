module Help

  def output(attribute = '', *criteria)
    return queue_help(*criteria)  if attribute == "queue"
    return help_find if attribute == "find"
    return help_load if attribute == "load"
    puts print_all
  end

  def queue_help(criteria = '', *suffix)
    return help_print(*suffix) if criteria == "print"
    return help_save(*suffix) if criteria == "save"
    return help_export(*suffix) if criteria == "export"
    return help_clear if criteria == "clear"
  end

  def print_all
    ["FIND-finds the record by specified attributes and criteria (i.e. 'find city sacramento')",
    "LOAD-Loads a CSV file passed as an argument. Defaults to 'full_event_attendees.csv'",
    "QUEUE COUNT - counts the number of rows that have been found using find",
    "QUEUE CLEAR- Empties the current queue",
    "QUEUE PRINT - Prints all the items in the queue",
    "QUEUE PRINT BY - Prints all the items in the queue organized by specified criteria(i.e )",
    "QUEUE SAVE TO - Prints all the items in the queue",
    "QUEUE EXPORT HTML - Generates html file displaying CSV fields"]
  end

  def help_load
    puts print_all[1]
  end

  def help_clear
    puts print_all[3]
  end

  def help_find
    puts print_all[0]
  end

  def help_count
  puts print_all[2]
  end

  def help_print(*by)
    if by.join == 'by'
      puts print_all[5]
    else
      puts print_all[4]
    end
  end


  def help_save(*to)
    puts print_all[6]
  end

  def help_export(*html)
    puts print_all.last
  end

end
