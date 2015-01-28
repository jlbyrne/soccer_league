class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
    	t.references :team, :null => false
    	t.string :first_name, :null => false
    	t.string :last_name, :null => false
    	t.date :birthday, :null => false
    	t.references :address, :null => false

    	t.timestamps
    end
  end
end
