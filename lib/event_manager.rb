 require 'csv'

require 'readline'
def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5,"0")[0..4]

end

def find
  contents.each do |row|
      name = row[attribute.to_sym]
      state = row[:state]
      zipcode = clean_zipcode(row[:zipcode])

  end


end


def load( file = 'full_event_attendees.csv')
  # file.clear

contents = CSV.open file, headers: true, header_converters: :symbol

contents.each do |row|
 p row
end
end















while input = Readline.readline("> ", true)
  break                       if input == "exit"

  # Remove blank lines from history
  Readline::HISTORY.pop if input == ""

  system(input)
  comp = proc { |s| Readline::HISTORY.grep(/^#{Regexp.escape(s)}/) }

Readline.completion_append_character = " "
Readline.completion_proc = comp
end






# # def clean_zipcode(zipcode)
#   zipcode.to_s.rjust(5,"0")[0..4]
#
# # end
