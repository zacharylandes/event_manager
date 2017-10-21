require'./event_reporter'

e = EventReporter.new

BUILTINS = {
  # 'cd' => lambda { |dir| Dir.chdir(dir) },
  'exit' => lambda { |code = 0| exit(code.to_i) },
  'find' =>  lambda { |command, item| e.find(command)},
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
