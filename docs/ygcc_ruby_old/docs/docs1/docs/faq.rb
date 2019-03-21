How do I require all ruby files in the current directory?
    dir = File.dirname(__FILE__)
    Dir[File.expand_path("#{dir}/*.rb")].uniq.each do |file|
    require file
    end


How do I use regular expressions for object recognition?
    Watir allows the tester to use Regular Expressions for object recognition instead of using the full string literal. This is useful for HTML objects that are dynamically created.
    
    For example in my WebSphere application we may have a link with this URL
    
     $ie.link(:url, "javascript:PC_7_0_G7_selectTerritory('0',%20'amend')").click
    However this: 'PC_7_0_G7_' will change dependent on the environment.
    
    With RegEx we could find that link by doing :
    
     $ie.link(:url, /selectTerritory\('0',%20'amend'\)/).click
    or this
    
     $ie.link(:url, /javascript.*selectTerritory\('0',%20'amend'\)/).click
    note: '.*' will match any character or digit any number of times.
    
    RegEx contains special characters that need to be escaped. For example here ')' we use the backward slash to escape a closing bracket.
    
    To find out what characters need to be escaped, go into irb, then enter
    
    Regexp.escape "javascript:PC_7_0_G7_selectTerritory('0',%20'amend')"
    the escape sequences will be returned
    
    => "javascript:PC_7_0_G7_selectTerritory\\('0',%20'amend'\\)"
    note: use only one backslash; we are shown two, because they are escaped within a string,


How do I create an application/object map?
Insert the object recognition into a small method

    def login_link; $ie.link(:text, 'Log in'); end
    def username_field; $ie.text_field(:name, 'userid'); end
    then in your test class do:

    login_link.click
    username_field.set(username)


How do I take screenshots and append to a Word file?
    require 'watir'
    require 'win32ole'
    @@word=WIN32OLE.new('Word.Application')
    @@word.Documents.Add()
    
    def take_a_screenshot(url)
        @autoit = WIN32OLE.new("AutoItX3.Control")
        browser = Watir::IE.new
        browser.bring_to_front
        browser.goto(url)
        browser.maximize
        @autoit.Send("{PRINTSCREEN}")
        browser.close
        @@word.Selection.Paste
        @autoit.Send("{ENTER}")
    end
    
    def save_file
        @@word.ActiveDocument.SaveAs('C:\screenshots.doc')
        @@word.ActiveDocument.close
        @@word.Quit
    end
    
    take_a_screenshot('http://www.agiletester.co.uk')
    take_a_screenshot('http://www.fsf.org/')
    save_file


How do I delete all cookies
    require 'fileutils'
    class Cookies
        def delete(dir= "C:\Documents and Settings\#{ENV['USERNAME']}\Cookies")
        # or wherever your cookies are downloaded to (can be browser specific)
        FileUtils.rm_rf dir
        end
    end