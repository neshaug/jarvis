require 'sonos'

SONOS_DEVICE = Sonos::System.new.speakers.first

SCHEDULER.every '10s', :first_in => 0 do |job|
  # hack that disables Savon logging
  savon_client = SONOS_DEVICE.instance_variable_get :@transport_client
  unless savon_client.nil?
    savon_client.globals[:log] = false
  end
  data = {
    'name' => SONOS_DEVICE.name,
    'np' => SONOS_DEVICE.now_playing
  }
  send_event('sonos', data)
end
