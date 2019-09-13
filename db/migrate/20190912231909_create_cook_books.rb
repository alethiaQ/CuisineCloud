class CreateCookBooks < ActiveRecord::Migration
  def change
    create_table :cook_books do |t|
      t.string :name
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
