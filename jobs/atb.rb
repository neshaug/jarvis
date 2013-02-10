require 'json'
require 'net/http'
require 'uri'
require 'yaml'

CONFIG = YAML.load_file(File.join(File.dirname(__FILE__), 'config.yml'))

ATB_URI = URI.parse(CONFIG['atb']['url'])

SCHEDULER.every '1m', :first_in => 0 do |job|
  response = Net::HTTP.get_response(ATB_URI)

  body = response.body
  if response.code == '200' and body.length > 0
    data = JSON.parse(body)
    data['departures'].each do |departure|
      time = Time.parse(departure['registeredDepartureTime'].split('T').last)
      remaining = ((time - Time.now) / 60).floor
      departure['hour'] = time.strftime('%H')
      departure['minute'] = time.strftime('%M')
      departure['remaining'] = remaining < 0 ? 0 : remaining
    end
  else
    data = {}
  end

  send_event('atb', data)
end
