class Dashing.Time extends Dashing.Widget

  ready: ->
    setInterval(@startTime, 500)

  startTime: =>
    today = new Date()

    h = today.getHours()
    m = today.getMinutes()
    s = today.getSeconds()
    h = @formatTime(h)
    m = @formatTime(m)
    y = today.getFullYear()
    @set('time', h + ":" + m)
    @set('date', today.getDate() + ". " + @getMonthName(today) + " " + y)
    @set('day', @getDayName(today))

  getDayName: (date) =>
    ['søndag', 'mandag', 'tirsdag', 'onsdag', 'torsdag', 'fredag',
      'lørdag'][date.getDay()]

  getMonthName: (date) =>
    ['januar', 'februar', 'mars', 'april', 'mai', 'juni', 'juli', 'august',
      'september', 'oktober', 'november', 'desember'][date.getMonth()]

  formatTime: (i) ->
    if i < 10 then "0" + i else i
