require 'rest-client'
require 'faker'
require 'json'
service_url = ''
response = RestClient.get "http://www.thomas-bayer.com/sqlrest/CUSTOMER"
response = RestClient.delete "http://www.thomas-bayer.com/sqlrest/CUSTOMER/7777"
response = RestClient.post "http://www.thomas-bayer.com/sqlrest/CUSTOMER/2","<CUSTOMER><CITY>#{new_city}</CITY></CUSTOMER>"
puts response.code
expect(response.code).to eq(200)
puts response.headers
puts response.body


expect(response).to include("<deleted>7777</deleted>")


new_city = Faker::Address.city


country = "AU"
postcode = "4051"
response = RestClient.get "http://api.geonames.org/postalCodeLookupJSON?postalcode=#{postcode}&country=#{country}&username=demo"
json_obj = JSON.parse(response)
expect(json_obj["postalcodes"].collect{|x| x["placeName"]}).to eq(["Alderley", "Enoggera", "Gaythorne", "Grange", "Newmarket", "Wilston"])

new_id = 101
new_title = "Foo"
json_request = <<END_OF_MESSAGE
{
"userId": 1,
"id": #{new_id},
"title": "#{new_title}",
"body": "some data"
}
END_OF_MESSAGE

ws_url = "http://jsonplaceholder.typicode.com/posts"
response = RestClient.post(ws_url, json_request)
expect(response.body).to include("#{new_id}")
json_request.gsub!("101", "10")
response = RestClient.put(ws_url + "/10", json_request)

uri = "http://finance.yahoo.com/webservice/v1/symbols/YHOO,AAPL/quote?format=json&view=detail"
http = HTTPClient.new
resp = http.get(uri)
json_str = resp.content

json_obj = JSON.parse(json_str)
expect(json_obj["list"]["meta"]["count"]).to eq(2)
yahoo_share_day_high = json_obj["list"]["resources"][0]["resource"]["fields"]["day_low"].to_f
apple_share_day_high = json_obj["list"]["resources"][1]["resource"]["fields"]["day_high"].to_f
puts yahoo_share_day_low
puts apple_share_day_high
raise "I wish I bought Apple Share exception" if apple_share_day_high > 150

json_obj = JSON.parse('{"staff":[ {"firstName":"John", "lastName":"Daw"}, {"firstName":"Tom", "lastName":"Jones"}]}')
formatted_json = JSON.pretty_generate(json_obj)
puts formatted_json
File.open("tmp.json", "w").write("formatted_json")

require 'tiny_tds' # gem install tiny_tds
client = TinyTds::Client.new(
  :username => '',
  :password => '',
  :host => '',
  :database => "")
result = client.execute("SELECT * FROM USERS where clinic_id = 9")
result.each do |row|

end
client.close


require 'rest-client'
require 'faker'
require 'json'

service_url = ''
delete_method = 'ApiEmployeesByIdDelete'
get_by_id_method


response = RestClient.get "http://www.thomas-bayer.com/sqlrest/CUSTOMER"
response = RestClient.delete "http://www.thomas-bayer.com/sqlrest/CUSTOMER/7777"
response = RestClient.post "http://www.thomas-bayer.com/sqlrest/CUSTOMER/2","<CUSTOMER><CITY>#{new_city}</CITY></CUSTOMER>"
puts response.code
expect(response.code).to eq(200)
puts response.headers