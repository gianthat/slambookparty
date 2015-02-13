class CreateSlambooks < ActiveRecord::Migration
  def change
    create_table :slambooks do |t|
      t.string :name
	  t.integer :clique_id
      t.timestamps null: false
    end
  end
end
