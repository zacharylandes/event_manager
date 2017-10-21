#
require 'shellwords'
require 'csv'

def load( file = 'full_event_attendees.csv')
  CSV.open file, headers: true, header_converters: :symbol
# contents.each do |row|
#  p row
# end
end


def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5,"0")[0..4]
end
BUILTINS = {
  'cd' => lambda { |dir| Dir.chdir(dir) },
  'exit' => lambda { |code = 0| exit(code.to_i) },
  'exec' =>  lambda { |*command| exec *command },
  'find' =>  lambda do |command|
      load.each do |row|
        case command
        when "name"
           p  row[:last_name]
        when "state"
           p row[:state]
        when "zipcode"
        p  clean_zipcode(row[:zipcode])
      end
    end
    end

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
#  require 'pry'
#
#
# class EventReporter
#   def make_shell#(input= ,input)
#     # list = ARGV[1]
# while input = Readline.readline("> ", true)
#   case input
#   when "exit"
#     break
#   when "load"
#     load
#   when "find"
#     # binding.pry
#       find
# end
# end
# end
# #
def find(query)
load
 case query
    when "name"
       p "yo"# row[:last_name]
    when "state"
       p row[:state]
    when "zipcode"
    p  clean_zipcode(row[:zipcode])
  end

end
