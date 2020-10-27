require 'csv'
require 'byebug'

filepath    = 'data/beers.csv'

# Leitura sem opções, lendo como array

beers = []

CSV.foreach(filepath) do |row|
  # row é a linha que estamos parseando
  puts "#{row[0]} - #{row[1]} - #{row[2]}"
  beers << row
end

# Leitura com opções, lendo como "hash"

csv_options = {
  col_sep: ',',
  quote_char: '"',
  headers: :first_row # Faz com que possamos ler row como hash
}

CSV.foreach(filepath, csv_options) do |row|
  # row é a linha que estamos parseando
  puts "#{row['Name']} - #{row['Appearance']} - #{row['Origin']}"
end

# Escrita

csv_options = {
  col_sep: ',',
  quote_char: '"',
  force_quotes: true
}

# opções:
# a => append
# wb => write binary (write from beginning)

# Atenção: esse bloco NÃO é uma iteração
# CSV.open(filepath, 'a', csv_options) do |csv|
#   csv << ["Brahma", "Pilsen", "Brazil"]
# end

beers.delete_at(2)

# [["Name", "Appearance", "Origin"], ["Stella", "Lager", "Belgium"]]

CSV.open(filepath, 'wb', csv_options) do |csv|
  beers.each do |beer_array|
    csv << beer_array
  end
end
