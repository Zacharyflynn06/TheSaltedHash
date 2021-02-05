class PostController < ApplicationController

    get '/posts' do
        @post = Post.all 
        erb :"posts/index"
    end

    get '/posts/new' do
        erb :'posts/new'
    end

    post '/posts' do
        puts params
        binding.pry
        @post = Post.create(
            title: params[:posts][:title], 
            content: params[:posts][:content],
            date: DateTime.now
        )
    end

    #show
    get '/posts/:id' do
        @post = Post.find(params[:id])
    end
end