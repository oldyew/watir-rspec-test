
#Load the Watir library
require 'watir'

#Open a browser
browser = Watir::Browser.new

#Open Browser at the specified URL
browser = Watir::Browser.start("http://google.com")

#Go to a specified URL
browser.goto("http://amazon.com")

#Close the browser
browser.close

#Accessing an Element
#Text box or text area
t = browser.text_field(:name, "username")

#Button

b = browser.button(:value, "Click Here")
Drop down list

   d = browser.select_list(:name, "month")
Check box

   c = browser.checkbox(:name, "enabled")
Radio button

   r = browser.radio(:name, "payment type")
Form

   f = browser.form(:name, "address")
   f = browser.form(:action, "submit")
Link

   l = browser.link(:url, "http://google.com")
   l = browser.link(:href, "http://google.com")
Table cell in a table (2nd row, 1st column)

   td = browser.table(:name, 'recent_records')[2][1]
Check the Contents
Return the html of the page or any element

   browser.html
   e.html
Return the text of the page or any element

   browser.text
   e.text
Return the title of the document

   browser.title
Get text from status bar

   browser.status
   => "Done"
Return true if the specified text appears on the page

   browser.text.include? 'llama'
Return the contents of a table as an array

   browser.table(:id, 'recent_records').to_a
Manipulate the Element
Click a button or link

   b.click
   l.click
Enter text in a text box

   t.set("mickey mouse")
Enter multiple lines in a multi-line text box

   t.set("line 1\nline2")
Set radio button or check box

   c.set
   r.set
Clear an element

   t.clear
   c.clear
   r.clear
Select an option in a drop down list

   d.select "cash"
   d.set "cash"
Clear a drop down list

   d.clearSelection
Submit a form

   f.submit
Flash any element (useful from the watir-console)

   e.flash
##Browser options

These can only be used with the watir-classic gem (watir version < 4.0) on Internet Explorer.

Speed up execution (or use the "-b" command line switch)

   browser.speed = :fast
Maximize browser window

   browser.maximize
Pop browser window to front

   browser.bring_to_front


   Browser
# start new driver session
browser = Watir::Browser.new :firefox
browser = Watir::Browser.new :chrome
browser = Watir::Browser.new :ie
 
# goto url
browser.goto "http://3Qilabs.com"
 
# refresh
browser.refresh
 
# close
browser.quit
Textbox
# enter value
browser.text_field(:id => "text").set "watir-webdriver"
 
# get value
browser.text_field(:id => "text").value
 
# clear
browser.text_field(:id => "text").clear
Button
# is enabled?
browser.button(:id => "btn").enabled?
 
# button's text
browser.button(:id => "btn").text
 
# click
browser.button(:id => "btn").click
Checkbox
# check
browser.checkbox(:id => "btn").set
browser.checkbox(:id => "btn").set(true)
 
# uncheck
browser.checkbox(:id => "btn").clear
browser.checkbox(:id => "btn").set(false)
 
# is checked?
browser.checkbox(:id => "btn").set?
Listbox
# select from list text
browser.select_list(:id => "list").select "var"
 
# select using value
browser.select_list(:id => "list").select_value "var2"
 
# value is selected?
browser.select_list(:id => "list").selected?("var2")
 
# get value
puts browser.select_list(:id => "list").value
 
# get all items
browser.select_list(:id => "list").options.each do |i|
  puts "#{i.text}"
end
Radio
# select value
browser.radio(:id => "radio").set
 
# is var selected?
browser.radio(:id => "radio").set?
Image
# is image loaded?
browser.image(:src => "img.gif").loaded?
 
# height
browser.image(:src => "img.gif").height
 
# width
browser.image(:src => "img.gif").width
 
# click
browser.image(:src => "img.gif").click
# click 1st image
browser.images[0].click
Div
# get text
browser.div(:class => "body").text
 
# get text of 2nd div when it appears
browser.divs[1].when_present.text
Table
# row 1, col 1
browser.table(:id => "table")[0][0].text
# row 1, col 2 (alternate)
browser.table(:id => "table").tr{0}.cell{1}.text
 
# row 2 - entire text
puts browser.table(:id => "table")[1].text
 
# click row #4
puts browser.table(:id => "table")[3].click
 
# get column count
browser.table(:id => "table").row.cells.length
 
# row count
browser.table(:id => "table").row_count
browser.table(:id => "table").rows.length
General
# [exists?]
browser.text_field(:id => "text").exists?
 
# [enabled?]
browser.select_list(:id => "list").enabled?
 
# [present?]
browser.element(:id => "e").present?
 
# [tag_name]
browser.element(:id => "e").tag_name
 
# [screenshot]
browser.screenshot.save "c:\\page.png"
 
# [to_subtype] # returns button
browser.element(:id => "btn").to_subtype 
 
# [index] click 2nd image on page
browser.image(:index => 1).click
 
# [loops]
# get names of all text-fields
browser.text_fields.each do |i|
  puts i.name
end
 
# get name of first text-field
puts browser.text_fields[0].name
# get name of second text-field
puts browser.text_fields[1].name
Waiting
# [wait_until_present]
browser.button(:id => "btn").when_until_present
 
# [when_present]
browser.button(:id => "btn").when_present.click
browser.button(:id => "btn").when_present(10).click
 
# [wait_while_present]
browser.button(:value => "submit").click
browser.button(:value => "submit").wait_while_present
 
# [implicit wait] 5 seconds
# good to have, but i don't recommend its global use
browser.driver.manage.timeouts.implicit_wait = 5