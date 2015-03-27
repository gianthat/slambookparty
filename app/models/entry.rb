# == Schema Information
#
# Table name: entries
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  page_id    :integer
#  content    :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  anonymous  :boolean          default("0")
#

class Entry < ActiveRecord::Base
	belongs_to :page
	belongs_to :user

	validates :content, presence: true
	validates :user_id, presence: true
	validates :page_id, presence: true

	def display_text
		if self.anonymous?
			"#{self.content}"
		else
			"#{self.content} - #{self.user.name_with_initial}"
		end
	end
end
