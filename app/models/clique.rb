# == Schema Information
#
# Table name: cliques
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  queen_bee_id :integer
#

class Clique < ActiveRecord::Base

	has_one :slambook, dependent: :destroy

	validates :name, presence: true
	validates :name, uniqueness: true

	after_create :create_slambook

	def create_slambook
		Slambook.create(clique_id: id)
	end

	#after a new user joins the clique, a page should be created for her in the slambook

end
