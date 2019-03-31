gem 'watir-scroll'

Scrolling on Browser Window Level
browser.scroll.to :top      # scrolls to the top of the page
browser.scroll.to :center   # scrolls to the center of the page
browser.scroll.to :bottom   # scrolls to the bottom of the page
browser.scroll.to [10, 10]  # scrolls to coordinates x and y
browser.scroll.by 10, 10    # scrolls to left and down by 10 pixels
browser.scroll.by -10, -10  # scrolls to right and top by 10 pixels
You can also chain the calls:

browser.scroll.to(:top).by(0, 100)  # scrolls to the top of the page and 100 pixels down
Scrolling To Elements
button = browser.button(text: 'Click')

button.scroll.to          # scrolls element to the top
button.scroll.to :center  # scrolls element to the center
button.scroll.to :bottom  # scrolls element to the bottom
button.scroll.by 10, 10   # scrolls to left and down by 10 pixels
button.scroll.by -10, -10 # scrolls to right and top by 10 pixels
You can also chain the calls:

button.scroll.to.by(0, 100) # scrolls to the button and 100 pixels down