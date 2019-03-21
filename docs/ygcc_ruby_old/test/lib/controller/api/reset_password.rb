# require 'httpclient'
require 'rest-client'

url = 'https://ygcc-qa-dataservice.azurewebsites.net/api'

send_temp_pass = '/sendtemporarypassword'
json_email = <<END_OF_MESSAGE
{
  "EmailOrPhone":"oldyew@gmail.com"
}
END_OF_MESSAGE

RestClient.post(url + send_temp_pass, json_email)

# login_temp_pass = '/loginwithtemporarypassword'
# json_temppass_email = <<END_OF_MESSAGE
# {
#   "EmailOrPhone":"email",
#   "TemporaryPassword":"team_pass"
# }
# END_OF_MESSAGE

# RestClient.post(url + login_temp_pass, json_temppass_email)

require 'uri'
require 'net/http'

url = URI("https://ygcc-qa-dataservice.azurewebsites.net/api/sendtemporarypassword")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Post.new(url)
request["Content-Type"] = 'application/json'
request["cache-control"] = 'no-cache'
request["Postman-Token"] = 'cd75f9ee-db9a-4a31-b155-31ad0a677218'
request.body = "{\r\n  \"EmailOrPhone\":\"oldyew@gmail.com\"\r\n}"

response = http.request(request)
puts response.read_body