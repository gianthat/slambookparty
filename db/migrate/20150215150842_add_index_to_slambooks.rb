class AddIndexToSlambooks < ActiveRecord::Migration
  def change
    add_index :slambooks, :clique_id
  end
end
