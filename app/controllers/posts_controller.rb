class PostsController < ApplicationController

# renders a view displaying the x most recent posts, assuming the user is logged in
  get '/posts' do
    if logged_in?
      erb :'/posts/index'
    else
      flash[:message] = "please login"
      erb :'/users/login'
    end
  end

# renders a view with a form to create new post
  get '/posts/new' do
    if logged_in?
      erb :'/posts/new'
    else
      flash[:message] = "please login"
      erb :'/users/login'
    end
  end

# using the params from form on the new.erb view
  post '/posts' do

  end

# renders a view with all of a user's posts
  get '/posts/:id' do

  end

end
