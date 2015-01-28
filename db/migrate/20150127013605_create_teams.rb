class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
    	t.string :name, :null => false
    	t.string :mascot
    	t.string :color
    	t.integer :players_count, :null => false, :default => 0
    	t.references :address

    	t.timestamps
    end
  end
end
