require 'json'
require 'net/http'
require 'uri'

HN_API_URI = URI.parse('http://api.ihackernews.com/page')

SCHEDULER.every '10m', :first_in => 0 do |job|
  response = Net::HTTP.get_response(HN_API_URI)

  body = response.body
  if response.code == '200' and body.length > 0
    data = JSON.parse(body)
  else
    data = {}
  end

  send_event('hackernews', data)
end
