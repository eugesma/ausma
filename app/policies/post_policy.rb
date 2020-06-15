class PostPolicy < ApplicationPolicy
  def index?
    user.has_any_role?(:admin, :secretaria, :docente)
  end

  def show?
    index?
  end

  def create?
    user.has_any_role?(:admin, :secretaria, :docente)
  end

  def new?
    create?
  end

  def validate?
    unless record.validado?
      user.has_any_role?(:admin, :secretaria)
    end
  end

  def update?
    if record.created_by == user
      user.has_any_role?(:admin, :secretaria, :docente)
    end
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