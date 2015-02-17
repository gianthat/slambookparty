class AddIndexToEntries < ActiveRecord::Migration
  def change
  	add_index :entries, :page_id
  	add_index :entries, :user_id
  end
end
