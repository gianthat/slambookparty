class PagePolicy < ApplicationPolicy

  def index?
    user.present? && user.admin?
  end

  def show?
	return true if user.present? && user.admin?
	record.slambook.clique.users.exists?(user.id)
  end

  def rails_show?
    true
  end

  def create?
    true
  end

  def destroy?
	user.present? && user.admin?
  end

end