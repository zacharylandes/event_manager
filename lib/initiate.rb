require_relative 'event_reporter'
require_relative 'event_reporter'


e = EventReporter.new
h = Help.new

BUILTINS = {
  'exit' =>  lambda { |code = 0| exit(code.to_i) },
  'find' =>  lambda { |attribute,*criteria| e.find(attribute, *criteria)},
  'load' =>  lambda {|*file| e.load(*file)},
  'help' =>  lambda {|*attribute| h.list_commands(*attribute)},
  'queue' => lambda do |method, *attribute|
    e.make_queue.run(method, *attribute )
end
}


loop do
  $stdout.print '---> '
  row = $stdin.gets.strip
  command, *arguments = Shellwords.shellsplit(row)

  if BUILTINS[command]
     BUILTINS[command].call(*arguments)
  else
    pid = fork {
      exec line
    }
    Process.wait pid
  end

end
