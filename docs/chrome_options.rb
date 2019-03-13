b = Watir::Browser.new :chrome, opts

b = Watir::Browser.new :chrome, headless: true

prefs = {
  download: {
    prompt_for_download: false,
    default_directory: '/path/to/dir'
  }
}

b = Watir::Browser.new :chrome, options: {prefs: prefs}

args = ['--ignore-certificate-errors', '--disable-popup-blocking', '--disable-translate']
b = Watir::Browser.new :chrome, options: {args: args}

b = Watir::Browser.new :chrome, options: {options: {detach: true}}

# start on remote machine
Watir::Browser.new :chrome url: "http://#{the_grid_url}:4444/wd/hub"