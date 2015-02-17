# == Schema Information
#
# Table name: slambooks
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  clique_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Slambook < ActiveRecord::Base

	belongs_to :clique
	has_many :pages, dependent: :destroy

	after_create :create_default_pages

	def create_default_pages
		#create a free page
		#create a page for the owner
	end

end
