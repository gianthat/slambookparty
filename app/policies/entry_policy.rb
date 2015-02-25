class EntryPolicy < ApplicationPolicy

  def show?
    return true if user.present? && user.admin?
    record.slambook.clique.users.exists?(user.id)
  end

  def create?
    return true if user.present? && user.admin?
    record.page.slambook.clique.users.exists?(user.id)
  end

  def update?
    user.present? && user.admin?
  end

  def destroy?
    return true if user.present? && user.admin?
    record.user_id == user.id
  end


end