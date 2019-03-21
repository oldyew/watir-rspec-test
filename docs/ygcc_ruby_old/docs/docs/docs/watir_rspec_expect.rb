expect(result).to
expect(list).not_to

expect(@browser.text_field(name: 'first_name')).to exist.within(2)
expect(@browser.text_field(name: 'first_name')).to be_present.within(2)
expect(@browser.text_field(name: 'first_name')).to be_visible.within(2)
expect(@browser.text_field(name: 'first_name')).to exist.during(2)
