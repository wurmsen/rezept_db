class CreateRecipes < ActiveRecord::Migration
  def self.up
    create_table :recipes do |t|
      t.string  :name,       :null => false
      t.text    :directions, :null => false
      t.text    :footnotes
      t.integer :user_id,    :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :recipes
  end
end
