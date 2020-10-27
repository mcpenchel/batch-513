require 'json'
require 'open-uri'

url = 'https://api.github.com/users/ssaunier'
file = open(url).read
hash = JSON.parse(file)
puts hash['name']

# Chuck Norris API
# url = 'https://api.chucknorris.io/jokes/random'

# file = open(url).read

# hash = JSON.parse(file)

# puts hash['value']
