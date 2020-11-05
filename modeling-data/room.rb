class Room

  attr_reader :patients, :number, :capacity
  attr_accessor :id

  def initialize(attributes = {})
    @number = attributes[:number]
    @capacity = attributes[:capacity] || 2
    @patients = attributes[:patients] || []
    @id = attributes[:id]
  end

  def full?
    @patients.size >= @capacity
  end

  def add_patient(patient)
    if full?
      raise StandardError, "Room #{@number} at maximum capacity"
    else
      @patients << patient
      patient.room = self # self é a instância de Room
    end
  end

end

# require_relative 'patient'

# ozzy = Patient.new(
#   name: "Ozzy Osbourne",
#   age: 700,
#   disease: "Everything is failing"
# )

# lemmy = Patient.new(
#   name: "Lemmy",
#   age: 80,
#   disease: "Kidney failure"
# )

# vinicius = Patient.new(
#   name: "Vinicius",
#   age: 35,
#   disease: "Headache"
# )

# a32 = Room.new(
#   number: "A-32",
#   capacity: 2
# )

# a99 = Room.new(
#   number: "A-99",
#   capacity: 10
# )

# a32.add_patient(ozzy)
# puts "#{ozzy.name} foi internado..."
# a99.add_patient(lemmy)
# puts "#{lemmy.name} foi internado..."

# puts ozzy.room.full?

# # rock_n_roll_room.add_patient(vinicius)
# # puts "#{vinicius.name} foi internado..."

