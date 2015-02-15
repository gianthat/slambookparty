# == Schema Information
#
# Table name: pages
#
#  id          :integer          not null, primary key
#  slambook_id :integer
#  type        :string(255)
#  title       :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Page < ActiveRecord::Base
	belongs_to :slambook
	
end
