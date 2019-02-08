#https://github.com/vbanthia/rspec_html_reporter

#Adding screenshot when test is failed
config.after do |example|
    if example.exception
      example.metadata[:failed_screenshot] = screenshot_rel_path(take_screenshot)
    end
  end

  #Adding screenrecord for each test
  config.before do |example|
    start_screenrecord
  end
  
  config.after do |example|
    stop_screenrecord
    example.metadata[:screenrecord] = screenrecord_rel_path(pull_screenrecord)
  end