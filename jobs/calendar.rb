require 'google/api_client'
require 'yaml'

oauth_yaml = YAML.load_file(File.join(File.dirname(__FILE__), 'config.yml'))
client = Google::APIClient.new
client.authorization.client_id = oauth_yaml['calendar']['client_id']
client.authorization.client_secret = oauth_yaml['calendar']['client_secret']
client.authorization.scope = oauth_yaml['calendar']['scope']
client.authorization.refresh_token = oauth_yaml['calendar']['refresh_token']
client.authorization.access_token = oauth_yaml['calendar']['access_token']

if client.authorization.refresh_token && client.authorization.expired?
    client.authorization.fetch_access_token!
end

service = client.discovered_api('calendar', 'v3')

SCHEDULER.every '15m', :first_in => 0 do |job|
  result = client.execute(:api_method => service.events.list, :parameters => {
    'calendarId' => 'primary',
    'orderBy' => 'startTime',
    'singleEvents' => true,
    'timeMin' => Time.now.strftime('%FT%T.%LZ')
  })

  data = []
  result.data.items.each do |event|
    data.push({
      'summary' => event.summary,
      'start' => event.start.dateTime.strftime('%d.%m %H:%M')
    })
  end

  send_event('calendar', { events: data })
end
