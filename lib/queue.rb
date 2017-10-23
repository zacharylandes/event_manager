
class Queue

  attr_accessor  :queue,
                 :count,
                 :run

def initialize
  @queue = []
  @queue_sum = {}
  @queues = []
  # @count = 0
end

  def run(method, *attribute)
      count if method == "count"
      qprint if method == "print"
      clear if method == "clear"
      qprint_by(attribute) if method == "print_by"
      save_to if method == "save to"
      export if method == "export html "
  end
  def qprint_by(attribute)
    @queue.each do |x|
    x.keys.sort_by { |attribute| x[attribute] }.each do
|attribute|
    puts x[attribute]
end

  end
  end


  def add(row)
    @queue << row
  end

  def count
     if @queue.nil?
        p 0
    else
        p @queue.count
    end
  end

  def clear
    @queue = nil
    p "nil"
  end

  def qprint
    #  p @queue
    format = '%-14s %-11s %-36s %-7s %-11s %7s %-28s %-13s '
    puts format % ['LAST NAME', 'FIRST NAME', 'EMAIL','ZIPCODE', 'CITY', 'STATE', 'ADDRESS', 'PHONE']
    @queue.each_with_index do |member, i|
      puts format % [ member[:last_name], member[:first_name],
      member[:email_address], member[:zipcode], member[:city],member[:state], member[:street], member[:homephone] ]
    end
  end

  def save_to
    # binding.pry
  h = qprint # { 'dog' => 'canine', 'cat' => 'feline', 'donkey' => 'asinine' }
binding.pry
  CSV.open("data.csv", "w", headers: h[0].keys) do |csv|
    csv << h[0].values
    # binding.pry
end
  p csv

  end

end
