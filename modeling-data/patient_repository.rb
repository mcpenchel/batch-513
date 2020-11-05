require 'csv'
require_relative 'patient'

class PatientRepository

  def initialize(csv_file_path, room_repository)
    @csv_file_path = csv_file_path
    @room_repository = room_repository
    @patients = []

    load_csv
  end

  def add(patient)
    new_id = @patients.empty? ? 1 : @patients.last.id + 1
    patient.id = new_id # por essa linha que temos o accessor id

    @patients << patient

    save_csv
  end

  def all
    @patients
  end

  private
  def save_csv
    csv_options = {
      quote_char: '"',
      col_sep: ',',
      force_quotes: true
    }

    CSV.open(@csv_file_path, 'wb') do |csv|

      csv << ["id","name","age","disease","cured","room_id"]

      @patients.each do |patient|
        csv << [patient.id, patient.name, patient.age, patient.disease, patient.cured?, patient.room.id]
      end

    end
  end

  def load_csv
    csv_options = {
      quote_char: '"',
      col_sep: ',',
      headers: :first_row
    }

    CSV.foreach(@csv_file_path, csv_options) do |row|
      row[:name] = row['name']
      row[:id]   = row['id'].to_i
      row[:age]  = row['age'].to_i
      row[:disease] = row['disease']
      row[:cured] = row['cured'] == 'true'

      # Nós precisamos achar o Quarto com o id que veio
      # na coluna room_id...

      # Quem é que sabe de todos os quartos que existem?
      # O RoomRepository
      row[:room] = @room_repository.find(row['room_id'].to_i)

      patient = Patient.new(row)
      @patients << patient
    end
  end

end
