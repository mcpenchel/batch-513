class Patient

  attr_reader :name, :age, :disease
  attr_accessor :room, :id

  def initialize(attributes = {})
    @name = attributes[:name]
    @age  = attributes[:age]
    @disease = attributes[:disease]
    @cured = attributes[:cured] || false
    @id    = attributes[:id]
    @room  = attributes[:room]
  end

  def cure!
    @cured = true
  end

  def cured?
    @cured
  end

end

# vinicius = Patient.new(name: "Vinicius", age: 35, disease: "Headache")

# puts vinicius.cured?
# vinicius.cure!
# puts vinicius.cured?


# cured = true || false # => true
# false || false # => false
# cured = nil || false # => false
# "shrubbles" || false # => "shrubbles"
