class PostsController < ApplicationController

# renders a view displaying the x most recent posts, assuming the user is logged in
  get '/posts' do
    if logged_in?
      erb :'/posts/index'
    else
      erb :'/users/login'
    end
  end

# renders a view with a form to create new post
  get '/posts/new' do

  end

# renders a view with all of a user's posts
  get '/posts/:id' do

  end

end
