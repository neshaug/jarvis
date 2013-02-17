class Dashing.Atb extends Dashing.Widget

  @accessor 'first', ->
    departures = @get('departures')
    if departures and departures.length > 0 then departures[0] else null

  @accessor 'rest', ->
    departures = @get('departures')
    item_count = Math.ceil(Dashing.widget_base_dimensions[1] / 100)
    if departures then departures.slice 1, item_count else []

  @accessor 'remainingMessage', ->
    remaining = @get('first')?.remaining or 0
    unit = if remaining > 1 then 'minutter' else 'minutt'
    "om #{remaining} #{unit}"

  @accessor 'updatedAtMessage', ->
    if updatedAt = @get('updatedAt')
      timestamp = new Date(updatedAt * 1000)
      hours = timestamp.getHours()
      minutes = ('0' + timestamp.getMinutes()).slice(-2)
      "Sist oppdatert #{hours}:#{minutes}"
