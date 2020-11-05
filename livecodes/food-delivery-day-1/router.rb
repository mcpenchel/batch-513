class Router
  def initialize(meals_controller, customers_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
  end

  def run
    @running = true

    while @running
      display_tasks
      user_action = gets.chomp
      route_to(user_action)
    end
  end

  def display_tasks
    puts "1 - add a new meal"
    puts "2 - list all the meals"
    puts "3 - add a new customer"
    puts "4 - list all the customers"
    puts "9 - exit"
  end

  def route_to(user_action)
    case user_action
    when "1" then @meals_controller.add
    when "2" then @meals_controller.list
    when "3" then @customers_controller.add
    when "4" then @customers_controller.list
    when "9" then @running = false
    end
  end
end
