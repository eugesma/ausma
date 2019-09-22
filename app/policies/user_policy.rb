class UserPolicy < ApplicationPolicy

  def index?
    index_user.any? { |role| user.has_role?(role) }
  end

  def create?
    create_user.any? { |role| user.has_role?(role) }
  end

  def new?
    self.create?
  end

  def update?
    record == user || update.any? { |role| user.has_role?(role) }
  end

  def edit_permissions?
    self.update? 
  end

  def show?
    self.index?
  end

  def show?
    self.create?
  end

  def update_permissions?
    if ( record.has_role? :admin ) && ( record == user )
      return true
    elsif record.has_role? :admin
      return false
    else
      update_permissions.any? { |role| user.has_role?(role) }     
    end
  end

  def edit_permissions?
    self.update_permissions?
  end


  private

  def index_user
    [ :admin, :gestor_usuarios, :secretaria ]
  end

  def create_user
    [ :admin, :gestor_usuarios, :secretaria ]
  end

  def update
    [ :admin, :gestor_usuarios, :secretaria ]
  end

  def update_permissions
    [ :admin, :gestor_usuarios ]
  end
end
