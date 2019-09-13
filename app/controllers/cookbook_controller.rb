class CookBookController < ApplicationController
  get "/cookbooks" do
    if logged_in?
      erb :'/cookbooks/index'
    else
      redirect to "/login"
    end
  end

  get "/cookbooks/new" do
    if logged_in?
      erb :'/cookbooks/new'
    else
      redirect to "/login"
    end
  end
  get "/cookbooks/:id" do
    if logged_in?
      @book = CookBook.find_by_id(params[:id])
      erb :'/cookbooks/show'
    else
      redirect to "/login"
    end
  end

  post "/cookbooks" do
    if logged_in?
      if params["Name"] == ""
        redirect to "/cookbooks/new"
      else
        @book = CookBook.create(name: params["Name"], description: params[:description])
        @book.user = current_user
        @book.save
        redirect "/cookbooks/#{@book.id}"
      end
    else
      redirect to "/login"
    end
  end

  get "/cookbooks/:id/edit" do
    if logged_in?
      @book = CookBook.find_by_id(params[:id])
      if @book && current_user.cook_books.include?(@book)
        erb :'/cookbooks/edit'
      else
        redirect to "/"
      end
    else
      redirect to "/login"
    end
  end
  patch "/cookbooks/:id" do
    if logged_in?
      if params[:name] == ""
        redirect to "/cookbooks/#{params[:id]}/edit"
      else
        @book = CookBook.find_by_id(params[:id])
        if @book && current_user.cook_books.include?(@book)
          #error message needed
          @book.update(params[:cookbook])
          @book.description = params[:cookbook][:description]
          @book.save
          redirect "/cookbooks/#{@book.id}"
        end
      end
    else
      redirect "/login"
    end
  end

  delete "/cookbooks/:id/delete" do
    if logged_in?
      @book = CookBook.find_by_id(params[:id])
      if @book && current_user.cook_books.include?(@book)
        @book.delete
      end
      redirect to "/"
    else
      redirect to "/login"
    end
  end
end
