class Dashing.Calendar extends Dashing.Widget

  @accessor 'upcoming', ->
    events = @get('events')
    item_count = Math.ceil(Dashing.widget_base_dimensions[1] / 100) + 1
    if events then events.slice 0, item_count else []

  @accessor 'updatedAtMessage', ->
    if updatedAt = @get('updatedAt')
      timestamp = new Date(updatedAt * 1000)
      hours = timestamp.getHours()
      minutes = ('0' + timestamp.getMinutes()).slice(-2)
      "Sist oppdatert #{hours}:#{minutes}"
