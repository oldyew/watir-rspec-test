def open_create_team_member
  @browser.element(css: 'div.create-new-button').click
  sleep(5)
end

def open_edit_member_record(edit_name)
  @browser.element(css: 'span.employee-edit-icon').click
end

def terminate_team_member(terminate_name)
  nil
end

def activate_team_member(activate_name)
  nil
end

def hover_element(hover_record)
  @browser.element(css: hover_record.to_s).hover
end

def review_member(record_state = 'expand')
  nil
end

def member_view_open_section(view_section_name)
  nil
end

