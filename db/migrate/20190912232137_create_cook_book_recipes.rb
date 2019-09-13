class CreateCookBookRecipes < ActiveRecord::Migration
  def change
    create_table :cook_book_recipes do |t|
      t.integer :recipe_id
      t.integer :cook_book_id
      t.timestamps null: false
    end
  end
end
