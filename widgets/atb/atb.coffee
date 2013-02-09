class Dashing.Atb extends Dashing.Widget

  ready: ->

  onData: (data) ->

  @accessor 'first', ->
    @get('departures')[0]

  @accessor 'rest', ->
    @get('departures').slice 1, 4

  @accessor 'updatedAtMessage', ->
    if updatedAt = @get('updatedAt')
      timestamp = new Date(updatedAt * 1000)
      hours = timestamp.getHours()
      minutes = ("0" + timestamp.getMinutes()).slice(-2)
      "Sist oppdatert #{hours}:#{minutes}"
