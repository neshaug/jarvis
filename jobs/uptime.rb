require 'net/ping'
require 'yaml'

UPTIME_CONFIG = YAML.load_file(File.join(File.dirname(__FILE__), 'config.yml'))
DEVICES = UPTIME_CONFIG['uptime']['devices']

PING = Net::Ping::External.new
PING.timeout = 1

SCHEDULER.every '1m', :first_in => 0 do |job|

  DEVICES.each do |device|
    device['active'] = PING.ping(device['host'])
  end

  send_event('uptime', { devices: DEVICES })
end
