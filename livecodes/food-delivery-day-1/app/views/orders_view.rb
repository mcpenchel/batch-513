class OrdersView

  def ask_for_order_index
    puts "Which order did you just deliver? Provide the number."
    gets.chomp.to_i - 1
  end

  def display_orders(orders)
    orders.each_with_index do |order, index|
      puts "#{index + 1}: #{order.meal.name} to be delivered to #{order.customer.name} by #{order.employee.username}"
    end
  end

  def list_and_ask_for_meals(meals)
    meals.each_with_index do |meal, index|
      puts "#{index + 1}: #{meal.name}"
    end
    puts "Which meal do you want? Provide the number"
    gets.chomp.to_i - 1
  end

  def list_and_ask_for_customers(customers)
    customers.each_with_index do |customer, index|
      puts "#{index + 1}: #{customer.name}"
    end
    puts "Which customer do you want? Provide the number"
    gets.chomp.to_i - 1
  end

  def list_and_ask_for_employees(employees)
    employees.each_with_index do |employee, index|
      puts "#{index + 1}: #{employee.username}"
    end
    puts "Which employee do you want? Provide the number"
    gets.chomp.to_i - 1
  end

end
