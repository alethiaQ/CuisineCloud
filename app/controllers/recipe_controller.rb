class RecipeController < ApplicationController
  get "/recipes" do
    if logged_in?
      erb :'/recipes/index'
    else
      redirect to "/login"
    end
  end

  get "/recipes/new" do
    if logged_in?
      erb :'/recipes/new'
    else
      redirect to "login"
    end
  end

  post "/recipes" do
    if logged_in?
      if params["Name"] == ""
        redirect to "/recipes/new"
      else
        @recipe = Recipe.create(params)
        @recipe.user = User.find_by(params[:user_id])
        @recipe.save
        redirect "/recipes/#{@recipe.id}"
      end
    else
      redirect to "/login"
    end
  end

  get "/recipes/:id" do
    if logged_in?
      @recipe = Recipe.find_by_id(params[:id])
      erb :'/recipes/show'
    else
      redirect to "/login"
    end
  end

  get "/recipes/:id/edit" do
    if logged_in?
      @recipe = Recipe.find_by_id(params[:id])
      if @recipe && current_user.recipes.include?(@recipe)
        erb :'/recipes/edit'
      else
        redirect to "/"
      end
    else
      redirect to "/login"
    end
  end

  patch "/recipes/:id" do
    if logged_in?
      if params[:name] == ""
        redirect to "/recipes/#{params[:id]}/edit"
      else
        @recipe = Recipe.find_by_id(params[:id])
        if @recipe && current_user.recipes.include?(@recipe)
          @recipe.update(params[:recipe])

          @recipe.save
          redirect "/recipes/#{@recipe.id}"
        end
      end
    else
      redirect to "/login"
    end
  end

  delete "/recipes/:id/delete" do
    if logged_in?
      @recipe = Recipe.find_by_id(params[:id])
      if @recipe && current_user.recipes.include?(@recipe)
        @recipe.delete
      end
      redirect to "/"
    else
      redirect to "/login"
    end
  end
end
