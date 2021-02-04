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
        @post = Post.create(title: params[:title], conent: params[:content])
    end

    #show
    get '/posts/:id' do
        @post = Post.find(params[:id])
    end
end