class UserController < ApplicationController
  get "/users/:id" do
    if !logged_in?
      redirect "/login"
    end

    @user = User.find(params[:id])
    if !@user.nil? && @user == current_user
      erb :'/users/accountpage'
    else
      redirect "/login"
    end
  end
  get "/signup" do
    if !session[:user_id]
      erb :'/users/signup'
    else
      redirect "/"
    end
  end

  post "/signup" do
    if params[:username] == "" || params[:password] == ""
      redirect "/signup"
    else
      @user = User.create(name: params[:name], username: params[:username], password: params[:password])
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}"
    end
  end

  get "/login" do
    if !session[:user_id]
      erb :'/users/login'
    else
      redirect "/"
    end
  end

  post "/login" do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/users/#{user.id}"
    else
      redirect "/"
    end
  end

  get "/logout" do
    if session[:user_id] != nil
      session.destroy
      redirect "/"
    else
      redirect "/"
    end
  end
end
