require_relative '../views/customers_view'

class CustomersController
  def initialize(customer_repo)
    @customer_repo = customer_repo
    @view = CustomersView.new
  end

  def list
    # Pegar o repo.all
    customers = @customer_repo.all
    # Através da view, mostrar o meu repo.all
    @view.display(customers)
  end

  def add
    # Através da view, pedir pro(pra) usuário(a) o nome e o preço
    name = @view.ask_for('name')
    address = @view.ask_for('address')
    # Criar uma nova instância de customer
    customer = Customer.new(name: name, address: address)
    # Enviar essa instância para o método create do repo
    @customer_repo.create(customer)
  end
end
