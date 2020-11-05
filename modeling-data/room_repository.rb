require 'csv'
require_relative 'room'

class RoomRepository

  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @rooms = []

    load_csv
  end

  def all
    @rooms
  end

  def find(id)
    @rooms.find { |room| room.id == id }
  end

  private
  def load_csv
    csv_options = {
      quote_char: '"',
      col_sep: ',',
      headers: :first_row
    }

    CSV.foreach(@csv_file_path, csv_options) do |row|
      row[:id] = row['id'].to_i
      row[:capacity] = row['capacity'].to_i
      row[:number] = row['number']

      room = Room.new(row)
      @rooms << room
    end
  end

end


# repo = RoomRepository.new('rooms.csv')

# repo.all.each do |room|
#   puts "ID: #{room.id} - #{room.number} - capacity: #{room.capacity}"
# end

# a32 = repo.find(1)
# puts a32.number
