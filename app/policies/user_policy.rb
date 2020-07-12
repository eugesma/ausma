class UserPolicy < ApplicationPolicy

  def index?
    user.has_any_role?(:admin, :secretaria, :docente)
  end

  def create?
    user.has_any_role?(:admin, :secretaria)
  end

  def new?
    self.create?
  end

  def update?
    user.has_any_role?(:admin, :secretaria)
  end

  def edit_permissions?
    self.update? 
  end

  def show?
    self.index?
  end

  def edit?
    self.update?
  end

  def show_top_brand?
    unless user.has_any_role?(:admin, :secretaria)
      user.has_role?(:docente)
    end
  end

  def update_permissions?
    if ( record.has_role? :admin ) && ( record == user )
      return true
    elsif record.has_role? :admin
      return false
    end
  end

  def edit_permissions?
    self.update_permissions?
  end
end
