def back_to_member_list
  @browser.element(css: 'span.ng-star-inserted').click
  sleep(5)
end

def save_member_details
  @browser.element(css: 'button.button-confirm.ygcc--md.ygcc-button').click
  sleep(5)
end

def cancel_member_details_update
  nil
end

def provide_personal_info(member_personal_info)
  upload_avatar = File.join(Dir.pwd, 'config/data/files', 'coffee.jpg')
  @browser.text_field(id: 'firstname').set(member_personal_info[:firts_name])
  @browser.text_field(id: 'lastname').set(member_personal_info[:last_name])
  @browser.element(css: 'input.ygcc-input__control.ng-star-inserted').send_keys(member_personal_info[:date_of_birth])
  @browser.element(css: 'input.upload-input').send_keys(upload_avatar)
  sleep(5)
  @browser.element(css: 'button.ygcc--primary.ygcc--md.ygcc-button').click
  sleep(5)
end

def provide_member_address(member_address)
  @browser.text_field(id: 'street').set(member_address[:street])
  @browser.text_field(id: 'city').set(member_address[:city])
  @browser.select_list(id: 'country').set(member_address[:country])
  @browser.select_list(id: 'state').set(member_address[:state])
  @browser.text_field(id: 'postcode').set(member_address[:postcode])
end

def provide_member_contact_info(member_contact_info)
  @browser.text_field(id: 'phone').set(member_contact_info[:phone])
  @browser.text_field(id: 'email').set(member_contact_info[:email])
  @browser.text_field(id: 'facebook').set(member_contact_info[:facebook])
  @browser.text_field(id: 'em_con_name').set(member_contact_info[:em_con_name])
  @browser.select_list(id: 'relationship').set(member_contact_info[:relationship])
  @browser.text_field(id: 'em_con_phone').set(member_contact_info[:em_con_phone])
end

def provide_availability
  null
end

def provide_bank_details
  null
end

def provide_work_data
  null
end

def provide_documents_info
  null
end

def provide_referral_details
  null
end
