class SlambookPolicy < ApplicationPolicy

  def show?
	return true if user.present? && user.admin?
	record.clique.users.exists?(user.id)
  end

  def create?
    true
  end

  def destroy?
	user.present? && user.admin?
  end

end