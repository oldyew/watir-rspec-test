begin
  raise 'this is an exception'
rescue RuntimeError => exception
  puts "Exception rescued: #{exception.inspect}"
end
