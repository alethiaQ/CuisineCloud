class CookBook < ActiveRecord::Base
  belongs_to :user
  has_many :cook_book_recipes
  has_many :recipes, through: :cook_book_recipes
end
