class UserPolicy < ApplicationPolicy

	def homeroom?
		return true if user.present? && user.admin?
		user.present? && user == record
	end

	def show?
		return true if user.present? && user.admin?
		user.present? && user == record
	end

	def update?
		user.present? && user == record
    end

end