class CookBookRecipe < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :cook_book
end
