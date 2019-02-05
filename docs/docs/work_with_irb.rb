#clear console
system 'cls'

#attach 

ie = Watir::IE.attach(:title, "Google")                 #find by window title
ie = Watir::IE.find(:url, "http://www.google.com")    #find by url
ie = Watir::IE.find(:title,/REGEX/)                   #find by title matching REGEX
ie = Watir::IE.find(:title,//)                        #attach to any current IE instance

#find objects

irb(main):003:0> ie.show_all_objects
-----------Objects in page -------------
text name=test_text id= 11 value= alt= src=
submit name=test_button id= 12 value=Click Me alt= click src=

irb(main):004:0> ie.text_field(:name, "test_text").flash
=> nil

# load script

class Dog
  def bark
    puts "woof woof!"
  end
end

irb(main):001:0> load 'dog_class.rb'
=> true
irb(main):002:0> puppy = Dog.new
=> #<Dog:0x2bbc1bc>
irb(main):003:0> puppy.bark
woof woof!
=> nil