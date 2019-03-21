require 'spec_helper'
require 'watir'
require 'rspec'
require './mvc/controller/wd/team member/team_member_list_actions'
require './mvc/controller/wd/team member/edit member/edit_team_member_personal_details'
require './mvc/model/team_member_model'

include RSpec::Expectations

describe 'User' do
  it 'should create new Team Member', story: 'first' do |e|
    e.step 'open Team Member section and check it is opened' do
      open_team_member_section
      expect(@browser.element(css: 'h2.page-title').text).to eq('Team Member Details')
    end
    e.step 'open Create Team Member and check it is opened' do
      open_create_team_member
      expect(@browser.element(css: 'div.page-title').text).to eq('Team Member Details: ')
    end
    e.step "provide Team Member personal info and check Member First Name is #{$member_fn}" do
      provide_personal_info($member_fn, $member_ln, $member_dob)
      expect(@browser.text_field(id: 'firstname').value).to eq($member_fn)
    end
    e.step 'save Team Member details and check Success notification appears' do
      save_team_member_details
      expect(@browser.element(css: 'div.ygcc-notification__message').text).to eq('Details have been saved successfully')
    end
    e.step 'back to member list' do
      back_to_member_list
      expect(@browser.element(css: 'h2.page-title').text).to eq('Team Member Details')
    end
  end
  it 'edit member', story: 'second' do |e|
    e.step 'open Team Member section and check it is opened' do
      open_team_member_section
      expect(@browser.element(css: 'h2.page-title').text).to eq('Team Member Details')
    end
    e.step "open #{$member_name} to edit" do
      search_member_by_name($member_name)
      open_edit_member_record($member_name)
    end
    e.step 'back to member list' do
      back_to_member_list
      expect(@browser.element(css: 'h2.page-title').text).to eq('Team Member Details')
    end
  end
  it 'should be able to see Team Member List', story: 'third' do |e|
    e.step 'Open Team Member section' do
      null
      # Team Member Details page should be opened
    end
    e.step 'List of team members should be displayed' do

    end
    e.step 'Inactive members should be greyed' do
      null
    end
    e.step 'Each member panel should contain' do
      null
      # Userpic
      # Full Name
      # Place of last worked shift (Area, Location, Site)
      # Email
      # Phone
      # Status
      # Active - empty
      # Inactive - text
      # New - text
    end
    e.step 'Filter options with amount of employees should be present and available' do
      null
      # All Employees
      # Active
      # Inactive
      # New
    end
    e.step 'Sorting options should be present and available' do
      null
      # First Name
      # Last Name
      # Site
      # Asc (A-Z)
      # Desc (Z-A)
    end
    e.step 'Search option should be present and available' do
      search_member_by_name(@member_name)
    end
    e.step 'Create new button should be present and available' do
      null
    end
    e.step 'Paging option should be present and available' do
      null
      # First
      # Prev
      # Page Number
      # Next
      # Last
    end
    e.step 'Grouping option should be present and available' do
      null
      # 10
      # 20
      # 50
    end
    e.step 'Default filter values should be' do
      null
      # All employees
      # First Name
      # Acs (A-Z)
      # 1st page
      # 10 per page
      # Amount of employees based on the selected filters should be displayed
      # It should be possible expand/collapse Team Member record
    end
    e.step 'Hover Asc icon and tooltip with Sort: A-Z text appears' do
      hover_element(@sort_ascending)
      expect(@browser.element(css: 'div.tooltip-inner').text).to eq('Sort: A-Z')
    end
    e.step 'Hover Desc option' do
      null
      # Tooltip with appropriate text should appear
    end
    e.step 'Select Active Member filter' do
      null
    end
    e.step 'Hover Member record' do
      null
      # Next Actions should be displayed and available
      # Location
      # Email
      # Phone
      # Edit
      # Terminate
      # Expand
    end
    e.step 'Hover Member action' do
      null
      # Tooltip with appropriate text should appear
    end
  end
end
