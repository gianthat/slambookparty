class AddAnonymousToEntry < ActiveRecord::Migration
  def change
  	add_column :entries, :anonymous, :boolean, :default => false
  end
end
