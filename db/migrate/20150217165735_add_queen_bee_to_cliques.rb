class AddQueenBeeToCliques < ActiveRecord::Migration
  def change
  	    add_column :cliques, :queen_bee_id, :integer
  end
end
