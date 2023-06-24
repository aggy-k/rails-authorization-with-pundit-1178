class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      # scope -> Restaurant
      # scope.all
      # scope.where(user: @user)
      user.admin? ? scope.all : scope.where(user: user)
    end
  end

  def approve?
    # the logic here
  end

  def show?
    true
  end

  def new?
    create?
  end

  def create?
    true
  end

  def edit?
    update?
  end

  def update?
    # @record.user == @user
    # user.admin? || record.user == user
    admin_or_owner?
  end

  def destroy?
    admin_or_owner?
  end

  private
    def admin_or_owner?
      user.admin? || record.user == user
    end
end
