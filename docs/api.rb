require 'httparty'

class TestyApi
  include HTTParty
  base_uri 'edutechional-resty.herokuapp.com/'

  def posts
    self.class.get('/posts.json')
  end
end

edu_resty = TestyApi.new
puts edu_resty.posts
