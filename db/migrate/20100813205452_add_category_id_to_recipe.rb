class AddCategoryIdToRecipe < ActiveRecord::Migration
  def self.up
    add_column :recipes, :category_id, :integer
  end

  def self.down
    remove_column :recipes, :category_id
  end
end
