class DropNameFromSlambooks < ActiveRecord::Migration
  def change
  	remove_column :slambooks, :name
  end
end
