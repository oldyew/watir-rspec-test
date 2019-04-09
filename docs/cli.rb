ruby -e 'puts 123' #run code
-c # syntax check
-w # enable warning
-r # require a file/gem
-l # add directory to load path

echo 'bacon\nchocolate\norange' | ruby -ne 'puts $_.upcase'
# BACON
# CHOCOLATE
# ORANGE
