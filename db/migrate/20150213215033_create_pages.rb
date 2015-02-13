class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.integer :slambook_id
      t.string :type
      t.string :title

      t.timestamps null: false
    end
  end
end
