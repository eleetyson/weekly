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
  post '/signup' do
    puts params
  end

end
