class PostsController < ApplicationController

# renders a view displaying the main feed with all posts
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

# if valid inputs, create the post and redirect to feed
# if given dead link or otherwise invalid inputs, redirect to post creation form with error message
  post '/posts' do
    if logged_in?

      if !API.new.valid_link?(params[:link])
        flash[:message] = "invalid link"
      end

      post = Post.new(params)
      if post.valid?
        post.user = current_user
        post.save
        redirect '/posts'
      elsif params[:medium].empty? || params[:title].empty? || params[:link].empty?
        flash[:message] = "complete all fields"
        redirect '/posts/new'
      end

    else
      flash[:message] = "please login"
      erb :'/users/login'
    end
  end

# if user created the post, renders a view with a form to edit
# if not,
  get '/posts/:id' do
    # erb :'posts/show'
  end

end
