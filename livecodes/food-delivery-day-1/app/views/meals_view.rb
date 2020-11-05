class MealsView
  def display(meals)
    meals.each do |meal|
      puts "#{meal.id}: #{meal.name} for #{meal.price} USD"
    end
  end

  def ask_for(attribute)
    puts "What is the #{attribute} of the meal?"
    gets.chomp
  end
end
