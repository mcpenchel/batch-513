class CustomersView
  def display(customers)
    customers.each do |customer|
      puts "#{customer.id}: #{customer.name} living at #{customer.address}"
    end
  end

  def ask_for(attribute)
    puts "What is the #{attribute} of the customer?"
    gets.chomp
  end
end
