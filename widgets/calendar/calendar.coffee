class Dashing.Calendar extends Dashing.Widget

  ready: ->

  onData: (data) ->

  @accessor 'upcoming', ->
    @get('events').slice 0, 4

  @accessor 'updatedAtMessage', ->
    if updatedAt = @get('updatedAt')
      timestamp = new Date(updatedAt * 1000)
      hours = timestamp.getHours()
      minutes = ("0" + timestamp.getMinutes()).slice(-2)
      "Sist oppdatert #{hours}:#{minutes}"
