# == Schema Information
#
# Table name: cliques
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Clique < ActiveRecord::Base

	has_one :slambook, dependent: :destroy

end
