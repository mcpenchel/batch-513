require 'open-uri'
require 'nokogiri'

# Let's scrape recipes from http://www.epicurious.com

url = "https://www.imdb.com/chart/moviemeter/?ref_=nv_mv_mpm"

html_file = open(url).read
html_doc  = Nokogiri::HTML(html_file)

html_doc.search('.titleColumn').each do |element|
  # puts element.text.strip
  anchor = element.search('a')[0]
  puts anchor.text.strip
  puts anchor.attribute('title').value
  puts '------------------------------'
end
