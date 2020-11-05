require 'byebug'
require 'csv'

# require_relative é relativo ao arquivo onde executamos
# esta linha de código.

require_relative '../models/meal'

class MealRepository

  def initialize(csv_file_path)
    @csv_file_path = csv_file_path

    # File.exist?(@csv_file_path)
    @meals = []

    load_csv if File.exist?(@csv_file_path)
  end

  def all
    @meals
  end

  def create(meal)
    next_id = @meals.empty? ? 1 : @meals.last.id + 1
    meal.id = next_id

    @meals << meal

    save_csv
  end

  def find(id)
    @meals.find { |meal| meal.id == id }
  end

  private
  def save_csv
    csv_options = {
      col_sep: ',',
      quote_char: '"',
      force_quotes: true
    }

    CSV.open(@csv_file_path, 'wb', csv_options) do |csv|
      csv << ['id', 'name', 'price']

      @meals.each do |meal|
        csv << [meal.id, meal.name, meal.price]
      end
    end
  end

  def load_csv
    csv_options = {
      col_sep: ',',
      quote_char: '"',
      headers: :first_row,
      header_converters: :symbol
    }

    CSV.foreach(@csv_file_path, csv_options) do |row|
      row[:id]    = row[:id].to_i
      row[:price] = row[:price].to_i

      @meals << Meal.new(row)
    end
  end

end

# repo = MealRepository.new('data/meals.csv')
# repo.all.each do |meal|
#   puts "#{meal.id} - #{meal.name} - #{meal.price}"
# end

# meal = repo.find(3)
# puts meal.name

# meal = Meal.new(
#   name: "Baião de dois",
#   price: 80
# )

# repo.create(meal)
