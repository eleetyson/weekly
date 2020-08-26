class ApplicationController < Sinatra::Base

# set where the controllers should look for views
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

# route renders view to segment by user or content category if user is logged in
# redirects to login if not
  get '/explore' do
    if logged_in?
      erb :'/categories/explore'
    else
      redirect '/login'
    end
  end

  # route renders view to segment by user if user is logged in
  # redirects to login if not
  get '/explore/users' do
    if logged_in?
      erb :'/categories/users'
    else
      redirect '/login'
    end
  end

  helpers do
    def current_user # helper method that returns the current user instance
      User.find_by_id(session[:user_id])
    end

    def logged_in? # helper method that returns whether the current user is logged in
      !!session[:user_id]
    end
  end

end
