class SessionsView

  def ask_for(attribute)
    puts "> #{attribute}?"
    gets.chomp
  end

  def welcome(employee)
    puts "Welcome #{employee.username.capitalize}!"
  end

  def wrong_credentials
    puts "Wrong credentials... Try again!"
  end

end
