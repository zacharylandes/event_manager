# require_relative './form_letter'
require 'csv'
require 'erb'
# require_relative 'form_letter'


require 'erb'

def save_thank_you_letters(form_letter)
  # Dir.mkdir("output") unless Dir.exists?("output")

  # filename = "output/thanks_#{id}.html"


end

puts "EventManager initialized."

contents = CSV.open 'full_event_attendees.csv', headers: true, header_converters: :symbol
form_letter = ''
template_letter = File.read 'form_letter.html.erb'
erb_template = ERB.new template_letter

contents.each do |row|

  row[:first_name]
  row[:last_name]
p row[:last_name]

  form_letter = erb_template.result(binding)

  # save_thank_you_letters(id,form_letter)
end

  File.open('files.html','w') do |file|
    file.puts form_letter
  end
