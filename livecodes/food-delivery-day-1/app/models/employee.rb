class Employee

  attr_accessor :id
  attr_reader :username, :password, :role

  def initialize(attributes = {})
    @id = attributes[:id]
    @username = attributes[:username]
    @password = attributes[:password]
    @role = attributes[:role]
  end

  def manager?
    @role == 'manager'
  end

  def delivery_guy?
    @role == 'delivery_guy'
  end

end

# milene = Employee.new(
#   id: 1,
#   username: "milene.kawaii",
#   password: "ilovekoreandrama",
#   role: 'manager'
# )

# puts milene.manager?
# puts milene.delivery_guy?

# pedro = Employee.new(
#   id: 1,
#   username: "pedro.fogao",
#   password: "ilovedatascience",
#   role: 'delivery_guy'
# )

# puts pedro.manager?
# puts pedro.delivery_guy?
