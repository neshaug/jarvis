class Dashing.Plex extends Dashing.Widget

  @accessor 'showsTop', ->
    shows = @get('shows')
    item_count = Math.ceil Dashing.widget_base_dimensions[1] / 40
    if shows then shows.slice 0, item_count else []

  @accessor 'moviesTop', ->
    movies = @get('movies')
    item_count = Math.ceil Dashing.widget_base_dimensions[1] / 40
    if movies then movies.slice 0, item_count else []

  @accessor 'updatedAtMessage', ->
    if updatedAt = @get('updatedAt')
      timestamp = new Date(updatedAt * 1000)
      hours = timestamp.getHours()
      minutes = ('0' + timestamp.getMinutes()).slice(-2)
      "Sist oppdatert #{hours}:#{minutes}"
