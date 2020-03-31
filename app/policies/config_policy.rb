class ConfigPolicy < ApplicationPolicy
  def show?
    user.has_any_role?(:admin, :secretaria)
  end

  def update?
    user.has_any_role?(:admin, :secretaria)
  end

  def edit?
    update?
  end
end