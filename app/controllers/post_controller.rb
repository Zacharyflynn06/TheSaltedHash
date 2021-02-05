class PostController < ApplicationController

    get '/posts' do
        @posts = Post.all 
        erb :"posts/index"
    end

    get '/posts/new' do
        erb :'posts/new'
    end

    post '/posts' do
        binding.pry
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