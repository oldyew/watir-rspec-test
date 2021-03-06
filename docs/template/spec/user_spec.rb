require 'spec_helper'

module AddressBook
  include Page

  describe 'User' do

    let(:user) { Model::User.new }
    let(:site) { Site.new }
       
    after { Site.user = nil }

    it 'signs up' do
      SignUp.visit.submit_form(user)
      expect(site.logged_in?(user)).to eq true
    end

    it 'login' do
      site.create_user(user)

      SignIn.visit.submit_form(user)

      expect(site.logged_in?(user)).to eq true
    end

    it 'logout' do
      site.login(user)

      Home.visit.sign_out_user

      expect(site.logged_in?(user)).to eq false
    end
  end
end
