class Dashing.Plex extends Dashing.Widget

  @accessor 'showsTop', ->
    shows = @get('shows')
    if shows then shows.slice(0, 10) else []

  @accessor 'moviesTop', ->
    movies = @get('movies')
    if movies then movies.slice(0, 10) else []

  @accessor 'updatedAtMessage', ->
    if updatedAt = @get('updatedAt')
      timestamp = new Date(updatedAt * 1000)
      hours = timestamp.getHours()
      minutes = ('0' + timestamp.getMinutes()).slice(-2)
      "Sist oppdatert #{hours}:#{minutes}"
