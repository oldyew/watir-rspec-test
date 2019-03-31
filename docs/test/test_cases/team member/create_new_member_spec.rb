require '../../../config/setup'
require 'rspec'

describe 'User' do
  
    describe 'create new member' do
  
        it 'open Shift Rostering section' do
            @app.open_team_member_section
            @app.open_create_team_member
            #@app.provide_personal_info
            #@app.save_team_member_details
        end
    
    end

end
