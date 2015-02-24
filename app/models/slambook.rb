# == Schema Information
#
# Table name: slambooks
#
#  id         :integer          not null, primary key
#  clique_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Slambook < ActiveRecord::Base

	belongs_to :clique
	has_many :pages, dependent: :destroy

	after_create :create_default_pages

	def create_default_pages
		self.pages.create(title: "Free page, write anything you want!", page_type: "free")
		self.pages.create(title: "All About #{self.clique.queen_bee.name_with_initial}", page_type: "member")
	end

	def name
		"#{self.clique.name} Slambook"
	end

	def pages_in_order
		question_pages = self.pages.where(page_type: "question")
		member_pages = self.pages.where(page_type: "member")
		free_page = self.pages.where(page_type: "free")
		question_pages + member_pages + free_page
	end

end
