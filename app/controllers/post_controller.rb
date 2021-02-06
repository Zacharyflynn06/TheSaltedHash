class PostController < ApplicationController

    get '/posts' do
        redirect_if_not_logged_in
        puts current_user
            @posts = Post.all 
            erb :"posts/index"
    end

    get '/home' do
        redirect_if_not_logged_in
            @user = User.find(session["user_id"])
            @user_posts = @user.posts
            erb :"posts/home"  
    end

    get '/posts/new' do
        redirect_if_not_logged_in
            erb :'posts/new'
    end

    get '/posts/:id' do
        redirect_if_not_logged_in
            @post = Post.find(params[:id])
            erb :"posts/show"
    end

    get '/posts/:id/edit' do
        redirect_if_not_logged_in
        # redirect_error_if_not_authorized
            @post = Post.find(params[:id])
            erb :"posts/edit"
    end

    post '/posts' do
        redirect_if_not_logged_in
        @post = Post.create(
            title: params[:posts][:title], 
            content: params[:posts][:content],
            user_id: session[:user_id]
        )
        redirect '/posts/#{post.id}'
    end

    patch '/posts/:id' do
        redirect_if_not_logged_in
        #redirect_error_if_not_authorized
            post = Post.find(params[:id])
            post.update(params["post"])
            redirect "/posts/#{post.id}"
    end
end