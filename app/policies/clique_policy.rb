class CliquePolicy < ApplicationPolicy

def index?
    true
end

def show?
	user.present? && clique.users.exists?(user.id)
end

 def create?
    true
 end

def update?
	user.present? && clique.queen_bee == user
end

private
	
	def clique
		record
	end

end