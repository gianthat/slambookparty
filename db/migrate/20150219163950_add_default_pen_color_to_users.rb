class AddDefaultPenColorToUsers < ActiveRecord::Migration
  def change
  	change_column :users, :pen_color, :string, :default => "black"
  end
end
