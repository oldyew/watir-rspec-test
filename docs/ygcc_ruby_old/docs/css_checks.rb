if not browser.div(:text,"email").style('width') == "75px" 
    fail "Width is not 75px"
  end
   
  if not browser.div(:text,"email").style('text-align') == "right" 
    fail "Text align is not right"
  end
   
  if not browser.div(:text,"email").style('font-size') == "11px" 
   fail "Text align is not 11px"
  end

  
browser.div(:text,"SampleElement").style('background')

browser.div(:text,"SampleElement").style('font-size')

browser.div(:text,"SampleElement").style('text-align')
