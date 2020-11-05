require_relative '../views/meals_view'

class MealsController
  def initialize(meal_repo)
    @meal_repo = meal_repo
    @view = MealsView.new
  end

  def list
    # Pegar o repo.all
    meals = @meal_repo.all
    # Através da view, mostrar o meu repo.all
    @view.display(meals)
  end

  def add
    # Através da view, pedir pro(pra) usuário(a) o nome e o preço
    name = @view.ask_for('name')
    price = @view.ask_for('price').to_i
    # Criar uma nova instância de meal
    meal = Meal.new(name: name, price: price)
    # Enviar essa instância para o método create do repo
    @meal_repo.create(meal)
  end
end
