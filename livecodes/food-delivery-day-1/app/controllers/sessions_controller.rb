require_relative '../views/sessions_view'

class SessionsController

  def initialize(employee_repo)
    @employee_repo = employee_repo
    @view = SessionsView.new
  end

  def sign_in
    # 1) Pedimos o username (view)
    username = @view.ask_for('username')
    # 2) Pedimos a senha (view)
    password = @view.ask_for('password')

    # 3) Encontrar o employee pelo find_by_username(username)
    employee = @employee_repo.find_by_username(username)

    # 4) Se o employee existe && a senha bate
    if employee && employee.password == password
      @view.welcome(employee)
      return employee
    else
      @view.wrong_credentials
      sign_in
    end
  end

end
