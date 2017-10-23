require'./event_reporter'

e = EventReporter.new
BUILTINS = {

  'exit' => lambda { |code = 0| exit(code.to_i) },
  'find' =>  lambda { |attribute,criteria| e.find(attribute, criteria)},
  'load' =>  lambda { e.load},
  'queue' => lambda do |method, *attribute|
    e.make_queue.run(method, *attribute )
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
