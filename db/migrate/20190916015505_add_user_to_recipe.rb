class AddUserToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :user, :string
  end
end
