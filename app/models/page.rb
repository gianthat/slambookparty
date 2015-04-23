# == Schema Information
#
# Table name: pages
#
#  id          :integer          not null, primary key
#  slambook_id :integer
#  page_type   :string(255)
#  title       :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Page < ActiveRecord::Base
	belongs_to :slambook
	has_many :entries
	validates :title, presence: true

	PAGE_TYPES = ["free", "question", "member"]

	def next
		array = self.slambook.pages_in_order
		page_index = array.index(self)
		array[page_index + 1]
	end

	def previous
		array = self.slambook.pages_in_order
		page_index = array.index(self)
		if page_index == 0
			nil
		else 
			array[page_index - 1]
		end
	end

	def back_url
		if self.previous == nil
			"/slambooks/#{self.slambook.id}"
		else
			"/pages/#{self.previous.id}"
		end
	end

	def next_url
		if self.next == nil
			"/pages/new?slambook_id=#{self.slambook.id}"
		else
			"/pages/#{self.next.id}"
		end
	end
	
end
