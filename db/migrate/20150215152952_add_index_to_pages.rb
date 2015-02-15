class AddIndexToPages < ActiveRecord::Migration
  def change
    add_index :pages, :slambook_id
  end
end
