

class TeamMemberList

    def initialize(browser)
      @browser = browser
    end
    
    def open_create_team_member
      @browser.button(:css, 'button').click
    end
    
end