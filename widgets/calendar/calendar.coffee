class Dashing.Calendar extends Dashing.Widget

  @accessor 'upcoming', ->
    events = @get('events')
    if events then events.slice 0, 4 else []

  @accessor 'updatedAtMessage', ->
    if updatedAt = @get('updatedAt')
      timestamp = new Date(updatedAt * 1000)
      hours = timestamp.getHours()
      minutes = ('0' + timestamp.getMinutes()).slice(-2)
      "Sist oppdatert #{hours}:#{minutes}"
