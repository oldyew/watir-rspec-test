require '../../../config/setup'
require 'rspec'

describe 'User' do
  
    describe 'create simple shift without offers sending' do
  
        it 'open Shift Rostering section' do
            @app.open_shift_rostering
        end
    
    end

end
