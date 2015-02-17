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

	PAGE_TYPES = ["free", "question", "person"]
	
end
