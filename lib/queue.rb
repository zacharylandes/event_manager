require_relative 'output'

class Queue

include Output

  attr_accessor  :queue,
                 :count,
                 :run

  def initialize
    @queue = []
    @format = '%-14s %-11s %-36s %-7s %-17s %7s %-28s %-13s'
    @headers = ['LAST NAME', 'FIRST NAME', 'EMAIL','ZIPCODE', 'CITY', 'STATE', 'ADDRESS', 'PHONE']

  end

  def run(method,attribute='',*criteria)
    return count if method == "count"
    return clear if method == "clear"
    return export if method == "export"
    return save_to(criteria) if method == "save"
    return qprint(attribute, *criteria) if method == "print"
  end

  def add(row)
    @queue << row
  end

  def count
    return p 0 if @queue.nil?
      p @queue.count
  end

  def clear
    @queue = nil
  end

end

      # case method
      # when "count"
      #   count
      # when "print"
      #   if attribute == "by"
      #     qprint_by(criteria)
      #   else
      #   print_format
      #   end
      # when "clear"
      #   clear
      # when "save"
      #   if attribute == "to"
      #     save_to(criteria)
      #   end
      # when "export"
      #   export
