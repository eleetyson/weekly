class ApplicationController < Sinatra::Base

# set where the controllers should look for views and views should look for the stylesheet
# enable sessions
  configure do
    set :views, 'app/views'
    set :public_dir, 'public'
    enable :sessions
    set :session_secret, "pw_security"
  end

# using the Sinatra Flash gem to display custom error messages
  register Sinatra::Flash

# route for root redirects home page if user is logged in
# redirects to signup if not
  get '/' do
    if logged_in?
      redirect '/posts'
    else
      redirect '/signup'
    end
  end

# helper methods
  helpers do
    def current_user # helper method that returns the current user instance
      User.find_by_id(session[:user_id])
    end

    def logged_in? # helper method that returns whether the current user is logged in
      !!session[:user_id]
    end
  end

# ROUTES BELOW AREN'T CRITICAL TO CORE APPLICATION
# route renders view to segment by user or content category if user is logged in
  get '/explore' do
    if logged_in?
      erb :'/categories/explore'
    else
      redirect '/login'
    end
  end

# route renders view to segment by user if user is logged in
  get '/explore/users' do
    if logged_in?
      erb :'/categories/users'
    else
      redirect '/login'
    end
  end

# route renders view to segment by content category if user is logged in
  get '/explore/posts' do
    if logged_in?
      erb :'/categories/posts'
    else
      redirect '/login'
    end
  end

# route renders view with all posts for a given content category is user is logged in
  get '/explore/posts/:category' do
    if logged_in?
      erb :"/categories/#{params[:category]}"
    else
      redirect '/login'
    end
  end

end
