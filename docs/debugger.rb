# puts "#" * 90
# puts caller
# puts "#" * 90
 
# exit! or raise

# before method calling
# p method(:method_name).source_location

# if use super
# p method(:method_name).super_method.source_location

# p method.bind(request).call(:method_name).source_location

# tp = TracePoint.new(:call) do |x|
  # p x
# end
  # tp.enable
  # method calling
# ensure
  # tp.disable