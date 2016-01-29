class GasPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @gas = model
  end

  def index?
    true
  end

  def show?
    true
  end

  def new?
    @current_user.admin? || @current_user.user?
  end

  def create?
    @current_user.admin? || @current_user.user?
  end

  def edit?
    @current_user.admin? || @current_user.user?
  end

  def update?
    @current_user.admin? || @current_user.user?
  end

  def destroy?
    @current_user.admin? || @current_user.user?
  end

end
