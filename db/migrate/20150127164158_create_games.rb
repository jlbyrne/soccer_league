class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
    	t.date :date, :null => false
    	t.references :home_team, :null => false
    	t.references :away_team, :null => false
    	t.integer :home_score
    	t.integer :away_score
        t.references :winner
        t.references :address

    	t.timestamps
    end
  end
end
