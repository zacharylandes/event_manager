#
require 'shellwords'
require './queue'
require 'csv'

class EventReporter
def load( file = 'full_event_attendees.csv')
CSV.open file, headers: true, header_converters: :symbol
end

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5,"0")[0..4]
end

def find(command)
      load.each do |row|
        input(command, row)
    end
end


def input(command,row)
      p  row[:last_name] if command == "name"
      p  row[:state] if command == "state"
      p   clean_zipcode(row[:zipcode])if command == "zipcode"
end

end
e = EventReporter.new

BUILTINS = {
  # 'cd' => lambda { |dir| Dir.chdir(dir) },
   'exit' => lambda { |code = 0| exit(code.to_i) },
  'find' =>  lambda { |command| e.find(command)},
  'load' =>  lambda { e.load}

}

loop do
  $stdout.print '-> '
  line = $stdin.gets.strip
  command, *arguments = Shellwords.shellsplit(line)

  if BUILTINS[command]
    BUILTINS[command].call(*arguments)
  else
    pid = fork {
      exec line
    }

    Process.wait pid

  end


end



# require 'readline'
#  require 'csv'




# def print_attendees
# load.each do |row|
#  p row
# end
# end
#

#
#
#
#
# # Readline::HISTORY.pop if input == ""
# # system(input)
# # comp = proc { |s| Readline::HISTORY.grep(/^#{Regexp.escape(s)}/) }
# # Readline.completion_append_character = " "
# # Readline.completion_proc = comp
# end
# e =EventReporter.new
# e.make_shell
