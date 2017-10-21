require_relative 'test_helper'
require '../lib/event_reporter'

class EventReporterTest < Minitest::Test
def test_it_loads_CSV
e = EventReporter.new
e.exit

assert true
end

end
