
class Queue

  attr_accessor  :queue,
                 :count,
                 :run

    def initialize
      @queue = []
    end

    def run(method, *attribute)
        count if method == "count"
        qprint if method == "print"
        clear if method == "clear"
        qprint_by(attribute) if method == "print_by"
        save_to(attribute) if method == "save_to"
        export if method == "export html "
    end

    def qprint_by(attribute)
        attribute = attribute.join.to_sym
        @queue =  @queue.sort_by { |key| key[attribute]}
        qprint
    end

    def save_to

    end

    def add(row)
      @queue << row
    end

    def count
      # binding.pry
       if @queue.nil?
          p 0
       else
          puts @queue.count
       end
    end

    def clear
      @queue = nil
      p "nil"
    end

    def qprint
      format = '%-14s %-11s %-36s %-7s %-17s %7s %-28s %-13s '
      puts format % ['LAST NAME', 'FIRST NAME', 'EMAIL','ZIPCODE', 'CITY', 'STATE', 'ADDRESS', 'PHONE']
      @queue.each_with_index do |member, i|
        puts format % [ member[:last_name], member[:first_name],
        member[:email_address], member[:zipcode], member[:city],member[:state], member[:street], member[:homephone] ]
      end
    end

      def save_to(file)
        # binding.pry
        headers = ['LAST NAME', 'FIRST NAME', 'EMAIL','ZIPCODE', 'CITY', 'STATE', 'ADDRESS', 'PHONE']

        CSV.open("data.csv", "wb") do |csv|
csv << headers #if csv.count.eql? 0
  @queue.each do |hash|
    csv << hash
  end
end

  end

end
