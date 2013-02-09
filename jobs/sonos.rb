require 'sonos'

SONOS_DEVICE = Sonos::System.new.speakers.first

SCHEDULER.every '10s', :first_in => 0 do |job|
  # hack for disabling Savon logging
  savon_client = SONOS_DEVICE.instance_variable_get :@transport_client
  unless savon_client.nil?
    savon_client.globals[:log] = false
  end
  send_event('sonos', SONOS_DEVICE.now_playing)
end
