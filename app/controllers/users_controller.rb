class UsersController < ApplicationController

# render the login view unless user has already logged in
  get '/login' do
    if logged_in?
      redirect '/posts'
    else
      erb :'/users/login'
    end
  end

# if valid login credentials, log the user in and redirect to feed
# if invalid, explain the error, and redirect to the login view
  post '/login' do
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/posts'
    else
      if !@user
        flash[:message] = "username does not exist"
      else
        flash[:message] = "incorrect password"
      end
      redirect '/login'
    end

  end

# renders the signup view unless user is currently logged in
  get '/signup' do
    if logged_in?
      # flash[:message] = "You'll need to log out before trying to create another account"
    else
      erb :'users/signup'
    end
  end

# if valid inputs, store the user's credentials, log them in, and redirect to feed
# if invalid, explain the error, and redirect to the signup view

# also account for new display name input
  post '/signup' do
    if !params[:name] || !params[:username] || !params[:password]
      flash[:message] = "missing fields"
    elsif
      # don't want special characters in name field
      "test"
    else
      # store credentials, log in, and redirect to '/posts'
      "test"
    end
  end

end
