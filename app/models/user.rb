class User < ActiveRecord::Base
  has_secure_password
  has_many :cook_books
  has_many :recipes, through: :cook_books
end
