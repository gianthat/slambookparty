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

end
