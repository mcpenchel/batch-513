require 'json'

filepath    = 'data/beers.json'

# Leitura (molezinha)

serialized_beers = File.read(filepath)
hash = JSON.parse(serialized_beers)

hash["beers"].delete_at(1) # removemos uma cerveja da hash
# não do arquivo!

# Agora sim do arquivo
File.open(filepath, 'wb') do |file|
  file.write(JSON.generate(hash))
end

# OBS: querendo fazer um append, segue o link para dar uma
# olhada => https://stackoverflow.com/questions/23292530/appending-the-data-in-json-file-using-ruby/23293518#23293518
