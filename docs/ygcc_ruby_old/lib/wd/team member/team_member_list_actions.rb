def open_team_member_section
  @browser.goto 'https://ygcc-qa-portal.azurewebsites.net/employees'
  sleep(5)
end

def search_member(search_name)
  @browser.element(placeholder: 'Search Employee').send_keys(search_name)
  sleep(5)
end

def sort_member_by(sort, sort_filter)
  nil
end

def filter_members(member_filter)
  nil
end

def member_list_navigate(page, page_number, page_filter)
  nil
end
