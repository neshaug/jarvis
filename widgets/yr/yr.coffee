class Dashing.Yr extends Dashing.Widget

  @accessor 'updatedAtMessage', ->
    if updatedAt = @get('updatedAt')
      timestamp = new Date(updatedAt * 1000)
      hours = timestamp.getHours()
      minutes = ('0' + timestamp.getMinutes()).slice(-2)
      "Sist oppdatert #{hours}:#{minutes}"

  @accessor 'windDirection', ->
    @get('wind')?.direction.toLowerCase()
