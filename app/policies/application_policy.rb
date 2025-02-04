class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    super_admin?
  end

  def show?
    super_admin? || owner?
  end

  def create?
    super_admin?
  end

  def new?
    create?
  end

  def update?
    super_admin? || owner?
  end

  def edit?
    update?
  end

  def destroy?
    super_admin?
  end

  private

  def super_admin?
    user&.super_admin?
  end

  def owner?
    record.respond_to?(:user) && record.user == user
  end

  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.super_admin?
        scope.all
      else
        scope.where(user: user)
      end
    end
  end
end
