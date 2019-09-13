class CookBookController < ApplicationController
  get "/cookbooks/new" do
    erb :'/cookbooks/new' if logged_in?
  end
  get "/cookbooks/:id/edit" do
    @book = CookBook.find_by(params[:id])
    erb :'/cookbooks/edit'
  end
  post "/cookbooks/:id" do
    @book = CookBook.find_by(params[:id])
    #error message needed
    @book.update(params)
    redirect "/cookbooks/#{@book.id}"
  end

  get "/cookbooks/:id" do
    @book = CookBook.find_by(params[:id])
    erb :'/cookbooks/show'
  end
  post "/cookbooks/new" do
    @book = CookBook.create(params) if logged_in?
    redirect "/cookbooks/#{@book.id}"
  end
end
