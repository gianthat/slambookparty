class CliquePolicy < ApplicationPolicy

def index?
    true
end

def show?
	return true if user.present? && user.admin?
	user.present? && clique.users.exists?(user.id)
end

 def create?
    true
 end

def update?
	return true if user.present? && user.admin?
	user.present? && clique.queen_bee == user
end

def destroy?
	return true if user.present? && user.admin?
	user.present? && clique.queen_bee == user
end

def join?
	true
end

def join_clique?
	true
end

def leave_clique?
	true
end

private
	
	def clique
		record
	end

end