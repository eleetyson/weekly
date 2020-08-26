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

      if !API.new.valid_link?(params[:link]) # ensure given link actually works
        flash[:message] = "invalid link"
      end

      post = Post.new(params)
      if post.title.length > 65 # for display purposes, limit length of post's title
        flash[:message] = "title too long"
        redirect '/posts/new'
      elsif post.valid? # validates presence of required inputs
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

# renders a view with a form to view post
# redirects to edit route if post belongs to user
# redirects to main feed if post doesn't exist
  get '/posts/:id' do
    if logged_in?
      @post = Post.find_by_id(params[:id])

      if @post && @post.user == current_user
        redirect "/posts/#{params[:id]}/edit"
      elsif @post
        erb :'/posts/show'
      else
        flash[:message] = "post doesn't exist"
        redirect '/posts'
      end

    else # if not logged in
      flash[:message] = "please login"
      erb :'/users/login'
    end
  end

# if user created the post, renders a view with a form to edit
# if post belongs to another user, provides error message and redirects to different route
# if post doesn't exist, provides error message and redirects to main feed
  get '/posts/:id/edit' do
    if logged_in?
      @post = Post.find_by_id(params[:id])

      if @post && @post.user == current_user
        erb :'/posts/edit'
      elsif @post
        flash[:message] = "no edit access"
        redirect "/posts/#{params[:id]}"
      else
        flash[:message] = "post doesn't exist"
        redirect '/posts'
      end

    else # if not logged in
      flash[:message] = "please login"
      erb :'/users/login'
    end
  end

# updates post if post exists, user is authorized, and user provided valid inputs
# if not, provides error message and redirects accordingly
  patch '/posts/:id' do
    if logged_in?
      @post = Post.find_by_id(params[:id])

      if @post && @post.user == current_user # if post exists and belongs to current user

        if params[:medium].empty? || params[:title].empty? || params[:link].empty?
          flash[:message] = "complete all fields"
          redirect "/posts/#{params[:id]}/edit"
        else # only update post if given valid inputs
          @post.update(title: params[:title], medium: params[:medium], link: params[:link])
          redirect '/posts'
        end

      elsif @post # redirect if post doesn't belong to current user
        flash[:message] = "no access"
        redirect "/posts/#{params[:id]}"
      else
        flash[:message] = "post doesn't exist"
        redirect '/posts'
      end

    else # if not logged in
      flash[:message] = "please login"
      erb :'/users/login'
    end
  end

# if user created the post, renders a view with a form to delete
# if post belongs to another user, provides error message and redirects to different route
# if post doesn't exist, provides error message and redirects to main feed
  get '/posts/:id/delete' do
    if logged_in?
      @post = Post.find_by_id(params[:id])

      if @post && @post.user == current_user
        erb :'/posts/delete'
      elsif @post
        flash[:message] = "no edit access"
        redirect "/posts/#{params[:id]}"
      else
        flash[:message] = "post doesn't exist"
        redirect '/posts'
      end

    else # if not logged in
      flash[:message] = "please login"
      erb :'/users/login'
    end
  end

# deletes post if post exists and user is authorized
# if not, provides error message and redirects accordingly
  delete '/posts/:id' do
    puts params
    if logged_in?
      post = Post.find_by_id(params[:id])

      if post && post.user == current_user # if post exists and belongs to current user
        post.delete
        redirect '/posts'
      elsif post # redirect if post doesn't belong to current user
        flash[:message] = "no edit access"
        redirect "/posts/#{params[:id]}"
      else
        flash[:message] = "post doesn't exist"
        redirect '/posts'
      end

    else # if not logged in
      flash[:message] = "please login"
      erb :'/users/login'
    end
  end

end
