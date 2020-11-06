require_relative '../views/orders_view'
require_relative '../models/order'

class OrdersController

  def initialize(meal_repository, customer_repository, employee_repository, order_repository)
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @order_repository = order_repository

    @view = OrdersView.new
  end

  def add
    # 1) Mostrar todas as meals com os index + 1
    # 2) Pegar a meal_index -1
    meal_index = @view.list_and_ask_for_meals(@meal_repository.all)

    # 3) Mostrar todos os customers com os index + 1
    # 4) Pegar o customer_index -1
    customer_index = @view.list_and_ask_for_customers(@customer_repository.all)

    # 5) Mostrar todos os employees "delivery_guys" com os index + 1
    # 6) Pegar o employee_index -1
    employee_index = @view.list_and_ask_for_employees(@employee_repository.all_delivery_guys)

    order = Order.new(
      meal: @meal_repository.all[meal_index],
      customer: @customer_repository.all[customer_index],
      employee: @employee_repository.all_delivery_guys[employee_index]
    )

    @order_repository.create(order)
  end

  def list_undelivered_orders
    orders = @order_repository.undelivered_orders

    @view.display_orders(orders)
  end

  def list_my_orders(employee)
    orders = @order_repository.undelivered_orders

    orders = orders.select do |order|
      order.employee == employee
    end

    @view.display_orders(orders)

    orders
  end

  def mark_as_delivered(employee)
    my_orders = list_my_orders(employee)
    order_index = @view.ask_for_order_index

    order = my_orders[order_index]

    @order_repository.mark_as_delivered(order)
  end

end
