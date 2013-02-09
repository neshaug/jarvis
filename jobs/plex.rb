require 'nokogiri'
require 'open-uri'
require 'yaml'

PLEX_CONFIG = YAML.load_file(File.join(File.dirname(__FILE__), 'config.yml'))
URL_SHOWS = PLEX_CONFIG['plex']['shows']
URL_MOVIES = PLEX_CONFIG['plex']['movies']

SCHEDULER.every '30m', :first_in => 0 do |job|
  doc_shows = Nokogiri::XML(open(URL_SHOWS))
  doc_movies = Nokogiri::XML(open(URL_MOVIES))

  data = {
    'shows' => [],
    'movies' => []
  }

  doc_shows.xpath('/MediaContainer/Video').each do |show|
    data['shows'].push({
      'name' => show.attr('grandparentTitle'),
      'title' => show.attr('title'),
      'episode' => '%02d' % show.attr('index'),
      'season' => '%02d' % show.attr('parentIndex')
    })
  end

  doc_movies.xpath('/MediaContainer/Video').each do |movie|
    data['movies'].push({
      'title' => movie.attr('title'),
      'year' => movie.attr('year')
    })
  end

  send_event('plex', data)
end
