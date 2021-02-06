class PostController < ApplicationController

    get '/posts' do
        redirect_if_not_logged_in
            @posts = Post.all 
            erb :"posts/index"
    end

    get '/home' do
        redirect_if_not_logged_in
    end

    get '/posts/new' do
        erb :'posts/new'
    end

    post '/posts' do
        @post = Post.create(
            title: params[:posts][:title], 
            content: params[:posts][:content],
            user_id: session[:user_id]
        )
        redirect '/posts'
    end

    #show
    get '/posts/:id' do
        @post = Post.find(params[:id])
    end
end