require 'erb'
require 'csv'
module Output

    def qprint(attribute, *criteria)
      return qprint_by(criteria) if attribute == "by"
        print_format
    end

    def print_loop
      @queue.each_with_index do |attendee, _|
        puts @format % [attendee[:first_name], attendee[:last_name],
        attendee[:email_address], attendee[:zipcode], attendee[:city],
        attendee[:state], attendee[:street], attendee[:homephone] ]
      end
    end

    def print_format
      puts @format % @headers
      print_loop
    end

    def save_to(csv_file)
      CSV.open(csv_file.join, "w", headers:true) do |csv|
        csv << @headers
        @queue.each do |attendee|
          csv << [attendee[:first_name], attendee[:last_name],
          attendee[:email_address], attendee[:zipcode], attendee[:city],
          attendee[:state], attendee[:street], attendee[:homephone] ]
        end
      end
    end

    def qprint_by(criteria)
      criteria = criteria.join.to_sym
      @queue =  @queue.sort_by { |key| key[criteria]}
      print_format
    end

    def export(attribute = '', csv)
      contents = CSV.open csv , headers: true, header_converters: :symbol
      print_format
      export_deets(attribute = '', csv)
    end

    def export_deets(attribute = '', csv)
      erb_template = ERB.new File.read 'form_letter.html.erb'
      form_letter = erb_template.result(binding)
      csv = csv.split('.')[0].split('').push('.''h','t','m','l').join
      File.open(csv,'w') {|file| file.puts form_letter}
    end

  end
