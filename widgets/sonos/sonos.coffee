class Dashing.Sonos extends Dashing.Widget

  ready: ->

  onData: (data) ->

  @accessor 'updatedAtMessage', ->
    if updatedAt = @get('updatedAt')
      timestamp = new Date(updatedAt * 1000)
      hours = timestamp.getHours()
      minutes = ("0" + timestamp.getMinutes()).slice(-2)
      "Sist oppdatert #{hours}:#{minutes}"
