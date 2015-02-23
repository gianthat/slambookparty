# == Schema Information
#
# Table name: cliques
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  queen_bee_id :integer
#  password     :string(255)
#  clue         :text(65535)
#

class Clique < ActiveRecord::Base

	has_one :slambook, dependent: :destroy
	has_and_belongs_to_many :users

	validates :name, presence: true
	validates :name, uniqueness: true

	validates :password, confirmation: true
	validates :password_confirmation, presence: true

	validates :clue, presence: true

	after_create :create_slambook
	after_create :add_queen_bee

	attr_accessor :password_confirmation, :password_attempt

	def queen_bee
		User.find_by(id: self.queen_bee_id)
	end

	def create_slambook
		Slambook.create(clique_id: id)
	end

	def add_queen_bee
		self.users << self.queen_bee
	end

end
