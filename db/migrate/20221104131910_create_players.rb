class CreatePlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :age
      t.boolean :active
      t.integer :sport_id
      t.timestamps
    end
  end
end
