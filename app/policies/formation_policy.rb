class FormationPolicy < ApplicationPolicy
  def index?
    user.has_any_role?(:admin, :secretaria)
  end

  def show?
    if user.has_any_role?(:admin, :secretaria)
      return true
    else
      record.teachers.include?(user.teacher) || record.created_by == user
    end
  end

  def create?
    user.has_any_role?(:admin, :secretaria, :docente)
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

  def assign_dedication?
    user.has_any_role?(:admin, :secretaria)
  end

  def destroy?
    user.has_any_role?(:admin, :secretaria)
  end
  
  def delete?
    user.has_any_role?(:admin, :secretaria)
  end
end