class UsersController < ApplicationController

# render the login view unless user has already logged in
  get '/login' do
    if logged_in?
      redirect '/posts'
    else
      erb :'/users/login'
    end
  end

# if valid login credentials, log the user in and redirect to home screen with feed
# if invalid, explain the error, and redirect back to the login view
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

end
