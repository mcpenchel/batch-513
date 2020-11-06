class Router

  def initialize(meals_controller, customers_controller, sessions_controller, orders_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @orders_controller = orders_controller

    @running = true
  end

  def run
    while @running
      @employee = @sessions_controller.sign_in

      while @employee # isso vai continuar rodando até @employee ser nil ou false
        if @employee.manager?
          display_manager_tasks
          user_action = gets.chomp
          route_to_manager(user_action)
        elsif @employee.delivery_guy?
          display_delivery_tasks
          user_action = gets.chomp
          route_to_delivery(user_action)
        end
      end
    end
  end

  def display_manager_tasks
    puts "1 - add a new meal"
    puts "2 - list all the meals"
    puts "3 - add a new customer"
    puts "4 - list all the customers"
    puts "5 - add a new order"
    puts "6 - list all undelivered orders"
    puts "8 - sign out"
    puts "9 - exit"
  end

  def display_delivery_tasks
    puts "1 - mark one of my orders as delivered"
    puts "2 - list all my undelivered orders"
    puts "8 - sign out"
    puts "9 - exit"
  end

  def route_to_manager(user_action)
    case user_action
    when "1" then @meals_controller.add
    when "2" then @meals_controller.list
    when "3" then @customers_controller.add
    when "4" then @customers_controller.list
    when "5" then @orders_controller.add
    when "6" then @orders_controller.list_undelivered_orders
    when "8" then @employee = nil
    when "9"
      @running  = false
      @employee = nil
    end
  end

  def route_to_delivery(user_action)
    case user_action
    when "1" then @orders_controller.mark_as_delivered(@employee)
    when "2" then @orders_controller.list_my_orders(@employee)
    when "8" then @employee = nil
    when "9"
      @running  = false
      @employee = nil
    end
  end
end
