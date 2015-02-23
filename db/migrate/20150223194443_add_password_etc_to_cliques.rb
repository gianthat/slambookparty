class AddPasswordEtcToCliques < ActiveRecord::Migration
  def change
  	  	add_column :cliques, :password, :string
  	    add_column :cliques, :clue, :text
  end
end
