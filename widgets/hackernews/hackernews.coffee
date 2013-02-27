class Dashing.Hackernews extends Dashing.Widget

  @accessor 'top', ->
    items = @get('items')
    item_count = Math.ceil(Dashing.widget_base_dimensions[1] / 50)
    if items then items.slice 0, item_count else []

  @accessor 'updatedAtMessage', ->
    if updatedAt = @get('updatedAt')
      timestamp = new Date(updatedAt * 1000)
      hours = timestamp.getHours()
      minutes = ('0' + timestamp.getMinutes()).slice(-2)
      "Sist oppdatert #{hours}:#{minutes}"

