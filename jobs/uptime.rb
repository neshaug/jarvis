require 'yaml'

UPTIME_CONFIG = YAML.load_file(File.join(File.dirname(__FILE__), 'config.yml'))
DEVICES = UPTIME_CONFIG['uptime']['devices']

SCHEDULER.every '1m', :first_in => 0 do |job|

  DEVICES.each do |device|
    device['active'] = system('ping -c 1 -t 1 -q %s > /dev/null 2>&1' %
                              device['host'])
  end

  send_event('uptime', { devices: DEVICES })
end
