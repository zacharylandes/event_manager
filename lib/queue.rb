
class Queue

  attr_accessor  :queue,
                 :count,
                 :run

    def initialize
      @queue = []
      @format = '%-14s %-11s %-36s %-7s %-17s %7s %-28s %-13s'
    end

    def run(method,attribute='',*criteria)
      return count if method == "count"
      return clear if method == "clear"
      return export if method == "export"
      return save_to(criteria) if method == "save"
      return qprint(attribute, *criteria) if method == "print"
    end

    def qprint_by(criteria)
        criteria = criteria.join.to_sym
        @queue =  @queue.sort_by { |key| key[criteria]}
        print_format
    end

    def add(row)
      @queue << row
    end

    def count
       return  p 0 if @queue.nil?
          puts @queue.count
    end

    def clear
      @queue = nil
    end

    def qprint(attribute, *criteria)
      return qprint_by(criteria) if attribute == "by"
        print_format
    end

    def print_format
    puts @format % ['LAST NAME', 'FIRST NAME', 'EMAIL','ZIPCODE', 'CITY', 'STATE', 'ADDRESS', 'PHONE']
      @queue.each_with_index do |member, i|
        puts @format % [ member[:last_name], member[:first_name],
        member[:email_address], member[:zipcode], member[:city],member[:state], member[:street], member[:homephone] ]
      end
    end

      def save_to(file)
        headers = ['LAST NAME', 'FIRST NAME', 'EMAIL','ZIPCODE', 'CITY', 'STATE', 'ADDRESS', 'PHONE']
        CSV.open(file.join, "wb") do |csv|
            csv << headers
            @queue.each { |hash| csv << hash }
        end
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
