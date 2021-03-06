# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  first_name             :string(255)
#  last_name              :string(255)
#  pen_color              :string(255)      default("black")
#  admin                  :boolean          default("0")
#

class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	:recoverable, :rememberable, :trackable, :validatable

	validates :email, presence: true
	validates :email, uniqueness: true
	validates :first_name, presence: true
	validates :last_name, presence: true

	has_many :entries
	has_and_belongs_to_many :cliques

	PEN_COLORS = ["pink", "orange", "green", "blue", "purple", "black"]

	def name_with_initial
		"#{first_name} #{last_name[0]}"
	end

	def full_name
		"#{first_name} #{last_name}"
	end

end
