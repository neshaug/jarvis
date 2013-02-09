require 'nokogiri'
require 'open-uri'
require 'yaml'

YR_CONFIG = YAML.load_file(File.join(File.dirname(__FILE__), 'config.yml'))

SCHEDULER.every '15m', :first_in => 0 do |job|
  doc = Nokogiri::XML(open(YR_CONFIG['yr']['url']))
  tabular = doc.xpath('/weatherdata/forecast/tabular/time[1]')
  windSpeed = tabular.xpath('windSpeed')
  data = {
    'location' => doc.xpath('/weatherdata/location/name').text,
    'from' => tabular.attr('from').value,
    'to' => tabular.attr('to').value,
    'temperature' => tabular.xpath('temperature').attr('value').value,
    'description' => tabular.xpath('symbol').attr('name').value,
    'windSpeed' => windSpeed.attr('mps').value,
    'windDesc' => windSpeed.attr('name').value
  }
  send_event('yr', data)
end
