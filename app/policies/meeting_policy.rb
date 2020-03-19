class MeetingPolicy < ApplicationPolicy
  def index?
    user.has_any_role?(:admin, :secretaria)
  end

  def show?
    index?
  end

  def create?
    user.has_any_role?(:admin, :secretaria)
  end

  def new?
    create?
  end

  def update?
    user.has_any_role?(:admin, :secretaria)
  end

  def edit?
    update?
  end

  def destroy?
    user.has_any_role?(:admin, :secretaria)
  end
  
  def delete?
    user.has_any_role?(:admin, :secretaria)
  end
end