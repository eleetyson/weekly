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
# if invalid, redirect to login with error explanation
  post '/login' do
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/posts'
    else
      if !@user
        flash[:message] = "username doesn't exist"
      else
        flash[:message] = "incorrect password"
      end
      redirect '/login'
    end

  end

# renders the signup view unless user is currently logged in
  get '/signup' do
    if logged_in?
      redirect '/posts'
    else
      erb :'/users/signup'
    end
  end

# if valid inputs, store the user's credentials, log them in, and redirect to feed
# if invalid, redirect to signup with error explanation
  post '/signup' do
    puts params
    user = User.new(params)

    if user.name.length > 20 # for display purposes, limit length of user display name
      flash[:message] = "display name too long"
      redirect '/signup'
    elsif user.valid? # validating presence and uniqueness of inputs
      user.save
      session[:user_id] = user.id
      redirect '/posts'
    elsif params[:name].empty? || params[:username].empty? || params[:password].empty?
      flash[:message] = "complete all fields"
      redirect '/signup'
    else
      flash[:message] = user.errors.full_messages
      redirect '/signup'
    end
  end

# render a view with all posts by the given user
# otherwise, redirect to home screen or login page with error explanation
  get '/users/:username' do
    if !logged_in?
      flash[:message] = "please login"
      redirect '/login'
    else
      @user_of_profile = User.find_by(username: params[:username])
      erb :'/users/show'
    end
  end

# clear the session and redirect to login page upon logout
  get '/logout' do
    session.clear
    redirect '/login'
  end

end
