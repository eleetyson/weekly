class PostsController < ApplicationController

# renders a view displaying the 5 most recent posts, assuming the user is logged in
  get 'posts' do
    if logged_in?
      # erb :'posts/something_here'
    else
      erb :'/users/login'
    end
  end

end
