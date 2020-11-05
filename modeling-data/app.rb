require_relative 'patient'

require_relative 'room_repository'
require_relative 'patient_repository'

room_repo = RoomRepository.new('rooms.csv')
patient_repo = PatientRepository.new('patients.csv', room_repo)

# Por simplicidade, executei funções que estariam no controller
# dentro deste arquivo, para vermos se o save_csv e o load_csv
# estavam funcionando :ok

patient_repo.all.each do |patient|
  puts "#{patient.name} está internado em #{patient.room.number}"
end

janis = Patient.new(
  name: "Janis Joplin",
  age: 66,
  disease: "Sore throat"
)

room_99 = room_repo.all.last

room_99.add_patient(janis)

patient_repo.add(janis)
