#!/usr/bin/env rspec
require "watir"
require "webdriver_manager"
require "rspec"
#require "pry"
require 'allure-rspec'
#require 'parallel_tests'
require "methods.rb"

#include RSpec::Matchers



describe 'YGCC Regression Test' do
  #Start Actions  
    before :all do

      RSpec.configure do |c|
        c.include AllureRSpec::Adaptor
      end
      
      AllureRSpec.configure do |c|
        c.output_dir = "results"
        c.clean_dir = false
        c.logging_level = false
      end

      launch

    end
    #before :step do |s|
      #puts "Before step #{s.current_step}"
    #end
  #Team Member Section Test Cases  
    describe 'Team Member Section' do
      describe 'Team Member List' do
        describe 'Activate Member' do
          it 'STEP: does something' do
            nil
          end
        end
        describe 'Terminate Member' do
          it 'STEP: does something' do
            nil
          end
        end
        describe 'Filter Member List' do
          it 'STEP: All members' do
            nil
          end
          it 'STEP: Active members' do
            nil
          end
          it 'STEP: Inactive members' do
            nil
          end
          it 'STEP: New members' do
            nil
          end
        end
        describe 'Sort Member List' do
          it 'STEP: Firts Name Ascending' do
            nil
          end
          it 'STEP: Last Name Descending' do
            nil
          end
          it 'STEP: Site' do
            nil
          end
          it 'STEP: does something' do
            nil
          end
        end
        describe 'Search Members' do
          it 'STEP: does something' do
            nil
          end
        end
        describe 'Paging Member List' do
          it 'STEP: First Page' do
            nil
          end
          it 'STEP: Last Page' do
            nil
          end
          it 'STEP: Previous Page' do
            nil
          end
          it 'STEP: Next Page' do
            nil
          end
          it 'STEP: Page number' do
            nil
          end
          it 'STEP: Member Amount per Page' do
            nil
          end
        end
        describe 'View Member Details' do
          describe 'Member Record Header' do
            it 'STEP: does something' do
              nil
            end
          end
          describe 'Member Record Details' do
            describe 'Personal Details' do
              it 'STEP: Main Info' do
                nil
              end
              it 'STEP: Summary' do
                nil
              end
              it 'STEP: Address' do
                nil
              end
              it 'STEP: Contact Info' do
                nil
              end
              it 'STEP: Availability' do
                nil
              end
              it 'STEP: Bank' do
                nil
              end
              it 'STEP: Work Data' do
                nil
              end
              it 'STEP: Legal Documents' do
                nil
              end
              it 'STEP: Referral Details' do
                nil
              end
            end
            describe 'Allocation' do
              it 'STEP: does something' do
                nil
              end
            end
            describe 'Pay History' do
              it 'STEP: View Pay History' do
                nil
              end
              it 'STEP: Print Report' do
                nil
              end
              it 'STEP: Email Report' do
                nil
              end
            end
            describe 'Adjustments' do
              it 'STEP: View Adjustments' do
                nil
              end
            end
            describe 'Training' do
              it 'STEP: View YG Inductions' do
                nil
              end
              it 'STEP: View Site Inductions' do
                nil
              end
              it 'STEP: View Tranings' do
                nil
              end
            end
            describe 'Leaves' do
              it 'STEP: View Leaves' do
                nil
              end
            end
          end
        end
      end
      describe 'Team Member Details' do
        describe 'Create new member' do
          it "STEP: open_team_member_section", :story => "<Story Name>", :severity => :critical, :testId => 99 do
            open_team_member_section
          end
          it "STEP: open_create_team_member" do
            open_create_team_member
          end
          it "STEP: provide_personal_info" do
            provide_personal_info
          end
          it "STEP: save_team_member_details" do
            save_team_member_details
          end
        end
        describe 'Create active member' do
          it 'STEP: Main Info' do
            nil
          end
        end
        describe 'Create member with all info' do
          it 'STEP: Main Info' do
            nil
          end
        end
        describe 'Edit active member' do
          describe 'Personal Details' do
            it 'STEP: Personal Info' do
              nil
            end
            it 'STEP: Address' do
              nil
            end
            it 'STEP: Contact Info' do
              nil
            end
            it 'STEP: Availability' do
              nil
            end
            it 'STEP: Bank' do
              nil
            end
            it 'STEP: Work Data' do
              nil
            end
            it 'STEP: Legal Documents' do
              nil
            end
            it 'STEP: Referral Details' do
              nil
            end
          end
          describe 'Allocation' do
            describe 'Allocate Member' do
              it 'STEP: does something' do
                nil
              end
            end
            describe 'Remove Member Allocation' do
              it 'STEP: does something' do
                nil
              end
            end
            describe 'Change Member Allocation' do
              it 'STEP: does something' do
                nil
              end
            end
          end
          describe 'Adjustments' do
            describe 'Add Adjustment' do
              it 'STEP: does something' do
                nil
              end
            end
            describe 'Remove Adjustment' do
              it 'STEP: does something' do
                nil
              end
            end
            describe 'Update Adjustment' do
              it 'STEP: does something' do
                nil
              end
            end
            describe 'Add Different Adjustments' do
              it 'STEP: does something' do
                nil
              end
            end
          end
          describe 'Training' do
            describe 'Add Training' do
              it 'STEP: does something' do
                nil
              end
            end
            describe 'Remove Training' do
              it 'STEP: does something' do
                nil
              end
            end
            describe 'Update Training' do
              it 'STEP: does something' do
                nil
              end
            end
            describe 'Add Different Trainings' do
              it 'STEP: does something' do
                nil
              end
            end
          end
          describe 'Leaves' do
            describe 'Add Leave' do
              it 'STEP: does something' do
                nil
              end
            end
            describe 'Remove Leave' do
              it 'STEP: does something' do
                nil
              end
            end
            describe 'Update Leave' do
              it 'STEP: does something' do
                nil
              end
            end
            describe 'Add Different Leaves' do
              it 'STEP: does something' do
                nil
              end
            end
          end
        end
      end
    end
  #Shift Rostering Section Test Cases  
    describe 'Shift Rostering Section' do
      describe '<What>' do
        it 'STEP: does something' do
          nil
        end  
      end
    end
    describe '<Where>' do
      describe '<What>' do
        it 'STEP: does something' do
          nil
        end
      end
    end
  #Customer Section
    describe 'Customer Section' do
        describe '<What>' do
          it 'STEP: does something' do
            nil
          end
        end
    end
    describe '<Where>' do
      describe '<What>' do
        it 'STEP: does something' do
          nil
        end
      end
    end
  #Final Actions  
    after :all do
      @browser.quit
    end
end