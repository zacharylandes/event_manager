
module Output

    def qprint(attribute, *criteria)
      return qprint_by(criteria) if attribute == "by"
        print_format
    end

    def print_format
    puts @format % @headers
      @queue.each_with_index do |attendee, _|
        puts @format % [attendee[:last_name], attendee[:first_name],
        attendee[:email_address], attendee[:zipcode], attendee[:city],
        attendee[:state], attendee[:street], attendee[:homephone] ]
      end
    end

    def save_to(file)
      CSV.open(file.join, "wb") do |csv|
          csv << @headers
          @queue.each { |hash| csv << hash }
      end
    end

    def qprint_by(criteria)
        criteria = criteria.join.to_sym
        @queue =  @queue.sort_by { |key| key[criteria]}
        print_format
    end
end
