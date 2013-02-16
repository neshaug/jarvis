class Dashing.Atb extends Dashing.Widget

  @accessor 'first', ->
    departures = @get('departures')
    if departures and departures.length > 0 then departures[0] else null

  @accessor 'rest', ->
    departures = @get('departures')
    if departures then departures.slice 1, 4 else []

  @accessor 'remainingMessage', ->
    remaining = @get('first').remaining
    unit = if remaining > 1 then 'minutter' else 'minutt'
    "om #{remaining} #{unit}"

  @accessor 'updatedAtMessage', ->
    if updatedAt = @get('updatedAt')
      timestamp = new Date(updatedAt * 1000)
      hours = timestamp.getHours()
      minutes = ('0' + timestamp.getMinutes()).slice(-2)
      "Sist oppdatert #{hours}:#{minutes}"
