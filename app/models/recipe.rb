class Recipe < ActiveRecord::Base
  has_many :cook_book_recipes
  has_many :cook_books, through: :cook_book_recipes
  has_many :users, through: :cook_books
end
