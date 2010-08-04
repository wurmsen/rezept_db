class CreateIngredients < ActiveRecord::Migration
  def self.up
    create_table :ingredients do |t|
      t.string  :name,      :null => false
      t.integer :recipe_id, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :ingredients
  end
end
