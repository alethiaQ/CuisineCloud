class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :ingredients
      t.string :cook_time
      t.text :instructions
      t.timestamps null: false
    end
  end
end
