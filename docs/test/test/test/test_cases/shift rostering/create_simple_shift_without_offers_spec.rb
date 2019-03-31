require '../../../config/setup'
require 'rspec'

describe 'User' do
  
    describe 'create simple shift without offers sending' do
  
        it 'open Shift Rostering section' do
            @app.open_shift_rostering
        end
    
        it 'specify work site' do
            #select area
            #select location
            #select site
            #expect dashboard with the site appears
        end
        
        it 'add shift to any available date' do
            #select slot
            #expect shift toolbar is opened
            #expect add shift time tab is opened and available
        end
        
        it 'define and save shift name and time' do
            #select name
            #specify name
            #select start time
            #specify time
            #select end time
            #specify time
            #select break
            #specify break
            #save
            #expect specified name and time are displayed (saved?)
        end
    
        it 'define and save shift positions' do
            #open positions
            #specify positions
            #save
            #expect specified positions are displayed (saved?)
        end
    
        it 'add and save team members' do
            #open mambers
            #specify members
            #save
            #expect specified members are displayed
        end
    
    end

end
